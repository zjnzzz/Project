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
	<link href="heeh/css1/style.css" rel="stylesheet" type="text/css" />
	<link type="text/css" rel="stylesheet" href="heeh/css1/jquery/themes/base/jquery.ui.all.css"/>
	<link rel='stylesheet' href='heeh/css1/fullcalendar.css'  />
	<link rel='stylesheet' href='heeh/css1/fullcalendar.print.css'  media='print' />
	<link rel="stylesheet" href="heeh/css1/fancybox/fancybox.css" type="text/css" />
	<script type="text/javascript" src="heeh/js1/jquery.js"></script>
	<script type="text/javascript" src="heeh/js1/jqueryui/jquery-ui-1.10.3.custom.js"></script>
	<script type="text/javascript" src="heeh/js1/fullcalendar.min.js"></script>
	<script type="text/javascript" src="heeh/js1/fancybox/jquery.fancybox-1.3.1.pack.js"></script>
	<script type="text/javascript" src="heeh/js1/jqueryui/jquery.form.min.js"></script>
	<script type="text/javascript" src="heeh/js1/jqueryui/lan/jquery.ui.datepicker-zh-CN.js"></script>
	<script type="text/javascript" src="heeh/js1/common/common.js"></script>
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
	           	height:500,//设置高度
	           	width:500,//设置宽度
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
	           	eventLimit: true,
	           	views: {
			        agenda: {
			            eventLimit: 2 // adjust to 6 only for agendaWeek/agendaDay
			        }
			    },
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
			                    var _color=ev.color;
			                   	var evtstart=(ev.startDate!=null)?formatJson2(ev.startDate,'yyyy-MM-dd'):null;
			                    var evtend=(ev.evtend!=null)?formatJson2(ev.evtend,'yyyy-MM-dd'):null;
			                    //var evtstart=ev.startDate;
			                    //var evtend=ev.endDate;
			                    events.push({   //设置在日历中的天显示相应日程的样式
			                        title:title,  
			                        start:evtstart,  
			                        end:evtend,  
			                        backgroundColor:_color,//设置背景颜色 
			                        allDay:x,
			                        startDate:evtstart,//开始时间
			                        endDate:evtend,//结束时间
			                        startTime:ev.startTime,//
			                        endTime:ev.endTime,//
			                        isAllDay:ev.isAllDay,//
			                        isEnd:ev.isEnd,//
			                        content:ev.content,//
			                        id:ev.id//
			                        
			                   	});  
			                }  
			                callback(events);  
			            }
		          	});  
	         },eventClick: function(calEvent, jsEvent, view) {   //点击日程事件
	         	alert('点击日程事件');
				//window.location.href=baseURL+"/kinth/daily/perschedule/perscheduleByCalMain.jsp";
				//重置页面数据
	         	resetPage();
	         	//初始化数据
	         	$("#action").val("update");
	         	$("#sid").val(calEvent.id);
		   		$("#event").val(calEvent.title);
		        $("#startdate").val(calEvent.startDate);
		        $("#enddate").val(calEvent.endDate);
		        $("#sel_start").val(calEvent.startTime);
		        $("#sel_end").val(calEvent.endTime);
		        $("#sel_start").val(calEvent.id);
		        $("#color").val(calEvent.backgroundColor);
		        $("#isallday").attr("checked",(calEvent.isAllDay==null || calEvent.isAllDay==1)?'true':'false');
	        	$("#isend").attr("checked",(calEvent.isEnd==0)?'true':'false');
	        	$.fancybox({ 
	                'href':'#inlineAdd',
					'width':540,
					'height':360
	            });
			 },dayClick:function(date, allDay, jsEvent, view){	//点击天事件
				  //$(this).css({color: "red", background: "blue" });
	         	  //$(this).removeClass("ui-widget-content");
	         	alert('点击天事件');
	         	//window.location.href=baseURL+"/listCategory.do?appType=HDOA_GRRC";
	         	var selDate =$.fullCalendar.formatDate(date,'yyyy-MM-dd');
	         	//重置页面数据
	         	resetPage();
	         	$("#startdate").val(selDate);
	         	$.fancybox({ 
	                //'type':'ajax', 
	                //'href':'event.php?action=edit&id='+calEvent.id,
	                //'href':'perschedule_add.jsp'
	                'href':'#inlineAdd',
	                /*,'overlayShow':true,
					'hideOnOverlayClick':false,
					'hideOnContentClick':false,
					'enableEscapeButton':false,
					'showCloseButton':false,
					'centerOnScroll':true,
					'autoScale':false,*/
					//'showCloseButton':false,
					'width':540,
					'height':360
	            }); 
	         }   
	       });
	   });
	   
	   function resetPage(){
	   		$("#action").val("add");
	   		$("#sid").val("");
	   		$("#event").val("");
	        $("#startdate").val("");
	        $("#enddate").val("");
	        $("#sel_start").val("");
	        $("#sel_end").val("");
	        $("#isallday").attr("checked",'true');
	        $("#isend").attr("checked",'false');
	   }
	 </script>
 
	 <script type="text/javascript">
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
 <div style="display:none">
 	<div class="fancy" id="inlineAdd"> 
	    <h3>新建事件</h3> 
	    <form id="add_form" action="updateSchedule_ForCalandar.action" method="post"> 
		    <input type="hidden" id="action" name="action" value="add" /> 
		    <input type="hidden" id="sid" name="id" value="" /> 
		    <input type="hidden" id="color" name="color" value="" /> 
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
 </div>
 </body>
</html>
