package com.entity;

import java.util.Date;

public class Schedule {
	private int id;//����
	private String title;//����
	private String content;//����
	private Date startDate;//��ʼ����:yyyy-MM-dd
	private Date endDate;//��������
	private String startTime;//��ʼʱ�䣺hh:mm
	private String endTime;//����ʱ�䣺hh:mm
	private int isAllDay;//�Ƿ�ȫ��
	private int isEnd;//�Ƿ������������
	private String color;//��ɫ
	
	public Schedule() {
	}
	
	public Schedule(String title, String content, Date startDate, Date endDate,
			int isAllDay,String color) {
		this.title = title;
		this.content = content;
		this.startDate = startDate;
		this.endDate = endDate;
		this.isAllDay = isAllDay;
		this.color=color;
	}
	public Schedule(int id,String title, String content, Date startDate, Date endDate,
			int isAllDay,String color) {
		this.id=id;
		this.title = title;
		this.content = content;
		this.startDate = startDate;
		this.endDate = endDate;
		this.isAllDay = isAllDay;
		this.color=color;
	}
	public Schedule(String title, String content, Date startDate, Date endDate,
			String startTime, String endTime, int isAllDay) {
		this.title = title;
		this.content = content;
		this.startDate = startDate;
		this.endDate = endDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.isAllDay = isAllDay;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public int getIsAllDay() {
		return isAllDay;
	}
	public void setIsAllDay(int isAllDay) {
		this.isAllDay = isAllDay;
	}
	public int getIsEnd() {
		return isEnd;
	}
	public void setIsEnd(int isEnd) {
		this.isEnd = isEnd;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
}
