package cn.blogss.cache;

import java.util.Collection;
import java.util.Set;

import javax.annotation.Resource;

import cn.blogss.common.util.JedisUtil;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.SerializationUtils;

/**
 * 功能描述：
 * @author:LiQiang
 * 2018年12月20日
 */
public class RedisCache<K,V> implements Cache<K, V>{
	@Autowired
	private JedisUtil jedisUtil;
	private final String CACHE_PREFIX = "imooc-cache:";
	
	private byte[] getKey(K k) {
		if(k instanceof String)
			return (CACHE_PREFIX + k).getBytes();
		return SerializationUtils.serialize(k);
	}
	
	@Override
	public V get(K k) throws CacheException {
		System.out.println("从redis中获取权限数据...");
		byte[] value = jedisUtil.get(getKey(k));
		if(value != null)
			return (V)SerializationUtils.deserialize(value);
		return null;
	}

	@Override
	public Set<K> keys() {
		return null;
	}

	@Override
	public V put(K k, V v) throws CacheException {
		System.out.println("create cache...");
		byte[] key = getKey(k);
		byte[] value = SerializationUtils.serialize(v);
		jedisUtil.set(key, value);
		jedisUtil.expire(key, 600);
		return v;
	}

	@Override
	public V remove(K k) throws CacheException {
		byte[] key = getKey(k);
		byte[] value = jedisUtil.get(key);
		jedisUtil.del(key);
		if(value != null) {
			return (V)SerializationUtils.deserialize(value);
		}
		return null;
	}

	@Override
	public int size() {
		return 0;
	}

	@Override
	public Collection<V> values() {
		return null;
	}

	@Override
	public void clear() throws CacheException {
		
	}

}
