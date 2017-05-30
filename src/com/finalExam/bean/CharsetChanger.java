package com.finalExam.bean;
import java.io.UnsupportedEncodingException;

/*
 * @author 谢增光
 * class for solving EncodingException
 * 此类用于解决中文编码乱码
 */

public class CharsetChanger {
	public static String toChinese(String str){
		if(str==null)str="";
		try{
			str=new String(str.getBytes("ISO-8859-1"),"UTF8");
		}catch(UnsupportedEncodingException e){
			str="";
			e.printStackTrace();					
		}
		return str;
	}
}
