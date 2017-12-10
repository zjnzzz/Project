<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
	<link href='css/fullcalendar.css' rel='stylesheet' />
	<link href='css/fullcalendar.print.css' rel='stylesheet' media='print' />
	<script src='js/moment.min.js'></script>
	<script src='js/jquery.min.js'></script>
	<script src='js/fullcalendar.min.js'></script>
	<script type="text/javascript">
		$(function(){
			 $('#calendar').fullCalendar({
				header: {
					left: 'prev,next today',
					center: 'title',
					right: 'month,agendaWeek,agendaDay'
				},
				//defaultDate: '2015-02-12',
				theme:true,  
	          	monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],    
	          	monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],    
	          	dayNames: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],    
	          	dayNamesShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],    
	          	today: ["今天"],    
	          	buttonText: {   
	          		prev: ' ◄ ',
	                next: ' ► ',
	                prevYear: ' << ',
	                nextYear: ' >> ', 
		          	today: '今天',    
		          	month: '月',    
		          	week: '周',    
		          	day: '日'    
	          	},
	          	editable: true,//允许编辑
				selectable: true,//选择表格
				selectHelper: true,
				select: function(start, end) {
					var title = prompt('Event Title:');
					var eventData;
					if (title) {
						eventData = {
							title: title,
							start: start,
							end: end
						};
						$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
					}
					$('#calendar').fullCalendar('unselect');
				},
				eventLimit: true, // allow "more" link when too many events
				events: [
					{
						title: 'All Day Event',
						start: '2015-02-01'
					},
					{
						title: 'Long Event',
						start: '2015-02-07',
						end: '2015-02-10'
					},
					{
						id: 999,
						title: 'Repeating Event',
						start: '2015-02-09T16:00:00'
					},
					{
						id: 999,
						title: 'Repeating Event',
						start: '2015-02-16T16:00:00'
					},
					{
						title: 'Conference',
						start: '2015-02-11',
						end: '2015-02-13'
					},
					{
						title: 'Meeting',
						start: '2015-02-12T10:30:00',
						end: '2015-02-12T12:30:00'
					},
					{
						title: 'Lunch',
						start: '2015-02-12T12:00:00'
					},
					{
						title: 'Meeting',
						start: '2015-02-12T14:30:00'
					},
					{
						title: 'Happy Hour',
						start: '2015-02-12T17:30:00'
					},
					{
						title: 'Dinner',
						start: '2015-02-12T20:00:00'
					},
					{
						title: 'Birthday Party',
						start: '2015-02-13T07:00:00'
					},
					{
						title: 'Click for Google',
						url: 'http://google.com/',
						start: '2015-02-28'
					}
				]
			});
		});
      
	</script>
	<style type='text/css'>  
        body {  
        margin-left: 200px;  
        text-align: center;  
        font-size: 18px;  
        font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;  
           
        }  
        #calendar {  
        width: 900px;  
        height: 800px;  
        margin: 0 auto;  
        }  
    </style>  
  </head>
  
  <body>
    <div id="calendar"></div>
  </body>
</html>
