package com.finalExam.bean;

/*
 * @author 谢增光
 * class for setting and getting Administrator‘s Information
 * 此类用于获取和设置管理员信息
 */

public class AdminInfo {
	
	/*
	 * aid 		管理员账号
	 * passwd   管理员密码
	 * gender	管理员性别
	 * tel		联系电话
	 * addr		收货地址
	 * email	电子邮箱
	 */
	
	private String aid;
	private String passwd;
	private String gender;
	private String tel;
	private String addr;
	private String email;
	
	
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
