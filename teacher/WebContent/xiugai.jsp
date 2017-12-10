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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String teachername=(String)session.getAttribute("username");
%>
<table border="1" align="center">
<tr bgcolor="#949494" align="center" >
<td colspan="4">
<%
out.print(teachername+"的日程");
%>
</td>
</tr>
<%

      //String teachername="高会军";
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
      String sql="select * from richeng where teacher_name='" + teachername+ "'";
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
   	   String linshi2="";
   	   linshi+=result.getString("thing");
   	   linshi2+=result.getString("thingid");
	   list4.add(linshi);
	   list5.add(linshi2);
      }
      }
      catch (SQLException e)  
      {  
          e.printStackTrace();  
      }  
      for(String ss2:list4)
      {
      	//ss2=new String(ss2.getBytes("ISO-8859-1"),"UTF-8");
    	out.print("<tr>");
    	out.print("<td align=\"center\">"+ss2+"</td>");
      	out.print("<td align=\"center\"><a href=edit.jsp?thingid="+list5.get(i)+"><button type=\"button\">修改</button></a></td>");
      	if (i==0)
      	{
      	out.print("<td align=\"center\"><a href=delete.jsp?thingid="+list5.get(i)+"><button type=\"button\">删除</button></a></td>");
      	}
      	else
      	{
      	out.print("<td colspan='2' align=\"center\"><a href=delete.jsp?thingid="+list5.get(i)+"><button type=\"button\">删除</button></a></td>");
      	}
      	if (i==0)
      	{
      	out.print("<td align=\"center\"><a href=add.jsp?teachername="+teachername+"><button type=\"button\">增加日程</button></a></td>");
      	}
      	out.print("</tr>");
      	i++;
      }
%>
</body>
</html>