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
	//初始化开始时间
	onAddOption("s_hour",24);
	onAddOption("s_minute",24);
	//初始化结束时间
	onAddOption("e_hour",24);
	onAddOption("e_minute",24);
	
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

//为指定控件添加选项
function onAddOption(_fieldId,_nums){
	if(_nums){
		$('#'+_fieldId).empty();
		for(var i=0;i<_nums;i++){
			var result=""+i;
			if(result.length==1) result="0"+result;
			$('#'+_fieldId).append("<option value='"+result+"'>"+result+"</option>");
		}
	}
}

function onHideDateControl(_isallday,isend){
	$("#sel_start").css("display",_isallday?"none":"block");
	$("#sel_end").css("display",_isallday?"none":"block");
	$("#enddate").css("display",isend?"block":"none");
}

/**
 * 随机生成红、绿、蓝任意一种颜色
 * @returns
 */
function onRandomColor(){
	var _color=["red","green","blue"];
	return _color[parseInt(3*Math.random())+1];
}

//格式化时间函数,此函数为了处理json格式中带date类型数据的
function formatJson(time){
	var jsonDate=new Date(parseInt(time));
	var result = jsonDate.format("yyyy-MM-dd hh:mm:ss");
	return result;
}

function formatJson2(time,ftPart){
	var jsonDate=new Date(time);
	var _format="yyyy-MM-dd hh:mm:ss";
	if(ftPart) _format=ftPart;
	var result = jsonDate.format(_format);
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
	