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
</head>
<body>
<%
int id;
Pattern p = Pattern.compile("\\?");
String day=(String)(request.getParameter("bday"));
String startDate=day+" "+(String)(request.getParameter("usr_time1"))+":00";
String endDate=day+" "+(String)(request.getParameter("usr_time2"))+":00";
String title=(String)(request.getParameter("title"));
String content=title;
String teachername=(String)(session.getAttribute("username"));
out.print(day);
out.print(startDate);
out.print(teachername);
//String teachername="高会军";
List<Integer> list4=new LinkedList<Integer>();
List<String> list5=new LinkedList<String>();
int i=0;
Connection conn = null;
Statement stat= null;
ResultSet result=null;
ResultSet result1=null;
//ResultSet result2=null;
String sql="select id from calendar";
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
list4.add(result.getInt("id"));
}
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
if (list4.size()==0)
{
	  id=1;
}
else
{
	  id=list4.size()+1;
}
String sql3="insert into calendar(id,title,content,startDate,endDate,isAllDay,teacher_name) values(?,?,?,?,?,?,?)"; 
Matcher m1=p.matcher(sql3);
sql3=m1.replaceFirst(String.valueOf(id));
m1=p.matcher(sql3);
sql3=m1.replaceFirst('"'+title+'"');
m1=p.matcher(sql3);
sql3=m1.replaceFirst('"'+content+'"');
m1=p.matcher(sql3);
sql3=m1.replaceFirst('"'+startDate+'"');
m1=p.matcher(sql3);
sql3=m1.replaceFirst('"'+endDate+'"'); 
m1=p.matcher(sql3);
sql3=m1.replaceFirst("0");
m1=p.matcher(sql3);
sql3=m1.replaceFirst('"'+teachername+'"');
try
{
    stat.executeUpdate(sql3);
}
catch (SQLException e)  
{  
    e.printStackTrace();  
}  
%>
</body>
</html>