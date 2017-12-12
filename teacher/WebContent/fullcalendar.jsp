<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
    
    <head>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    
    <title>如何获取系统日期</title>
   <body>
        <br/>
        <br/>
        <br/>
        <img style="position:absolute;left:0px;top:0px;width:100%;height:100%;z-Index:-1; border:0px solid rgb(255, 0, 221)" />
        <form action="add2.jsp" method="post">
        <script language="javascript" type="text/javascript">
          
            var now= new Date();
          
            var year=now.getFullYear();
          
            var month=now.getMonth();
          
            var datee=now.getDate();
              
            var time;
            time=year+"-"+(month+1)+"-"+datee;
            document.write("日期：<input type='date' name='bday' min="+time+">");
          </script>
          </br>
          <p>时间段：
          <input type="time" name="usr_time1">到
          <input type="time" name="usr_time2"></p>
        <p>&nbsp;事件内容: <input type="text" name="title"></p>
          <input type="submit" value="增加">
          </form>
   
    </body>
    
    </html>