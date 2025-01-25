package com.voidmain.pojo;

public class Schedule {

	private int id;
	private String clientid;
	private String assignedto;
	private String fromdate;
	private String todate;
	private String amount;
	private String paymentstatus;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getClientid() {
		return clientid;
	}
	public void setClientid(String clientid) {
		this.clientid = clientid;
	}
	public String getAssignedto() {
		return assignedto;
	}
	public void setAssignedto(String assignedto) {
		this.assignedto = assignedto;
	}
	public String getFromdate() {
		return fromdate;
	}
	public void setFromdate(String fromdate) {
		this.fromdate = fromdate;
	}
	public String getTodate() {
		return todate;
	}
	public void setTodate(String todate) {
		this.todate = todate;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getPaymentstatus() {
		return paymentstatus;
	}
	public void setPaymentstatus(String paymentstatus) {
		this.paymentstatus = paymentstatus;
	}
}
