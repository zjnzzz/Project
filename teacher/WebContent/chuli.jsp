<%@ page language="java" contentType="text/html; charset=utf-8"
import="java.util.LinkedList,java.util.List"
import="java.util.*"
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
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />
<title>Insert title here</title>
</head>
<body>
</table>
<table border="1">
<tr bgcolor=yellow>
<%
  String username=(String)(request.getParameter("username"));
  String password=(String)(request.getParameter("password"));
  String user=(String)(request.getParameter("user"));
  String username1="";
  String password1="";
  String user1="";
  boolean flag=false;
  //String teachername="高会军";
  List<String> list1=new LinkedList<String>();
  List<String> list2=new LinkedList<String>();
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
  String sql="select * from login where username='"+username+"'";
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
	   username1=result.getString("username");
	   password1=result.getString("userpassword");
	   user1=result.getString("user");
  }
  }
  catch (SQLException e)  
  {  
      e.printStackTrace();  
  }  
  if (password1.equals(password))
  {
	flag=true;
  }
  session.setAttribute("username",username);  
  session.setAttribute("password",password); 
  session.setAttribute("user",user); 
%>
</table>
<% 
  if (flag)
  {
  if(user1.equals("teacher"))
  {
  out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您好！您是教师用户");
  session.setAttribute("username",username); 
  out.print("<form action='search0.jsp'>");    
  out.print("<span class='input input--haruki'>"+
	      "<span class='input input--minoru'>"+
	      "<input class='input__field input__field--minoru' type='submit' value='检索其他教师' id='input-3' />"+
	      "<label class='input__label input__label--minoru' for='input-3'>"+
	              "<span class='input__label-content input__label-content--minoru'></span>"+
	      "</label>"
	   +"</span>");
  out.print("</form>");
  out.print("</section>");
  out.print("<form action='xiugai.jsp'>");    
  out.print("<span class='input input--haruki'>"+
	      "<span class='input input--minoru'>"+
	      "<input class='input__field input__field--minoru' type='submit' value='修改日程' id='input-3' />"+
	      "<label class='input__label input__label--minoru' for='input-3'>"+
	              "<span class='input__label-content input__label-content--minoru'></span>"+
	      "</label>"
	   +"</span>");
  out.print("</form>");
  out.print("</section>");

  }
  else
  {
  out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您好！您是学生用户");

  out.print("<form action='search0.jsp'>");    
  out.print("<span class='input input--haruki'>"+
	      "<span class='input input--minoru'>"+
	      "<input class='input__field input__field--minoru' type='submit' value='检索教师' id='input-3' />"+
	      "<label class='input__label input__label--minoru' for='input-3'>"+
	              "<span class='input__label-content input__label-content--minoru'></span>"+
	      "</label>"
	   +"</span>");
  out.print("</form>");
  out.print("</section>");
  out.print("</section>");
  out.print("<form action='edit2.jsp'>");    
  out.print("<span class='input input--haruki'>"+
	      "<span class='input input--minoru'>"+
	      "<input class='input__field input__field--minoru' type='submit' value='查询预约申请' id='input-3' />"+
	      "<label class='input__label input__label--minoru' for='input-3'>"+
	              "<span class='input__label-content input__label-content--minoru'></span>"+
	      "</label>"
	   +"</span>");
  out.print("</form>");
  out.print("</section>");

  }
  }
  else
  {
	  out.print("<section class='content bgcolor-1'>");
	  out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您的用户名或密码错误，请重新登录！");
	  out.print("<form action='login.jsp'>");    
	  out.print("<span class='input input--haruki'>"+
		      "<span class='input input--minoru'>"+
		      "<input class='input__field input__field--minoru' type='submit' value='重新登陆' id='input-3' />"+
		      "<label class='input__label input__label--minoru' for='input-3'>"+
		              "<span class='input__label-content input__label-content--minoru'></span>"+
		      "</label>"
		   +"</span>");
      out.print("</form>");
      out.print("</section>");

  }
%>
</body>
</html>