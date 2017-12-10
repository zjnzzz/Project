<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>日常业务-个人日程</title>
	<title>日程</title>
	<link href="css1/style.css" rel="stylesheet" type="text/css" />
	<link type="text/css" rel="stylesheet" href="css1/jquery/themes/base/jquery.ui.all.css"/>
	<link rel='stylesheet' href='css1/fullcalendar.css'  />
	<link rel='stylesheet' href='css1/fullcalendar.print.css'  media='print' />
	<link rel="stylesheet" href="css1/fancybox/fancybox.css" type="text/css" />
	<script type="text/javascript" src="js1/jquery1.9.js"></script>
	<script type="text/javascript" src="js1/jquery-ui.custom.js"></script>
	<script type="text/javascript" src="js1/fullcalendar.min.js"></script>
	<script type="text/javascript" src="js1/fancybox/jquery.fancybox-1.3.1.pack.js"></script>
	<style type='text/css'>
		body {
		margin-left: 200px;
		text-align: center;
		font-size: 18px;
		
		 
		}
		#calendar {
		width: 900px;
		height: 800px;
		margin: 0 auto;
		}
	</style>
	<!-- font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif; -->
	<script type="text/javascript">
		var fancybox1;
	    $(document).ready(function() {
	    
	       $('#calendar').fullCalendar({
	           	header: {
	              left: 'prev,next today',
	              center: 'title',
	              right: 'month,agendaWeek,agendaDay'
	           	},
	          	theme:true,
	          	monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],  
	          	monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],  
	          	dayNames: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],  
	          	dayNamesShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],  
	          	today: ["今天"],  
	         	buttonText: {  
		          	today: '今天',  
		          	month: '月',  
		          	week: '周',  
		          	day: '日'  
	          	},  
	           	editable: false,
	           	events:function(start, end, callback) { //在日历中的天显示相应日程
		           	var urlR ="toJson_ForCalandar.action";//后台查询日程，返回json格式
		           	$.ajax({  
			            url: urlR,
			            cache:false,  
			            success:function(data) {  
			                var events = [];  
			                var info = eval(data);  
			                for (var i = 0; i < info.length; i++) {
			                   	var ev = info[i];  
			                    var title = ev.title; 
			                    var x; 
			                    if(ev.isAllDay==1){
			                      x=true;
			                    }else{
			                        x=false;
			                    }
			                   	//var evtstart=formatJson(ev.startTime.time);
			                   // var evtend=formatJson(ev.endTime.time);
			                    var evtstart=ev.startDate;
			                    var evtend=ev.endDate;
			                    events.push({   //设置在日历中的天显示相应日程的样式
			                        title:title,  
			                        start:evtstart,  
			                        end:evtend,  
			                        backgroundColor:'#34c9df', 
			                        allDay:x
			                   	});  
			                }  
			                callback(events);  
			            }
		          	});  
	         },eventClick: function(calEvent, jsEvent, view) {   //点击日程事件
	         	alert('点击日程事件');
				//window.location.href=baseURL+"/kinth/daily/perschedule/perscheduleByCalMain.jsp";
			 },dayClick:function(date, allDay, jsEvent, view){	//点击天事件
				  //$(this).css({color: "red", background: "blue" });
	         	  //$(this).removeClass("ui-widget-content");
	         	alert('点击天事件');
	         	//window.location.href=baseURL+"/listCategory.do?appType=HDOA_GRRC";
	         	$.fancybox({ 
	                'type':'ajax', 
	                //'href':'event.php?action=edit&id='+calEvent.id,
	                //'href':'perschedule_add.jsp'
	                href:'perschedule_add.jsp'    
	            }); 
	         }   
	       });
	   });
	 </script>
 
	 <script type="text/javascript">
	 	//格式化时间函数,此函数为了处理json格式中带date类型数据的
		function formatJson(time){
			var jsonDate=new Date(parseInt(time));
			var result = jsonDate.format("yyyy-MM-dd hh:mm:ss");
			return result;
		}
		
		Date.prototype.format = function(format){
		    var o ={
		        "M+" : this.getMonth()+1, //month
		        "d+" : this.getDate(),    //day
		        "h+" : this.getHours(),   //hour
		        "m+" : this.getMinutes(), //minute
		        "s+" : this.getSeconds(), //second
		        "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
		        "S" : this.getMilliseconds() //millisecond
		    };
		    if(/(y+)/.test(format))
		    format=format.replace(RegExp.$1,(this.getFullYear()+"").substr(4 - RegExp.$1.length));
		    for(var k in o)
		    if(new RegExp("("+ k +")").test(format))
		    format = format.replace(RegExp.$1,RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
		    return format;
		};
	 	function test1(){
	 		$('#calendar').fullCalendar('refetchEvents');
	 	
	 	}
	 </script>
</head>

<body style="margin-left: 40px;margin-top: 0px;margin-right: 4px;margin-bottom: 4px;">
 <div id="content" >
	 <div id="calendar" style="margin:3em 0;font-size:13px" class="fc"></div>
 </div>
 <input type="button" value="测试1111111111111111111111111111111" onclick="test1()" />
 </body>
</html>
