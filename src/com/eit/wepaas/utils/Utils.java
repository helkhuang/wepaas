package com.eit.wepaas.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

public class Utils {
	
	public static String generateUUID4(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
    /**
	 * 将摘要信息转换为相应的编码
	 * @param code 编码类型
	 * @param message 摘要信息
	 * @return 相应的编码字符串
	 */
	private static String Encode(String code,String message){
		MessageDigest md;
		String encode = null;
		try {
			md = MessageDigest.getInstance(code);
			encode = byteArrayToHexString(md.digest(message
					.getBytes()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return encode;
	}
	
	 public static String byteArrayToHexString(byte[] b) {
		    StringBuffer sb = new StringBuffer(b.length * 2);
		    for (int i = 0; i < b.length; i++) {
		      int v = b[i] & 0xff;
		      if (v < 16) {
		        sb.append('0');
		      }
		      sb.append(Integer.toHexString(v));
		    }
		    return sb.toString().toUpperCase();
	 }

	 /** 
	     * 将摘要信息转换成SHA-512编码 
	     * @param message 摘要信息 
	     * @return SHA-512编码之后的字符串 
	     */  
	    public static String sha512Encode(String message){  
	        return Encode("SHA-512",message);  
	    }  
	    
	    public static void main(String args[]){
	    	System.out.println(Utils.sha512Encode("password").toLowerCase());
	    }

}
