package com.finalExam.bean;

/*
 * @author 谢增光
 * 此类用于获取和设置会员信息
 * class for set and get UserInfo
 */

public class UserInfo {
	
	/*
	 * cid 		会员账号
	 * passwd   会员密码
	 * gender	会员性别
	 * tel		联系电话
	 * addr		收货地址
	 * email	会员邮箱
	 * confirm	修改审核
	 */
	
	private String cid;
	private String passwd;
	private String gender;
	private String tel;
	private String addr;
	private String email;
	private String confirm;
	
	
	/*
	 * 设置和获取方法Getter and Setter
	 */
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
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
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
}

