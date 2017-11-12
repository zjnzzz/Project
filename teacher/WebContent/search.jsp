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
<center>
    <s:form action="">
        <s:textfield name="username" label="作家名 " /><s:submit value="查询"/>
    </s:form>
    </center>
</table>
<table border="1">
<tr bgcolor=yellow>
    <td>姓名</td>
<%
      String teachername=request.getParameter("teachername");
      String username=(String)session.getAttribute("username");
      String password=(String)session.getAttribute("password");
      String user=(String)session.getAttribute("user");
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
      String sql="select * from teacher where teacher_name='"+teachername+"'";
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
      for(String ss2:list4)
      {
      	//ss2=new String(ss2.getBytes("ISO-8859-1"),"UTF-8");
      	out.print(ss2);
      }
%>
<%

	out.print(user);
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
for(String ss2:list5)
{
	//ss2=new String(ss2.getBytes("ISO-8859-1"),"UTF-8");
	out.print("<tr>");
	out.print("<td bgcolor=yellow>"+ss2+"</td>");
	out.print("</tr>");
}
%>

<div id="nav">
          <h1 class="tit14">推荐教师</h1>
<%
if (user.equals("student"))
{
	  out.print("<form action='yuyue.jsp'>");    
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
          <a href="search.jsp?teachername=def" target="_self" title="郑永挺&nbsp;教授&#10;博士生导师&#10;航天学院&#10;" style="text-decoration:none;">
            <span>郑永挺</span><br>
            <span style="cursor:default;color:gray;font-size:12px;">航天学院</span>
          </a>
        
          <a href="http://homepage.hit.edu.cn/caoqingjie" target="_self" title="曹庆杰&nbsp;教授&#10;博士生导师&#10;航天学院&#10;" style="text-decoration:none;">
            <span>曹庆杰</span><br>
            <span style="cursor:default;color:gray;font-size:12px;">航天学院</span>
          </a>
        
          <a href="http://homepage.hit.edu.cn/lghit" target="_self" title="刘杨&nbsp;副教授&#10;航天学院&#10;" style="text-decoration:none;">
            <span>刘杨</span><br>
            <span style="cursor:default;color:gray;font-size:12px;">航天学院</span>
          </a>
        
          <a href="http://homepage.hit.edu.cn/maping" target="_self" title="马萍&nbsp;教授&#10;博士生导师&#10;航天学院&#10;" style="text-decoration:none;">
            <span>马萍</span><br>
            <span style="cursor:default;color:gray;font-size:12px;">控制科学与工程</span>
          </a>
        
          <a href="http://homepage.hit.edu.cn/wangch" target="_self" title="王常虹&#10;博士生导师&#10;航天学院" style="text-decoration:none;">
            <span>王常虹</span><br>
            <span style="cursor:default;color:gray;font-size:12px;">控制科学与工程</span>
          </a>
        
          <a href="http://homepage.hit.edu.cn/wangyan2012" target="_self" title="王岩&nbsp;教授&#10;博士生导师&#10;航天学院&#10;学以致用、砥砺前行" style="text-decoration:none;">
            <span>王岩</span><br>
            <span style="cursor:default;color:gray;font-size:12px;">控制科学与工程</span>
          </a>
      </div>
</table>
      <div id="grxxxq">
        <div class="">
          
          <div class="show-gx-grxx">
            <div class="grbox">
              <div class="" id="2d2c0759ccae47b7b20edea268149d36" name="基本信息" >
                <h3 class="tit22"><span class="glyphicon glyphicon-user gr-tittle-img"></span>基本信息</h3>
                <div class="grxx-text table_biaoge">
                  
                    <p>
	哈尔滨工业大学教授/博导、理学院院长、航天学院智能控制与系统研究所所长；教育部长江学者特聘教授，国家杰出青年基金获得者，IEEE Fellow。
</p>
<p>
	1976年生于黑龙江省集贤县，1995年在陕西第一工业学校中专毕业，1997年自学考试本科毕业，2005年在哈工大获博士学位，同年在哈工大破格晋升为教授。曾在多个国家留学访问。
</p>
<p>
	在网络化控制、光机电一体化装备、机器人智能系统等领域取得创新性研究成果，在IEEE汇刊发表论文100余篇，论文被SCI期刊他引1万余次，他引H因子65，出版英文专著3部，获授权国家发明专利50余项。2014年和2008年两次获得国家自然科学二等奖（分别排名第一和第五）。
</p>
<p>
	目前担任IEEE工业电子学会执委会委员(AdCom Member)、IFAC国际自动控制联合会理事会成员(Council Member)、香港大学荣誉教授。在国际期刊IEEE Trans. Industrial Electronics担任共同主编，并担任Automatica及5个IEEE&nbsp;<span style="line-height:1.5;">Transactions系列汇刊编委，在10余个国际会议上担任大会主席或程序委员会主席。是全球高被引学者，2014年入选汤森路透发布的世界最具影响力科学家榜单。</span>
</p>
<p>
	担任第十二届全国青联常委、第五届中国青年科技工作者协会常务理事、黑龙江省青联副主席。曾获全国先进工作者、中国青年五四奖章、国务院政府特殊津贴等荣誉。
</p>
                  
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