var $scatterPlot = function(divID,title,subtitle,xAxis,yAxis,isLengend,plotData){
	//画点图
	//divID: 画布所在的区域
	//xAxis:
	//yAxis:
	//title: 标题
	//subtitle: 子标题
	//plotData: 矩阵[{name:"",color:"",data:[[x,y]]},{name:"",color:"",data:[[x,y]]},...]
	$("#"+divID).highcharts({
			    chart: {
			        type: 'scatter',
			        zoomType: 'xy'
			    },
			    title: {
			        text: title
			    },
			    subtitle: {
			        text: subtitle
			    },
			    credits:{
			    	enabled: false
			    },
			    xAxis:{
			        title:{
			            enabled: true,
			            text: xAxis
			        },
			        startOnTick: true,
			        endOnTick: true,
			        showLastLabel: true
			    },
			    yAxis: {
			        title: {
			            text: yAxis
			        }
			    },
			    legend: {
			    	enabled : isLengend,
			        layout: 'vertical',
			        align: 'left',
			        verticalAlign: 'top',
			        x: 100,
			        y: 70,
			        floating: true,
			        backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
			        borderWidth: 1
			    },
			    plotOptions: {
			        scatter: {
			            marker: {
			                radius: 5, //点的大小
			                fillColor: 'rgba(119, 152, 191, .5)',
			                states: {
			                    hover: {
			                        enabled: true,
			                        fillColor: 'rgba(119, 152, 191, .5)',
			                        lineColor: 'rgb(100,100,100)' //鼠标悬浮后点的边框颜色
			                    }
			                },
			                symbol: 'diamond' //点的形状"circle", "square", "diamond", "triangle" and "triangle-down"
			            },
			            states: {
			                hover: {
			                    marker: {
			                        enabled: false
			                    }
			                }
			            },
			            tooltip: {
			                headerFormat: '<b>gene symbol:{series.name}</b><br>',
			                pointFormat: 'cancer type count: {point.x}<br/>ME pair count: {point.y}'
			            }
			        }
			    },
			    //[{"name":"A2ML1","color":"red","data":[[x,y]]},{"name":"AARSD1","color":"yellow","data":[[1,6]]}]
			    series: plotData
			});
};