<%@ page contentType="text/html; charset=utf-8" 
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
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <link rel="icon" type="image/png" href="http://homepage.hit.edu.cn/web/images/icon32.png">
  <link rel="stylesheet" href="http://homepage.hit.edu.cn/web/css/bootstrap.css">
  <link rel="stylesheet" href="http://homepage.hit.edu.cn/web/css/show.css">
  <link rel="stylesheet" href="http://homepage.hit.edu.cn/web/css/show-tankuang.css">
  <link rel="stylesheet" href="http://homepage.hit.edu.cn/web/css/font-style.css">
  <link rel="stylesheet" type="text/css" href="css/normalize.css" />
  <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
  <link rel="stylesheet" type="text/css" href="css/demo.css" />
  <link rel="stylesheet" type="text/css" href="css/component.css" />
    <head>
        <title>Say Hello</title>
        <style>
#header {
    background-color:black;
    color:white;
    text-align:center;
    padding:5px;
}
#nav {
    line-height:30px;
    background-color:#eeeeee;
    height:1000px;
    width:150px;
    float:right;
    padding:5px; 
}
#section {
    width:350px;
    float:left;
    padding:10px; 
}
#footer {
    background-color:black;
    color:white;
    clear:both;
    text-align:center;
    padding:5px; 
}
</style>
    </head>
<body background="background.jpg">
<%
      String teachername=request.getParameter("teachername");
      String username=(String)session.getAttribute("username");
      String password=(String)session.getAttribute("password");
      String user=(String)session.getAttribute("user");
      //String teachername="高会军";
	  List<String> list4=new LinkedList<String>();
	  List<String> list5=new LinkedList<String>();
	  List<String> list6=new LinkedList<String>();
	  List<String> list7=new LinkedList<String>();
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
      String sql="select * from teacher where teacher_name='"+teachername+"'";
      String sql3="select * from information where teacher_name='"+teachername+"'";
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
   	   linshi+=result.getString("keyan");
	   list4.add(linshi);
      }
      }
      catch (SQLException e)  
      {  
          e.printStackTrace();  
      }  
      try
      {
	   result=stat.executeQuery(sql3);
      }
      catch (SQLException e)  
      {  
          e.printStackTrace();  
      }  
      try
      {
      while (result.next())  
      {  
   	   String linshi2="";
   	   linshi2+=result.getString("information");
	   list6.add(linshi2);
      }
      }
      catch (SQLException e)  
      {  
          e.printStackTrace();  
      }  
%>
<%
String[] lianjie;
String sql2="select * from tuijian2 where teacher_name='"+teachername+"'";
try
{
 result=stat.executeQuery(sql2);
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
	   linshi+=result.getString("lianxi");
	   list5.add(linshi);
}
}
catch (SQLException e)  
{  
    e.printStackTrace();  
}

/*
for(int q=0;q<list5.size();q++)
{
	String sql4="select * from duiying where teacher_name='"+list5.get(q)+"'";	
	try
	{
	 result=stat.executeQuery(sql4);
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
		   linshi+=result.getString("name");
		   list7.add(linshi);
	}
	}
	catch (SQLException e)  
	{  
	    e.printStackTrace();  
	}
}
*/

/*
for(String ss2:list5)
{
	//ss2=new String(ss2.getBytes("ISO-8859-1"),"UTF-8");
	out.print("<tr>");
	out.print("<td bgcolor=yellow>"+ss2+"</td>");
	out.print("</tr>");
}
*/
%>

<div id="nav">
          <h1 class="tit14">推荐教师</h1>
<%
  for(int k=0;k<list5.size();k++)
  {
      out.print("<a href=search.jsp?teachername="+list5.get(k)+">"+
      "<span>"+list5.get(k)+"</span>"+"<br>"+
      "</a>");
  }
%>
<%
if (user.equals("student"))
{
	  out.print("<form action='perschedule4.jsp'>");    
	  out.print("<span class='input input--haruki'>"+
		      "<span class='input input--minoru'>"+
		      "<input class='input__field input__field--minoru' type='submit' value='预约教师' id='input-3' />"+
		      "<label class='input__label input__label--minoru' for='input-3'>"+
		              "<span class='input__label-content input__label-content--minoru'></span>"+
		      "</label>"
		   +"</span>");
	  out.print("</form>");
	  out.print("</section>");
}
%>

      </div>
      <div id="grxxxq">
        <div class="">
          
          <div class="show-gx-grxx">
            <div class="grbox">
              <div class="" id="2d2c0759ccae47b7b20edea268149d36" name="基本信息" >
                <h3 class="tit22"><span class="glyphicon glyphicon-user gr-tittle-img"></span>基本信息</h3>
                <div class="grxx-text table_biaoge">
<%
   for(int j=0;j<list6.size();j++)
   {
	   out.print("<p>");
	   out.print(list6.get(j));
	   out.print("</p>");
   }
%>                 
                </div>
              </div>
            </div>
          </div>
          <div class="show-gx-grxx">
            <div class="grbox">
              <div class="" id="57d6be96aa8f4b42ac06d85ecd7479d0" name="期刊任职" >
                <h3 class="tit22"><span class="glyphicon glyphicon-file gr-tittle-img"></span>期刊任职</h3>
                <div class="grxx-text table_biaoge">
                  
                    <p>
	Co Editor-in-Chief, IEEE Trans. Industrial Electronics (IEEE工业电子学汇刊，共同主编，2014 - )
</p>
<p>
	<p>
		<p>
			Associate Editor, Automatica (自动化，编委，2010 - )
		</p>
		<p>
			Technical Editor, IEEE Trans. Mechatronics (IEEE机械电子学汇刊，编委，2013－)
		</p>
		<p>
			Associate Editor, IEEE Trans. Control Systems Technology (IEEE控制系统技术汇刊，编委，2011－)
		</p>
		<p>
			Associate Editor, IEEE Trans. Cybernetics (IEEE控制论汇刊，编委，2006－)
		</p>
		<p>
			Associate Editor, IEEE Trans. Fuzzy Systems &nbsp;(IEEE模糊系统汇刊，编委，2010－)
		</p>
		<p>
			Associate Editor, IEEE Trans. Industrial Informatics (IEEE工业信息学汇刊，编委，2014－)
		</p>
		<p>
			Associate Editor, IEEE Trans. Circuits and Systems I-Regular Papers (IEEE电路与系统汇刊I，编委，2010－2012)
		</p>
	</p>
</p>
                  
                </div>
              </div>
            </div>
          </div>
          
          <div class="show-gx-grxx">
            <div class="grbox">
              <div class="" id="d6cf71922e5143abb6aefc109957aad5" name="研究成果" >
                <h3 class="tit22"><span class="glyphicon glyphicon-file gr-tittle-img"></span>研究成果</h3>
                <div class="grxx-text table_biaoge">
<%               
                    out.print("<p>"+"&nbsp;"+"&nbsp;"+list4.get(0)+"</p>");
%>
<p>
	代表性论文：
</p>
                  
                </div>
              </div>
            </div>
          </div>
          
          <div class="show-gx-grxx">
            <div class="grbox">
              <div class="" id="4ff8fc4301484b16b5907f9664803d39" name="其他任职" >
                <h3 class="tit22"><span class="glyphicon glyphicon-file gr-tittle-img"></span>其他任职</h3>
                <div class="grxx-text table_biaoge">
                  
                    <p>
	第十二届全国青联常委
</p>
<p>
	第五届中国青年科技工作者协会常务理事
</p>
<p>
	中国侨联特聘专家
</p>
<p>
	黑龙江省青联副主席
</p>
<p>
	哈尔滨市青联副主席
</p>
<p>
	IEEE IES AdCom Member (IEEE工业电子学会执委会委员)
</p>
<p>
	IFAC Council Member (国际自动控制联合会理事会成员)
</p>
<p>
	<br />
</p>
                  
                </div>
              </div>
            </div>
          </div>
          
        </div>
      </div>
  </div>
<%
session.setAttribute("teachername",teachername); 
%>
</body>
</html>