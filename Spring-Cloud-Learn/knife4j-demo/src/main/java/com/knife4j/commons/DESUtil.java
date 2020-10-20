package com.knife4j.commons;

import java.security.InvalidAlgorithmParameterException;
import java.security.Key;
import java.security.MessageDigest;
import java.security.spec.AlgorithmParameterSpec;
import java.util.Locale;

import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;

/**
 * @FileName: DESUtil
 * @Encoding: UTF-8
 * @Package: com.sysongy.api.util
 * @Link: http://www.sysongy.com
 * @Created on: 2016年08月16日, 10:57
 * @Author: dongqiang.wang [wdq_2012@126.com]
 * @Version: V2.0 Copyright(c)陕西司集能源科技有限公司
 * @Description: DES加密解密工具包
 */
public class DESUtil {

	public static final String ALGORITHM_DES = "DES/CBC/PKCS5Padding";

	public static String MD5Encode(byte[] byteArr) {
		String theResult = "";
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			theResult = byteArrayToHexString(md.digest(byteArr));
		} catch (Exception e) {
		}
		return theResult;
	}

	public static String byteArrayToHexString(byte[] byteArr) {
		StringBuffer hexString = new StringBuffer();
		String plainText;

		for (int i = 0; i < byteArr.length; i++) {
			plainText = Integer.toHexString(0xFF & byteArr[i]);
			if (plainText.length() < 2) {
				plainText = "0" + plainText;
			}
			hexString.append(plainText);
		}
		return hexString.toString();
	}

	/**
	 * DES算法，加密
	 *
	 * @param data 待加密字符串
	 * @param key  加密私钥，长度不能够小于8位
	 * @return 加密后的字节数组，一般结合Base64编码使用
	 * @throws InvalidAlgorithmParameterException
	 * @throws Exception
	 */
	public static String encode(String key, String data) {
		if (data == null) {
			return null;
		}
		try {
			DESKeySpec dks = new DESKeySpec(key.getBytes("UTF-8"));
			SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
			// key的长度不能够小于8位字节
			Key secretKey = keyFactory.generateSecret(dks);
			Cipher cipher = Cipher.getInstance(ALGORITHM_DES);
			IvParameterSpec iv = new IvParameterSpec("12345678".getBytes());
			AlgorithmParameterSpec paramSpec = iv;
			cipher.init(Cipher.ENCRYPT_MODE, secretKey, paramSpec);
			byte[] bytes = cipher.doFinal(data.getBytes("UTF-8"));
			/* return new String(bytes,"UTF-8"); */
			return byte2String(bytes);
		} catch (Exception e) {
			e.printStackTrace();
			return data;
		}
	}

	/**
	 * DES算法，解密
	 *
	 * @param data 待解密字符串
	 * @param key  解密私钥，长度不能够小于8位
	 * @return 解密后的字节数组
	 * @throws Exception 异常
	 */
	public static String decode(String key, String data) {
		if (data == null) {
			return null;
		}
		try {
			DESKeySpec dks = new DESKeySpec(key.getBytes("UTF-8"));
			SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
			// key的长度不能够小于8位字节
			Key secretKey = keyFactory.generateSecret(dks);
			Cipher cipher = Cipher.getInstance(ALGORITHM_DES);
			IvParameterSpec iv = new IvParameterSpec("12345678".getBytes());
			AlgorithmParameterSpec paramSpec = iv;
			cipher.init(Cipher.DECRYPT_MODE, secretKey, paramSpec);
			return new String(cipher.doFinal(byte2hex(data.getBytes("UTF-8"))), "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
			return data;
		}
	}

	/**
	 * 二行制转字符串
	 *
	 * @param b
	 * @return
	 */
	private static String byte2String(byte[] b) {
		StringBuilder hs = new StringBuilder();
		String stmp;
		for (int n = 0; b != null && n < b.length; n++) {
			stmp = Integer.toHexString(b[n] & 0XFF);
			if (stmp.length() == 1) {
				hs.append('0');
			}
			hs.append(stmp);
		}
		return hs.toString().toUpperCase(Locale.CHINA);
	}

	/**
	 * 二进制转化成16进制
	 *
	 * @param b
	 * @return
	 */
	private static byte[] byte2hex(byte[] b) {
		if ((b.length % 2) != 0) {
			throw new IllegalArgumentException();
		}
		byte[] b2 = new byte[b.length / 2];
		for (int n = 0; n < b.length; n += 2) {
			String item = new String(b, n, 2);
			b2[n / 2] = (byte) Integer.parseInt(item, 16);
		}
		return b2;
	}

	public static void main(String args[]) throws Exception {
		String str = "{\"params\":{\"stationId\":\"GS12900001\"},\"extend\":{\"apiKey\":\"yuncekey\",\"version\":\"1.0.0\",\"terminal\":\"1\"}}";
		String keyStr = "sysongys";
		System.out.println("加密后:" + encode(keyStr, str));
		String resultStr;
		resultStr = decode(keyStr,
				"05670EC559B7C3BA6ADB30D774E2EBDCC4F375582500B2F6697039A61A4312289A741830517C8AC11B98E2A424E8867BDBD76E093B1FBFC40004A35AF64540CF033AC0557856EAD988933470A537AA898FAB801E493F06F5AEFC5C449E54DEB27C9C7337778B835E");
		System.out.println("解密后:" + resultStr);
	}
}
