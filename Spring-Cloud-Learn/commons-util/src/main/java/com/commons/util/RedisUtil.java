package com.commons.util;

import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class RedisUtil {

	private static JedisPool jedisPool;

	public static Jedis getJedis(final GenericObjectPoolConfig poolConfig,int dataBaseIndex, String dataBaseName) {
		jedisPool = new JedisPool(final GenericObjectPoolConfig poolConfig, final String host, int port,
			      int timeout, final String password);

		return jedisPool.getResource();
	}
}
