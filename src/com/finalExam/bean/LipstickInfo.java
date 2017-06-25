package com.finalExam.bean;

public class LipstickInfo {
	private String lipstickId;
	private String lipstickType;
	private String lipstickName;	
	private String commodityPlace;	//商品产地
	private String filePath;		//图片路径
	private String introduction;	//商品简介
	private String price;			//商品单价
	private String Inventory;		//商品库存
	private String num;  //购物车数量
	
	public String getLipstickId() {
		return lipstickId;
	}
	public void setLipstickId(String lipstickId) {
		this.lipstickId = lipstickId;
	}
	public String getLipstickType() {
		return lipstickType;
	}
	public void setLipstickType(String lipstickType) {
		this.lipstickType = lipstickType;
	}
	public String getLipstickName() {
		return lipstickName;
	}
	public void setLipstickName(String lipstickName) {
		this.lipstickName = lipstickName;
	}
	public String getCommodityPlace() {
		return commodityPlace;
	}
	public void setCommodityPlace(String commodityPlace) {
		this.commodityPlace = commodityPlace;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getInventory() {
		return Inventory;
	}
	public void setInventory(String inventory) {
		Inventory = inventory;
	}
	public String getNum() {
		return lipstickId;
	}
	public void setNum(String num) {
		this.num = num;
	}
}
