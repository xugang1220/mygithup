package cn.yfyue.comm;

import cn.yfyue.comm.md5.MD5Util;

public class MD5 {
//MD5加密
public static String getMd5(String mustMd5Str, String md5Charset) {
	String strMd5 = null;
	String charSet = null;
	String temp = mustMd5Str.trim();
	if (md5Charset==null || md5Charset.trim().isEmpty()) {
		charSet = "UTF-8";
	} else {
		charSet = md5Charset;
	}
	try {
		strMd5 = MD5Util.md5Hex(temp.getBytes(charSet));
	} catch (Exception e) {
		e.printStackTrace();
	}
	return strMd5;
}
}
