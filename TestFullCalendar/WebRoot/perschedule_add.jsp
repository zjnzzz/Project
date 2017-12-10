<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'perschedule_add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css1/jquery/themes/base/jquery.ui.all.css" rel="stylesheet" type="text/css" />
	<link href="css1/fancybox/fancybox.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js1/jquery.js"></script>
	<script type="text/javascript" src="js1/jqueryui/jquery-ui.js"></script>
	<script type="text/javascript" src="js1/jqueryui/jquery.form.min.js"></script>
	<script type="text/javascript" src="js1/fancybox/jquery.fancybox-1.3.1.pack.js"></script>
	<script type="text/javascript" src="js1/jqueryui/lan/jquery.ui.datepicker-zh-CN.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".datepicker").datepicker({
				minDate: 0,//最小日期
				//maxDate: 3,
				numberOfMonths:1,//显示几个月
				showButtonPanel:false,//是否显示按钮面板
				dateFormat: 'yy-mm-dd',//日期格式
				showMonthAfterYear:true,//是否把月放在年的后面
				//defaultDate:'2011-03-10',//默认日期
				onSelect: function(selectedDate) {//选择日期后执行的操作
					alert(selectedDate);
				}
			});
			$("#isallday").click(function(){
				if($("#sel_start").css("display")=="none"){
					$("#sel_start,#sel_end").show();
				}else{
					$("#sel_start,#sel_end").hide();
				}
			});
			
			$("#isend").click(function(){
				if($("#p_endtime").css("display")=="none"){
					$("#p_endtime").show();
				}else{
					$("#p_endtime").hide();
				}
				$.fancybox.resize();//调整高度自适应
			});
			
			//提交表单
			$('#add_form').ajaxForm({
				beforeSubmit: showRequest, //表单验证
		        success: showResponse //成功返回
		    }); 
			
			//删除事件
			$("#del_event").click(function(){
				if(confirm("您确定要删除吗？")){
					var eventid = $("#eventid").val();
					$.post("do.php?action=del",{id:eventid},function(msg){
						if(msg==1){//删除成功
							$.fancybox.close();
							$('#calendar').fullCalendar('refetchEvents'); //重新获取所有事件数据
						}else{
							alert(msg);	
						}
					});
				}
			});
		});
		
		function showRequest(){
			var events = $("#event").val();
			if(events==''){
				alert("请输入日程内容！");
				$("#event").focus();
				return false;
			}
		}
		
		function showResponse(responseText, statusText, xhr, $form){
			if(statusText=="success"){	
				if(responseText.status==1){
					$.fancybox.close();
					$('#calendar').fullCalendar('refetchEvents'); //重新获取所有事件数据
				}else{
					alert(responseText);
				}
			}else{
				alert(statusText);
			}
		}
	</script>
  </head>
  
  <body>
    <div class="fancy"> 
	    <h3>新建事件</h3> 
	    <form id="add_form" action="addSchedule_ForCalandar.action" method="post"> 
		    <input type="hidden" name="action" value="add" /> 
		    <p>日程内容：
		    	<input type="text" class="input" name="event" id="event" style="width:320px" placeholder="记录你将要做的一件事..." />
		    </p> 
		    <p>开始时间：
		    	<input type="text" class="input datepicker" name="startdate" id="startdate" 
		 			value="" /> 
		    	<span id="sel_start" style="display:none">
		    		<select name="s_hour"> 
		        		<option value="00">00</option> 
		    		</select>: 
		    		<select name="s_minute"> 
				        <option value="00" selected>00</option> 
				    </select> 
		    	</span> 
		    </p> 
		    <p id="p_endtime" style="display:none">结束时间：
		    	<input type="text" class="input datepicker" name="enddate" id="enddate" value="" /> 
			    <span id="sel_end" style="display:none">
				    <select name="e_hour"> 
				        <option value="00">00</option> 
				    </select>: 
				    <select name="e_minute"> 
				        <option value="00" selected>00</option> 
				    </select> 
			    </span> 
		    </p> 
		    <p> 
		    <label><input type="checkbox" value="1" id="isallday" name="isallday" checked>全天</label> 
		    <label><input type="checkbox" value="1" id="isend" name="isend"> 结束时间</label> 
		    </p> 
		    <div class="sub_btn">
		    	<span class="del">
		    		<input type="button" class="btn btn_del" id="del_event" value="删除" />
		  		</span> 
		    	<input type="submit" class="btn btn_ok" value="确定" /> 
		    	<input type="button" class="btn btn_cancel" value="取消" onClick="$.fancybox.close();" />
			</div> 
	    </form> 
	</div> 
  </body>
</html>
