package cn.blogss.cache;

import javax.annotation.Resource;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;

/**
 * 功能描述：
 * @author:LiQiang
 * 2018年12月20日
 */
public class RedisCacheManager implements CacheManager{
	@Resource
	RedisCache redisCache;
	@Override
	public <K, V> Cache<K, V> getCache(String s) throws CacheException {
		// TODO Auto-generated method stub
		return redisCache;
	}

}
