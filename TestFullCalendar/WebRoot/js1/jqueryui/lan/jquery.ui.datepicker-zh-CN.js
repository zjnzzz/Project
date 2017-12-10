jQuery(function($){
	$.datepicker.regional['zh-CN'] = {
		closeText: '关闭',
		prevText: '<上月',
		nextText: '下月>',
		currentText: '今天',
		monthNames: ['一月','二月','三月','四月','五月','六月',
		'七月','八月','九月','十月','十一月','十二月'],
		monthNamesShort: ['一','二','三','四','五','六',
		'七','八','九','十','十一','十二'],
		dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],
		dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'],
		dayNamesMin: ['日','一','二','三','四','五','六'],
		weekHeader: '周',
		dateFormat: 'yy-mm-dd',
		firstDay: 1,
		isRTL: false,
		showMonthAfterYear: true,
		clearText:"清除",//清除日期的按钮名称
		closeText:"关闭",//关闭选择框的按钮名称
		yearSuffix: '年', //年的后缀
		//minDate:'2011-03-05',//最小日期
		//maxDate:'2011-03-20',//最大日期
	};
	$.datepicker.setDefaults($.datepicker.regional['zh-CN']);
});