package cn.blogss.session;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;

import cn.blogss.common.util.JedisUtil;
import org.apache.commons.collections.CollectionUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.eis.AbstractSessionDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.SerializationUtils;

/**
 * 功能描述：
 * @author:LiQiang
 * 2018年12月18日
 */
public class RedisSessionDao extends AbstractSessionDAO{
	@Autowired
	private JedisUtil jedisUtil;
	
	private final String SHIRO_SESSION_PREFIX = "mooc-session:";
	
	private byte[] getKey(String key) {
		return (SHIRO_SESSION_PREFIX + key).getBytes();
	}
	
	private void saveSession(Session session) {
		if(session != null && session.getId() != null) {
			byte[] key = getKey(session.getId().toString());
			byte[] value = SerializationUtils.serialize(session);
			jedisUtil.set(key,value);
			jedisUtil.expire(key,600);
		}
	};

	//更新session
	public void update(Session session) throws UnknownSessionException {
		saveSession(session);
	}

	@Override
	public void delete(Session session) {
		System.out.println("delete session....");
		if(session == null || session.getId() == null) {
			return ;
		}
		
		byte[] key = getKey(session.getId().toString());
		jedisUtil.del(key);
	}

	//获得到指定的存活的session
	public Collection<Session> getActiveSessions() {
		// TODO Auto-generated method stub
		Set<byte[]> keys = jedisUtil.keys(SHIRO_SESSION_PREFIX);
		Set<Session> sessions = new HashSet<>();
		if(CollectionUtils.isEmpty(keys)) {
			return sessions;
		}
		for(byte[] key:keys) {
			Session session = (Session)SerializationUtils.deserialize(jedisUtil.get(key));
			sessions.add(session);
		}
		return sessions;
	}

	//创建session
	@Override
	protected Serializable doCreate(Session session) {
		Serializable sessionId = generateSessionId(session);
		assignSessionId(session, sessionId);
		saveSession(session);
		return sessionId;
	}

	//获得session
	@Override
	protected Session doReadSession(Serializable sessionId) {
		// TODO Auto-generated method stub
		System.out.println("read session");
		if(sessionId == null)
			return null;
		byte[] key = getKey(sessionId.toString());
		byte[] value = jedisUtil.get(key);
		return (Session)SerializationUtils.deserialize(value);
	}

}
