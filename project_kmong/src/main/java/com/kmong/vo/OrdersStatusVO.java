package com.kmong.vo;

public class OrdersStatusVO {
	
	private int allOrders, completeOrders, waitingOrders, cancelOrders;

	
	public OrdersStatusVO() {
		super();
	}


	public OrdersStatusVO(int allOrders, int completeOrders, int waitingOrders, int cancelOrders) {
		super();
		this.allOrders = allOrders;
		this.completeOrders = completeOrders;
		this.waitingOrders = waitingOrders;
		this.cancelOrders = cancelOrders;
	}


	public int getAllOrders() {
		return allOrders;
	}


	public void setAllOrders(int allOrders) {
		this.allOrders = allOrders;
	}


	public int getCompleteOrders() {
		return completeOrders;
	}


	public void setCompleteOrders(int completeOrders) {
		this.completeOrders = completeOrders;
	}


	public int getWaitingOrders() {
		return waitingOrders;
	}


	public void setWaitingOrders(int waitingOrders) {
		this.waitingOrders = waitingOrders;
	}


	public int getCancelOrders() {
		return cancelOrders;
	}


	public void setCancelOrders(int cancelOrders) {
		this.cancelOrders = cancelOrders;
	}


	@Override
	public String toString() {
		return "OrdersStatusVO [allOrders=" + allOrders + ", completeOrders=" + completeOrders + ", waitingOrders="
				+ waitingOrders + ", cancelOrders=" + cancelOrders + "]";
	}
	
	
	
	
}
