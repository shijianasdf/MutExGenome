var $columnPlot = function(divID,xLables,ytitle,title,subtitle,stacking,isLengend,plotData){
	//画柱状图
	//divID: 画布所在的区域
	//xLables: X坐标轴,向量["","","","",...]
	//ytitle: Y坐标轴
	//title: 标题
	//subtitle: 子标题
	//stacking: 是否堆叠图  "normal" null 
	//plotData: 堆叠图:矩阵[{name:"",color:"",data:[]},{name:"",color:"",data:[]},...],普通柱状图:向量[{name:"",color:"",data:[]}]
	$('#'+divID).highcharts({
	    chart: {
	        type: 'column', //柱状图
	        //margin: [0, 0, 0, 0]
	    },
        title: {
        	text:title  //图片标题
        },
        subtitle:{
        	text:subtitle  //图片副标题
        },
	    xAxis: {
	    	categories: xLables, //
	        showEmpty: false,    
	        labels: {
	        	//x: -20,
                rotation: -50,
                align: 'right',
	            style: {
 		           fontSize: '9px',
	            }
	        }
	    },
	    yAxis: {
	    	showEmpty: false,	 
            title: {                                                                                 
                text: ytitle,                             
//                align: 'high'                                              
            }, 
	    },
        legend: {    //图例       
        	enabled: isLengend,
            layout: 'vertical',                                      
            align: 'right',      
            verticalAlign: 'top',     
            //x: -80,                                                        
            y: 40,                                                        
            floating: true,       
            borderWidth: 0,                                        
            backgroundColor: '#FFFFFF',                                    
            shadow: true,   
            reversed: true	
        }, 
        credits: {			
            enabled: false  //去掉highchart连接
        },
        tooltip:{
            formatter: function(){ //提示框内容格式化回调函数，返回 false 可以针对某个点或数据列关闭提示框，该函数里可以执行复杂的逻辑来返回需要的内容。
                var s = '<b>' + this.x + '</b>';
                $.each(this.points, function () {  //在共享的提示框里，数据点对象可以 this.points 来获取，该对象是个数组，表示同一个 x 值下的所有数据点；在非共享的提示框中，数据点对象是通过 this.point 来获取，表示当前数据点对象。
                    s += '<br/>' + this.series.name + ': ' + this.y;
                });
                return s;
            },
            shared: true, //提示框共享
            useHTML: true
        },
	    plotOptions: {
	    	column: {
                pointPadding: 0.2,
                borderWidth: 0,
                stacking: stacking  //是否开启堆叠，可用的参数值包括 null（不进行堆叠）、"normal"（普通堆叠） 和 "percent"（百分比堆叠）。
            }
        },       
        series:plotData, //数据
	});		
}