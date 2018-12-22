package cn.blogss.common.util;

import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

/**
 * 功能描述:redis 访问工具包
 * @author:LiQiang
 * 2018年12月18日
 */
public class JedisUtil {
	//jedisPool 连接池来获取 redis连接
	@Resource
	private JedisPool jedisPool;
	
	private Jedis getResource() {
		return jedisPool.getResource();
	}

	
	//加入session
	public void set(byte[] key, byte[] value) {
		Jedis jedis = getResource();
		try {
			jedis.set(key, value);
		} finally {
			jedis.close();
		}
	}
	
	//设置指定key的超时时间
	public void expire(byte[] key, int value) {
		Jedis jedis = getResource();
		try {
			jedis.expire(key, value);
		} finally {
			jedis.close();
		}
	}


	//获取session
	public byte[] get(byte[] key) {
		// TODO Auto-generated method stub
		Jedis jedis = getResource();
		try {
			return jedis.get(key);
		} finally {
			jedis.close();
		}
	}

	//删除session
	public void del(byte[] key) {
		Jedis jedis = getResource();
		try {
			jedis.del(key);
		} finally {
			jedis.close();
		}
	}


	
	public Set<byte[]> keys(String SHIRO_SESSION_PREFIX) {
		Jedis jedis = getResource();
		try {
			return jedis.keys((SHIRO_SESSION_PREFIX+"*").getBytes());
		} finally {
			jedis.close();
		}
	}
	
}
