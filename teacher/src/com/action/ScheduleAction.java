package com.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.entity.Schedule;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;


public class ScheduleAction extends ActionSupport {
	private List<Schedule> list;
	private List<Schedule> list22;
	private HttpServletRequest request;
	private Map<String,Object> session;
	private Map<String, Object> dataMap;
	private static final String[] COLORS={"red","green","blue"};
	public String toJson(){
		init();
		return "getJson";
	}
	
	public String addSchedule(){
//		HttpSession session=getRequest().getSession();
//		list=(List<Schedule>) session.getAttribute("list");
		list=(List<Schedule>) this.getSession().get("list");
		if(list==null) list=new ArrayList<Schedule>();
		dataMap=new HashMap<String, Object>();
		dataMap.put("status", 0);
		//获取参数
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		Schedule sch=new Schedule();
		try {
			sch.setContent(getRequest().getParameter("event"));
			sch.setTitle(getRequest().getParameter("event"));
			String isalldayStr=this.getRequest().getParameter("isallday");
			sch.setIsAllDay("1".equals(isalldayStr)?1:0);
			String isend=this.getRequest().getParameter("isend");
			sch.setIsEnd("1".equals(isend)?1:0);
			String startDateStr=this.getRequest().getParameter("startdate");
			if(startDateStr!=null && !"".equals(startDateStr)){
				sch.setStartDate(df.parse(startDateStr));
			}
			String endDateStr=this.getRequest().getParameter("enddate");
			if(endDateStr!=null && !"".equals(endDateStr)){
				sch.setEndDate(df.parse(endDateStr));
			}
			sch.setStartTime(this.getRequest().getParameter("sel_start"));
			sch.setEndTime(this.getRequest().getParameter("sel_end"));
			sch.setColor(this.getRandomColor());
			list.add(sch);
//			session.setAttribute("list", list);
			this.getSession().put("list", list);
			dataMap.put("status", 1);
		} catch (Exception e) {
			e.printStackTrace();
			dataMap.put("msg", e.getMessage());
		}
		return "getRootMap";
	}
	
	private void init(){
//		HttpSession session=getRequest().getSession();
//		list=(List<Schedule>) session.getAttribute("list");
		list=(List<Schedule>) this.getSession().get("list");
		if(list==null){
			list=new ArrayList<Schedule>();
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				list.add(new Schedule(this.getMaxId()+1,"测试1", "测试1", df.parse("2015-11-02 12:30:00"), df.parse("2015-11-02 13:30:00"), 1,getRandomColor()));
				list.add(new Schedule(this.getMaxId()+1,"测试11", "测试11", df.parse("2015-11-02 14:00:00"), df.parse("2015-11-02 14:30:00"), 1,getRandomColor()));
				list.add(new Schedule(this.getMaxId()+1,"测试2", "测试2", df.parse("2015-11-10 12:30:00"), df.parse("2015-11-10 13:30:00"), 0,getRandomColor()));
				list.add(new Schedule(this.getMaxId()+1,"测试3", "测试3", df.parse("2015-11-20 12:30:00"), df.parse("2015-11-20 13:30:00"), 1,getRandomColor()));
				list.add(new Schedule(this.getMaxId()+1,"测试4", "测试4", df.parse("2015-11-30 12:30:00"), df.parse("2015-11-30 13:30:00"), 0,getRandomColor()));
				list.add(new Schedule(this.getMaxId()+1,"测试5", "测试5", df.parse("2015-12-02 12:30:00"), df.parse("2015-12-02 13:30:00"), 1,getRandomColor()));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
//		session.setAttribute("list", list);
		this.getSession().put("list", list);
	}
	
	public String updateSchedule(){
		try {
			list=(List<Schedule>) this.getSession().get("list");
			if(list==null) list=new ArrayList<Schedule>();
			dataMap=new HashMap<String, Object>();
			list22=new ArrayList<Schedule>();
			dataMap.put("status", 0);
			String teachername="高会军";
			String action=this.getRequest().getParameter("action");
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			//获取日程安排
			Schedule sch=this.getSchedule(action);
			Connection conn = null;
			Statement stat= null;
			//ResultSet result2=null;
			try
			{
			Class.forName("com.mysql.jdbc.Driver");
			}
			catch (ClassNotFoundException e)  
			 {  
			     e.printStackTrace();  
			 }  
			//һ��ʼ������һ���Ѿ����ڵ����ݿ�  
			String url = "jdbc:mysql://localhost:3306/aa"; 
			try
			{
			 conn = DriverManager.getConnection(url, "root", "6021328614");
			}
			catch (SQLException e)  
			{  
			    e.printStackTrace();  
			} 
			try
			{
			 stat = conn.createStatement();
			}
			catch (SQLException e)  
			{  
			    e.printStackTrace();  
			}  
			String sql="delete from calendar where teacher_name='"+teachername+"'";
			if("add".equals(action)){
				list.add(sch);
				list22=list;
				request.setAttribute("list22",list22);
			}else{
				if(list!=null && list.size()>0){
					for(int i=0;i<list.size();i++){
						Schedule s=list.get(i);
						if(sch.getId()==s.getId()){
//							s=sch;
							list.set(i, sch);
							break;
						}
					}
				}
			}
		    this.getSession().put("list", list);
			dataMap.put("status", 1);
		}
		catch (Exception e) {
			e.printStackTrace();
			dataMap.put("msg", e.getMessage());
		}
		return "getRootMap";
	}
	
	public Schedule getSchedule(String action){
		Schedule sch=new Schedule();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		try {
			if("add".equals(action)){
				sch.setId(this.getMaxId());
				sch.setColor(this.getRandomColor());
			}else{
				String sid=this.getRequest().getParameter("id");
				sch.setId((sid!=null && !"".equals(sid))?Integer.parseInt(sid):-1);
				sch.setColor(getRequest().getParameter("color"));
			}
			sch.setContent(getRequest().getParameter("event"));
			sch.setTitle(getRequest().getParameter("event"));
			String isalldayStr=this.getRequest().getParameter("isallday");
			sch.setIsAllDay("1".equals(isalldayStr)?1:0);
			String isend=this.getRequest().getParameter("isend");
			sch.setIsEnd("1".equals(isend)?1:0);
			String startDateStr=this.getRequest().getParameter("startdate");
			if(startDateStr!=null && !"".equals(startDateStr)){
				sch.setStartDate(df.parse(startDateStr));
			}
			String endDateStr=this.getRequest().getParameter("enddate");
			if(endDateStr!=null && !"".equals(endDateStr)){
				sch.setEndDate(df.parse(endDateStr));
			}
			sch.setStartTime(this.getRequest().getParameter("sel_start"));
			sch.setEndTime(this.getRequest().getParameter("sel_end"));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sch;
	}
	
	
	public Map<String, Object> getSession() {
		if(session==null){
			session=ActionContext.getContext().getSession();
		}
		return session;
	}
	
	/**
	 * 获取主键ID
	 * @return
	 */
	private int getMaxId(){
		return (list==null)?0:list.size();
	}
	
	/**
	 * 随机生成颜色
	 * @return
	 */
	private String getRandomColor(){
		String[] colors=COLORS;
		return COLORS[new Random().nextInt(3)];
	}

	public HttpServletRequest getRequest() {
		if(request==null){
			request=ServletActionContext.getRequest();
		}
		return request;
	}

	public List<Schedule> getList() {
		return list;
	}
	public void setList(List<Schedule> list) {
		this.list = list;
	}

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

}
