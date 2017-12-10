package com.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.entity.Schedule;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ScheduleAction extends ActionSupport {
	private List<Schedule> list;
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
		//��ȡ����
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
				list.add(new Schedule(this.getMaxId()+1,"����1", "����1", df.parse("2015-11-02 12:30:00"), df.parse("2015-11-02 13:30:00"), 1,getRandomColor()));
				list.add(new Schedule(this.getMaxId()+1,"����11", "����11", df.parse("2015-11-02 14:00:00"), df.parse("2015-11-02 14:30:00"), 1,getRandomColor()));
				list.add(new Schedule(this.getMaxId()+1,"����2", "����2", df.parse("2015-11-10 12:30:00"), df.parse("2015-11-10 13:30:00"), 0,getRandomColor()));
				list.add(new Schedule(this.getMaxId()+1,"����3", "����3", df.parse("2015-11-20 12:30:00"), df.parse("2015-11-20 13:30:00"), 1,getRandomColor()));
				list.add(new Schedule(this.getMaxId()+1,"����4", "����4", df.parse("2015-11-30 12:30:00"), df.parse("2015-11-30 13:30:00"), 0,getRandomColor()));
				list.add(new Schedule(this.getMaxId()+1,"����5", "����5", df.parse("2015-12-02 12:30:00"), df.parse("2015-12-02 13:30:00"), 1,getRandomColor()));
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
			dataMap.put("status", 0);
			
			String action=this.getRequest().getParameter("action");
			//��ȡ�ճ̰���
			Schedule sch=this.getSchedule(action);
			if("add".equals(action)){
				list.add(sch);
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
		} catch (Exception e) {
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
	 * ��ȡ����ID
	 * @return
	 */
	private int getMaxId(){
		return (list==null)?0:list.size();
	}
	
	/**
	 * ���������ɫ
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
