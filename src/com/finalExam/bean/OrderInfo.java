package com.finalExam.bean;
/*
 * @author 谢增光
 * class for set and get order information
 * 此类用于获取和设置订单信息
 */

public class OrderInfo {
	private String orderID;
	private String orderTime;
	private String deliveryTime;
	private String deleveryAddr;
	private String payMethod;
	private String shipStatus;
	private String orderStatus;
	private String cid;
	private String price;
	
	public String getOrderID() {
		return orderID;
	}
	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}
	public String getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	public String getDeliveryTime() {
		return deliveryTime;
	}
	public void setDeliveryTime(String deliveryTime) {
		this.deliveryTime = deliveryTime;
	}
	public String getDeleveryAddr() {
		return deleveryAddr;
	}
	public void setDeleveryAddr(String deleveryAddr) {
		this.deleveryAddr = deleveryAddr;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getShipStatus() {
		return shipStatus;
	}
	public void setShipStatus(String shipStatus) {
		this.shipStatus = shipStatus;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}	
}
