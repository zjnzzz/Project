<%@ page language="java" contentType="text/html; charset=utf-8"
import="java.util.LinkedList,java.util.List"
import="java.sql.Connection"
import="java.sql.DriverManager"
import="java.sql.ResultSet"
import="java.sql.Statement"
import="java.util.Collections"
import="java.util.LinkedList"
import="java.util.List"
import="java.util.regex.Matcher"
import= "java.util.regex.Pattern"
import= "javax.servlet.ServletRequest"
import= "javax.servlet.http.HttpServletRequest"
import= "javax.servlet.http.HttpSession"
import= "org.apache.struts2.ServletActionContext"
import= "java.sql.PreparedStatement"
import= "java.sql.ResultSet"
import= "java.sql.SQLException"
import= "java.sql.Statement"
import= "java.util.List"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
修改事件:</br>
</head>
<%
  String thingid=(String)request.getParameter("thingid");
  List<String> list4=new LinkedList<String>();
  List<String> list5=new LinkedList<String>();
  int i=0;
  Connection conn = null;
  Statement stat= null;
  ResultSet result=null;
  ResultSet result1=null;
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
  String url = "jdbc:mysql://localhost:3306/aa?characterEncoding=utf8"; 
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
  String sql="select * from richeng where thingid='"+thingid+"'";
  try
  {
   result=stat.executeQuery(sql);
  }
  catch (SQLException e)  
  {  
      e.printStackTrace();  
  }  
  try
  {
  while (result.next())  
  {  
	   String linshi="";
	   linshi+=result.getString("thing");
   list4.add(linshi);
  }
  }
  catch (SQLException e)  
  {  
      e.printStackTrace();  
  }  
  out.print(list4.get(0));
%>
<form action="" method="GET" >    
<%
out.print("<input type='text' name='thing'"+"value="+list4.get(0)+"/>");
session.setAttribute("thingid",thingid); 
%>
<br />
<br/>
<input type="submit" value="修改" />
</form>
</body>
</html>