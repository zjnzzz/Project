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
<!DOCTYPE html>
<html lang="zh" class="no-js">
<head>
<meta charset="utf-8">
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />
<!--[if IE]>
  <script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
<![endif]-->
</head>
<body background="bg.jpg">
<form action="chuli.jsp" method="GET" >    
</header>
<section class="content bgcolor-8">
    <h2>&nbsp;&nbsp;选择您的登陆身份</h2>
    <select name="user" id="input-4">
            <option value="teacher">教师</option>
            <option value="student">学生</option>
            </select>
    <br/>
    				<span class="input input--isao">
        <input class="input__field input__field--isao" type="text" id="input-38" name="username"/>
        <label class="input__label input__label--isao" for="username">
            <span class="input__label-content input__label-content--isao">用户名</span>
        </label>
    </span>
    <br/>
    <span class="input input--isao">
        <input class="input__field input__field--haruki" type="password" id="input-39" name="password"/>
        <label class="input__label input__label--isao" for="password">
            <span class="input__label-content input__label-content--isao">密码</span>
        </label>
    </span>
				    <span class="input input--minoru">
        <input class="input__field input__field--minoru" type="submit" value="登陆" id="input-3" />
        <label class="input__label input__label--minoru" for="input-3">
                <span class="input__label-content input__label-content--minoru"></span>
        </label>
        <span>
</section>
</form>
</body>
</html>