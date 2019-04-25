<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="../images/favicon.png"> 
    <title>MutExGenome</title>
    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
<!--     <link href="../css/nprogress.css" rel="stylesheet"> -->
<!--     Custom Theme Style -->
    <link href="../css/custom.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/loading.css" type="text/css" media="screen" />
    <!-- datatable Stylesheet-->
    <link rel="stylesheet" href="../js/Bootstrap-DataTables-1.10.16/DataTables-1.10.16/css/dataTables.bootstrap.min.css" type="text/css">
    <!-- cytoscape Stylesheet-->
    <link rel="stylesheet" href="../js/cytoscape/css/cytoscape.js-panzoom.css" type="text/css">
    <link rel="stylesheet" href="../js/cytoscape/css/cytoscape.js-navigator.css" type="text/css">
    <link href="../css/font-awesome-4.0.3/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <!-- ztree Stylesheet-->
    <link rel="stylesheet" href="../js/zTree/css/metroStyle/metroStyle.css">
    <!-- qtip2 -->
    <link rel="stylesheet" type="text/css" href="../js/jquery-qtip2/jquery.qtip.min.css">
     <!-- jQuery -->
    <script src="../js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../js/bootstrap.min.js"></script>
    <!-- NProgress -->
<%--     <script src="../js/nprogress.js"></script> --%>
    <!-- Custom Theme Scripts -->
    <script src="../js/custom.min.js"></script>
    
    <!-- DataTable -->
    <script src="../js/Bootstrap-DataTables-1.10.16/datatables.min.js"></script>
    <script src="../js/Bootstrap-DataTables-1.10.16/DataTables-1.10.16/js/dataTables.bootstrap.min.js"></script>
    <!-- zTree -->
<%--     <script type="text/javascript" src="../js/zTree/js/jquery.ztree.all.min.js"></script> --%>
    <script type="text/javascript" src="../js/zTree/js/jquery.ztree.core.min.js"></script>
<%--     <script type="text/javascript" src="../js/zTree/js/jquery.ztree.excheck.min.js"></script> --%>
<%--     <script type="text/javascript" src="../js/zTree/js/jquery.ztree.exedit.min.js"></script> --%>
<%--     <script type="text/javascript" src="../js/zTree/js/jquery.ztree.exhide.min.js"></script>  --%> 
    <!-- highcharts -->
	<script type="text/javascript" src="../js/highcharts/highcharts.js"></script>
	<script type="text/javascript" src="../js/highcharts/highcharts-more.js"></script>
	<script type="text/javascript" src="../js/highcharts/modules/exporting.js"></script>
	<script type="text/javascript" src="../js/highcharts/modules/export-data.js"></script>
	<script type="text/javascript" src="../js/expackages/columnPlot.js"></script>
    <style>
     .tableTitle{
       font-family: "Lucida Grande", "Lucida Sans Unicode", Arial, Helvetica, sans-serif;
                     	color: #333333;
                        font-size: 18px;
                        fill: #333333;
                        text-align:center;
       } 
    </style>
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="/MutExGenome/index.jsp" class="site_title"><span>MutExGenome</span></a>
            </div>
            <div class="clearfix"></div>
            <!-- /menu profile quick info -->
            <br />
            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>Welcome to MutExGenome</h3>
                <ul class="nav side-menu">
                  <li><a href="/MutExGenome/index.jsp"><i class="fa fa-home"></i> Home <span class="fa fa-chevron-right"></span></a></li>
                  <li><a href="/MutExGenome/jsp/Browse.jsp"><i class="fa fa-film"></i> Browse <span class="fa fa-chevron-right"></span></a></li>
                  <li><a href="/MutExGenome/jsp/AdvancedSearch.jsp"><i class="fa fa-search"></i> Search <span class="fa fa-chevron-right"></span></a></li>
                  <li><a href="/MutExGenome/jsp/Download.jsp"><i class="fa fa-download"></i> Download <span class="fa fa-chevron-right"></span></a></li>
                  <li><a href="/MutExGenome/jsp/Submit.jsp"><i class="fa fa-upload"></i> Submit <span class="fa fa-chevron-right"></span></a></li>
                 <!--  <li><a href="/MEddc/jsp/Contact.jsp"><i class="fa fa-envelope"></i> Contact <span class="fa fa-chevron-right"></span></a></li></li> -->
                  <li><a href="/MutExGenome/jsp/Help.jsp"><i class="fa fa-book"></i> Help <span class="fa fa-chevron-right"></span></a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <!-- top navigation -->
<!--         <div class="top_nav"> -->
<!--           <div class="nav_menu"> -->
<!--             <nav style="height:60px;"> -->
<!--               <div class="nav toggle"> -->
<!--                 <a id="menu_toggle"><i class="fa fa-bars"></i></a> -->
<!--               </div> -->
<!--             </nav> -->
<!--           </div> -->
<!--         </div> -->
        <!-- /top navigation -->
        <!-- page content -->
        <div class="fuzzy-advSearch" id="fuzzy"></div>
	      <div class="loading" id="loading">
		  <img alt="loading" title="loading" src="../images/index.gif">
        </div>
        <div class="right_col" role="main">
          <div class="">
            <div class="row">
              <div class="col-md-3 col-sm-3 col-xs-3" >
                  <div id="treeView" class="x_panel"  style="height:1377px;overflow-y:auto;overflow-x:auto;">
                  <div class="x_title">
                  	<h2><i class="fa fa-tree"></i> Tree View</h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br/>
                    <ul id="tree" class="ztree"></ul>
                    <script>
					    function onClick(event, treeId, treeNode, clickFlag){
					        var zTree = $.fn.zTree.getZTreeObj("tree");
					        var nodes = zTree.getSelectedNodes();
					        parents = nodes[0].pId;
					        sons = nodes[0].id;
					        if(nodes[0].id == "Genes/Events" || nodes[0].id == "Cancers" || nodes[0].pId == "Cancers" || nodes[0].pId == "Genes/Events" ||nodes[0].pId == "Genes"){	
					        }else{
					        	$.ajax({
					        		url:"Memain!SearchNode",
					        		type:"POST",
					        		data:{
					        			parent:nodes[0].pId,
					        			son:nodes[0].id
					        		},
					        		dataType:"json",
					        		beforeSend:function(){
					        			$("#fuzzy").css("display","block");
					        	    	$("#loading").css("display","block");
					        	    	$("#statistics").css("display","none");
					        	    	if(window.cy){  //js判断对象是否存在
					        	    		cy.destroy();
					        	    		$(".container.body").nextAll().remove();
					        	    	}	        	    	
					        		},
					        		success:function(returnMsg){
					        			    $("#fuzzy").css("display","none");
					        			    $("#loading").css("display","none");
					        			    var JSONObject = JSON.parse(returnMsg.resultTable);//杩欐槸涓�涓狫SON瀵硅薄 string杞琷son
					        			    $("#ContainerTable").empty();
					        			    $("#ContainerTable").html('<table id="TestTable" class="table table-striped table-bordered table-hover" style="width:100%;"><thead><tr><th>Tissue Origin</th><th>Cancer Type</th><th>Subtype</th><th>Gene A</th><th>Aberrance TypeA</th><th>Gene B</th><th>Aberrance TypeB</th><th>Source</th><th>Details</th></tr></thead><tbody></tbody></table>');
					        			    for(var i = 0;i<JSONObject.length;i++){
					        			    	$("#TestTable tbody").append("<tr><td>"+JSONObject[i].tissueorigin+"</td><td>"+JSONObject[i].cancertype+"</td><td>"+JSONObject[i].subtype+"</td><td>"+JSONObject[i].genename1+"</a></td><td>"+JSONObject[i].aberrancetype1+"</td><td>"+JSONObject[i].genename2+"</td><td>"+JSONObject[i].aberrancetype2+"</td><td>"+JSONObject[i].evidence+"</td><td><a target='_blank' href='Memain!DetailSearch?id="+JSONObject[i].mainid+"'><i class='fa fa-external-link'></i> Details</a></td></tr>");
					        			    }
					        			    $("#TestTable").DataTable({
					        				    dom: '<"top"Bf>rt<"bottom"lp><"clear">',  //B代表button，f代表filter input，l代表length changing input control p代表pagination control
					        					buttons: [
					        						  'copy', 'csv', 'excel', 'pdf', 'print'
					        				    ],
					        				});
					        			    $("#treeDisplay").css("display","block");
					        			    var nodes = null;
					        			    var reg=/^[A-Z]+$/; 
					        			    if(reg.test(parents) || parents == "Chromosomal Events" || parents == "Structural Variation Events"){
					        			    	nodes = $changeLayout(returnMsg.node,JSON.parse(returnMsg.nodes),"#F5A45D","star");
					        			    }else{
					        			    	nodes = JSON.parse(returnMsg.nodes);
					        			    }
					        			    //var edges = $changeBrowseEdges(returnMsg.node,JSON.parse(returnMsg.edges),"#CD853F","dashed");
					        			    $("#containerNavigator").empty();
					        			    $("#containerNavigator").append('<div id="navigator" style="width:350px;height:150px;margin-top:30px;position:relative;overflow:hidden;border: 1px solid #000;z-index: 99999;"></div>');	        			    
					        			    $networkVisualization(nodes,JSON.parse(returnMsg.edges)); 	        			    
					        	    },
					        	    complete:function(){
					        			$("#fuzzy").css("display","none");
					        			$("#loading").css("display","none");
					        			var height = $("#browseDisplay").height(); //依据旁边表格和网络的高度动态设置ztree的高度
					    				$("#treeView").height(height-30);
					        		},
					        		error:function(){
					        			alert("error");
					        		}
					        	});	
					        }   
					    };
						//瑷疆ztree锛屽嵆缍查爜涓’绀虹殑閭ｆ５妯�
					    var setting = {
					        view: {
					            showIcon: true,
					            selectedMulti: false
					        },
					        data: {
					            simpleData: {
					                enable: true, //鏁版嵁鏄惁閲囩敤绠�鍗� Array 鏍煎紡锛岄粯璁alse 
					                idKey: "id",
					                pIdKey: "pId"
					            }
					        },
					        callback: {  //鍥炶皟鍑芥暟
					            onClick: onClick
					        }
					    };
					    $.ajax({
					    	url:"Tree!Browse",
					    	type:"POST",
					    	dataType:"json",
					    	success:function(returnMsg){
					    		     var treeNodes=eval(returnMsg.treeNodes);//寰楀埌鐢熸垚鏍戠殑json鏁版嵁
					    		     var zTree=$.fn.zTree.init($("#tree"), setting, treeNodes);//鍒濆鍖栨爲锛屽氨涓や釜鍙橀噺锛宻etting鍜宼reeNodes  
					        }
					    }); 
	               </script>
                  </div>
                </div> 
              </div>
              
              <!-- 统计信息 -->
              <div  class="col-md-9 col-sm-9 col-xs-9" >
                  <div id="statistics" class="x_panel" >
	                  <div class="x_title">
	                  	<h2><i class="fa fa-bar-chart-o"></i> Statistics</h2>
	                    <ul class="nav navbar-right panel_toolbox">
	                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
	                      </li>
	                    </ul>
	                    <div class="clearfix"></div>
	                  </div>
	                  <div class="x_content">
	                    <br/>
	                    <div class="tableTitle">
	                    	The statistics information of 27 tissue origins in MutExGenome
	                    </div>
	                    <div class="tableContainer">
	                          <table class="table  table-bordered table-hover" id="statisticsTable">
	                              <thead>
	                              	<tr>
	                              		<td><B>Tissue Origin</B></td>
	                              		<td><B>Mutual Exclusivty Pairs</B></td>
	                              		<td><B>Gene Events</B></td>
	                              		<td><B>Chromosomal/Structure Events</B></td>
	                              		<td><B>Associated Cancer Subtypes</B></td>
	                              	</tr>
	                              </thead>
	                              <tbody>
	                              <tr>
	                              		<td>Total</td>				
	                              		<td>75618</td>
	                              		<td>3410</td>
	                              		<td>129</td>
	                              		<td>141</td>
	                              		
	                              	</tr>
	                              	<tr>
	                              		<td>Esophagus/Stomach</td>
	                              		<td>15046</td>
	                              		<td>390</td>
	                              		<td>1</td>
	                              		<td>5</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Lung</td>	
	                              		<td>13657</td>
	                              		<td>427</td>
	                              		<td>2</td>
	                              		<td>5</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Breast</td>
	                              		<td>9121</td>
	                              		<td>567	</td>
	                              		<td>7</td>
	                              		<td>3</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Soft Tissue</td>
	                              		<td>6627</td>
	                              		<td>261</td>
	                              		<td>0</td>
	                              		<td>8</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Kidney</td>
	                              		<td>3927</td>
	                              		<td>295</td>
	                              		<td>3</td>
	                              		<td>8</td>
	                              	</tr>
	                              	<tr>
	                              		<td>CNS/Brain</td>	
	                              		<td>4392</td>
	                              		<td>435</td>
	                              		<td>9</td>
	                              		<td>18</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Prostate</td>
	                              		<td>3465</td>
	                              		<td>112</td>
	                              		<td>3</td>
	                              		<td>1</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Head and Neck</td>
	                              		<td>3197</td>
	                              		<td>137</td>
	                              		<td>2</td>
	                              		<td>6</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Skin</td>
	                              		<td>2400</td>
	                              		<td>133</td>
	                              		<td>0</td>
	                              		<td>3</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Pancreas</td>
	                              		<td>2310</td>
	                              		<td>135</td>
	                              		<td>0</td>
	                              		<td>1</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Cervix</td> 
	                              		<td>1321</td>
	                              		<td>84</td>
	                              		<td>0</td>
	                              		<td>2</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Liver</td>
	                              		<td>1013</td>
	                              		<td>85</td>
	                              		<td>0</td>
	                              		<td>1</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Thymus</td>
	                              		<td>926</td>
	                              		<td>191</td>
	                              		<td>0</td>
	                              		<td>1</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Uterus</td>
	                              		<td>908</td>
	                              		<td>182</td>
	                              		<td>0</td>
	                              		<td>6</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Multiple Tissues</td>
	                              		<td>1682</td>
	                              		<td>832</td>
	                              		<td>2</td>
	                              		<td>1</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Bladder/Urinary Tract</td>
	                              		<td>845</td>
	                              		<td>89</td>
	                              		<td>2</td>
	                              		<td>6</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Myeloid</td>
	                              		<td>4083</td>
	                              		<td>167</td>
	                              		<td>26</td>
	                              		<td>16</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Ovary/Fallopian Tube</td>
	                              		<td>180</td>
	                              		<td>31</td>
	                              		<td>0</td>
	                              		<td>7</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Bowel</td>
	                              		<td>115</td>
	                              		<td>43</td>
	                              		<td>1</td>
	                              		<td>5</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Thyroid</td>
	                              		<td>114</td>
	                              		<td>49</td>
	                              		<td>2</td>
	                              		<td>7</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Other</td>
	                              		<td>105</td>
	                              		<td>21</td>
	                              		<td>53</td>
	                              		<td>3</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Lymphoid</td>
	                              		<td>62</td>
	                              		<td>38</td>
	                              		<td>17</td>
	                              		<td>12</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Biliary Tract</td> 				
	                              		<td>58</td>
	                              		<td>17</td>
	                              		<td>0</td>
	                              		<td>4</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Peripheral Nervous System</td>				
	                              		<td>41</td>
	                              		<td>12</td>
	                              		<td>1</td>
	                              		<td>1</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Eye</td>					
	                              		<td>24</td>
	                              		<td>13</td>
	                              		<td>1</td>
	                              		<td>4</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Adrenal Gland</td>
	                              		<td>11</td>
	                              		<td>13</td>
	                              		<td>0</td>
	                              		<td>3</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Testis</td>			
	                              		<td>5</td>
	                              		<td>8</td>
	                              		<td>0</td>
	                              		<td>1</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Bone</td>
	                              		<td>2</td>
	                              		<td>2</td>
	                              		<td>2</td>
	                              		<td>2</td>
	                              	</tr>
	                              	<tr>
	                              		<td>Vulva/Vagina</td>	
	                              		<td>1</td>
	                              		<td>2</td>
	                              		<td>0</td>
	                              		<td>1</td>
	                              	</tr>
	                              </tbody>
	                          </table>
	                    </div>
	                    <div class="row">
	                    	<div class="col-md-12 col-sm-12 col-xs-12">
	                    	    <div id="barLeftContainer"></div>
	                    	</div>
	<!--                     	<div class="col-md-6 col-sm-6 col-xs-6"> -->
	<!--                     	    <div id="barRightContainer"></div> -->
	<!--                     	</div> -->
	                    </div>
	                    <div class="row">
	                    	<div class="col-md-12 col-sm-12 col-xs-12">
	                    	    <div id="barRightContainer"></div>
	                    	</div>
	                    </div>
<!-- 	                    <div class="row"> -->
<!-- 	                    	<div class="col-md-12 col-sm-12 col-xs-12"> -->
<!-- 	                    	    <div id="scatterContainer"></div> -->
<!-- 	                    	</div> -->
<!-- 	                    </div> -->
							<script>
									 $("#statisticsTable").DataTable({
										 searching: false,
										 order: false,
										 dom: 'rt<"bottom"lp><"clear">'
									 });
									 [864,797,771,607,565,473,468,439,402,392,383,375,338,327,322,312,311,311,306,303]
									 var plotBarLeftData = [{
																 name:"ME pair count",
																 color:"rgba(223, 83, 83, .5)",
																 data:[15042,13639,9113,5396,4072,3925,3466,3192,2401,2310,2296,2057,1695,1298,1217,1014,902,868,152,120]
																 //data:[14621,13597,7590,5396,3925,3459,3194,2374,2310,2038,1483,1299,1217,1013,926,901,880,871,502,153]
									 							 //data:[864,797,771,607,565,473,468,439,402,392,383,375,338,327,322,312,311,311,306,303]
									 						}];
									 //var LeftCategories = ["Esophagogastric Adenocarcinoma","Non-Small Cell Lung Cancer","Invasive Breast Carcinoma","Tenosynovial Giant Cell Tumor Diffuse Type","Renal Cell Carcinoma","Prostate Adenocarcinoma","Head and Neck Squamous Cell Carcinoma","Melanoma","Pancreatic Adenocarcinoma","Encapsulated Glioma","Diffuse Glioma","Cervical Squamous Cell Carcinoma","Sarcoma","Hepatocellular Carcinoma","Thymic Epithelial Tumor","Endometrial Carcinoma","Bladder Urothelial Carcinoma","Myeloid Neoplasm","Ovarian Cancer","Colorectal Adenocarcinoma"];
									 var LeftCategories = ["Esophagogastric Adenocarcinoma","Non-Small Cell Lung Cancer","Invasive Breast Carcinoma","Tenosynovial Giant Cell Tumor Diffuse Type","Myeloid Neoplasm","Renal Cell Carcinoma","Prostate Adenocarcinoma","Head and Neck Squamous Cell Carcinoma","Melanoma","Diffuse Glioma","Pancreatic Adenocarcinoma","Encapsulated Glioma","Pancancer","Cervical Squamous Cell Carcinoma","Sarcoma","Hepatocellular Carcinoma","Endometrial Carcinoma","Bladder Urothelial Carcinoma","Ovarian Cancer","Colorectal Adenocarcinoma"];
							
									 $columnPlot("barLeftContainer",LeftCategories,"Mutual Exclusive Pairs","The number of mutual exclusive pairs for top 20 cancer types","",null,false,plotBarLeftData);
								// 	 var plotBarRightData = [{
								// 								 name:"alteration",
								// 								 color:"#D9D9D9",
								// 								 data:[0,31,18,1,2,52,2,0,0,1,1,0,0,0,0,0,2,31,16,3]
								// 							},{
								// 								 name:"copy number gain",
								// 								 color:"#FB8072",
								// 								 data:[55,90,48,58,11,0,31,8,26,8,17,38,17,11,1,13,33,0,0,0]
								// 							},{
								// 								 name:"copy number loss",
								// 								 color:"#FDB462",
								// 								 data:[77,92,141,84,187,31,62,36,43,63,47,28,63,44,190,89,24,7,0,8]
								// 							},{
								// 								 name:"DNA methylation",
								// 								 color:"#BEBADA",
								// 								 data:[2,17,0,0,4,2,1,1,0,0,9,0,0,0,0,0,1,2,2,3]
								// 							},{
								// 								 name:"mutation",
								// 								 color:"#B3DE69",
								// 								 data:[169,203,110,26,107,28,55,86,66,36,94,8,10,34,1,83,43,58,12,36]
								// 							},{
								// 								 name:"structural variation",
								// 								 color:"#80B1D3",
								// 								 data:[0,7,0,0,2,8,0,0,0,1,2,0,0,0,0,1,0,9,0,4]
								// 							}];	
									 var plotBarRightData = [{name:"ME pair count",data:[1221,1148,862,762,638,573,539,504,473,442,415,391,356,348,340,334,327,322,314,312]}];
									 //var RightCategories = ["Esophagogastric Adenocarcinoma","Non-Small Cell Lung Cancer","Invasive Breast Carcinoma","Tenosynovial Giant Cell Tumor Diffuse Type","Renal Cell Carcinoma","Prostate Adenocarcinoma","Head and Neck Squamous Cell Carcinoma","Melanoma","Pancreatic Adenocarcinoma","Encapsulated Glioma","Diffuse Glioma","Cervical Squamous Cell Carcinoma","Sarcoma","Hepatocellular Carcinoma","Thymic Epithelial Tumor","Endometrial Carcinoma","Bladder Urothelial Carcinoma","Myeloid Neoplasm","Ovarian Cancer","Colorectal Adenocarcinoma"];
									 //var RightCategories = ["PTEN","ERBB2","PIK3CA","KRAS","KLLN","CPSF6","EGFR","MYC","CDKN2A","MET","KCNMB3","TP53","PYHIN1","ZNF98","ZNF676","KDM5A","B4GALNT3","CCDC77","CCNE1","MDM2"]	 
									 var RightCategories = ["PTEN","PIK3CA","ERBB2","KRAS","TP53","KLLN","EGFR","MYC","CPSF6","CDKN2A","MET","KCNMB3","IDH1","MDM2","PYHIN1","CCNE1","ZNF98","ZNF676","B4GALNT3","KDM5A"];
									 
							
									 // $columnPlot("barRightContainer",RightCategories,"Genes count","The count of different types of aberrant genes for top 20 Cancer types","","normal",false,plotBarRightData);
									 $columnPlot("barRightContainer",RightCategories,"Mutual Exclusive Pairs","The number of associated mutual exclusive events for top 20 genes","","normal",false,plotBarRightData);
							// 		 var scatterPlotData = [{"name":"A2ML1","data":[[1,71]]},{"name":"AARSD1","data":[[1,6]]},{"name":"ABCA11P","data":[[1,23]]},{"name":"ABCA12","data":[[2,3]]},{"name":"ABCA2","data":[[1,176]]},{"name":"ABCA4","data":[[1,1]]},{"name":"ABCB1","data":[[2,39]]},{"name":"ABCC1","data":[[2,65]]},{"name":"ABCC12","data":[[1,17]]},{"name":"ABCC9","data":[[2,39]]},{"name":"ABCD3","data":[[1,1]]},{"name":"ABCF1","data":[[1,47]]},{"name":"ABHD14A","data":[[1,5]]},{"name":"ABHD14B","data":[[1,5]]},{"name":"ABHD5","data":[[1,5]]},{"name":"ABI1","data":[[1,13]]},{"name":"ABL1","data":[[1,2]]},{"name":"ACAA1","data":[[1,5]]},{"name":"ACAD8","data":[[1,23]]},{"name":"ACAP1","data":[[1,1]]},{"name":"ACD","data":[[1,61]]},{"name":"ACIN1","data":[[1,16]]},{"name":"ACO1","data":[[1,7]]},{"name":"ACOT7","data":[[1,55]]},{"name":"ACOX1","data":[[2,47]]},{"name":"ACP1","data":[[1,31]]},{"name":"ACR","data":[[1,16]]},{"name":"ACSM2B","data":[[2,55]]},{"name":"ACTL6B","data":[[1,36]]},{"name":"ACTR8","data":[[1,5]]},{"name":"ACTRT3","data":[[1,4]]},{"name":"ACVR1","data":[[1,3]]},{"name":"ACVR1B","data":[[1,4]]},{"name":"ACVR2A","data":[[4,43]]},{"name":"ACVR2B","data":[[1,5]]},{"name":"ADAM12","data":[[2,38]]},{"name":"ADAM28","data":[[1,2]]},{"name":"ADAM29","data":[[2,40]]},{"name":"ADAM8","data":[[1,44]]},{"name":"ADAMDEC1","data":[[2,147]]},{"name":"ADAMTS16","data":[[2,135]]},{"name":"ADAMTS17","data":[[1,21]]},{"name":"ADAMTS18","data":[[1,24]]},{"name":"ADAMTS19","data":[[2,57]]},{"name":"ADAMTS2","data":[[2,125]]},{"name":"ADAR","data":[[2,75]]},{"name":"ADCY1","data":[[1,1]]},{"name":"ADCY2","data":[[2,38]]},{"name":"ADNP2","data":[[7,253]]},{"name":"AES","data":[[2,5]]},{"name":"AFF2","data":[[3,43]]},{"name":"AFF3","data":[[1,1]]},{"name":"AFF4","data":[[1,1]]},{"name":"AFG3L1P","data":[[2,60]]},{"name":"AFM","data":[[1,8]]},{"name":"AGAP1","data":[[2,32]]},{"name":"AGAP2","data":[[1,2]]},{"name":"AGAP3","data":[[2,66]]},{"name":"AGMAT","data":[[1,7]]},{"name":"AGTR1","data":[[1,46]]},{"name":"AGTRAP","data":[[1,7]]},{"name":"AGXT2","data":[[2,61]]},{"name":"AHDC1","data":[[1,7]]},{"name":"AHR","data":[[1,7]]},{"name":"AIMP2","data":[[1,1]]},{"name":"AK5","data":[[2,59]]},{"name":"AKAP11","data":[[1,1]]},{"name":"AKAP8","data":[[2,49]]},{"name":"AKAP8L","data":[[2,49]]},{"name":"AKR1C2","data":[[3,143]]},{"name":"AKR1C3","data":[[2,139]]},{"name":"AKR7A2","data":[[1,7]]},{"name":"AKR7A3","data":[[1,7]]},{"name":"AKR7L","data":[[1,7]]},{"name":"AKT1","data":[[8,46]]},{"name":"AKT2","data":[[3,8]]},{"name":"AKT3","data":[[3,9]]},{"name":"ALDH1A3","data":[[2,4]]},{"name":"ALDH4A1","data":[[1,7]]},{"name":"ALG10","data":[[4,210]]},{"name":"ALG11","data":[[2,2]]},{"name":"ALG12","data":[[2,16]]},{"name":"ALK","data":[[8,25]]},{"name":"ALMS1","data":[[2,38]]},{"name":"ALOX15B","data":[[1,1]]},{"name":"ALPL","data":[[1,7]]},{"name":"ALS2CL","data":[[1,1]]},{"name":"ALX4","data":[[1,1]]},{"name":"AMER1","data":[[1,1]]},{"name":"AMHR2","data":[[2,66]]},{"name":"AMPH","data":[[3,152]]},{"name":"AMY2B","data":[[2,154]]},{"name":"ANGPTL2","data":[[1,70]]},{"name":"ANGPTL6","data":[[2,59]]},{"name":"ANK3","data":[[2,2]]},{"name":"ANKHD1","data":[[1,1]]},{"name":"ANKRD13D","data":[[2,85]]},{"name":"ANKRD17","data":[[2,80]]},{"name":"ANKRD20A3","data":[[3,125]]},{"name":"ANKRD20A4","data":[[2,119]]},{"name":"ANKRD23","data":[[2,73]]},{"name":"ANKRD26P1","data":[[1,4]]},{"name":"ANKRD28","data":[[1,5]]},{"name":"ANKRD30A","data":[[4,71]]},{"name":"ANKRD39","data":[[2,73]]},{"name":"ANKS1B","data":[[4,198]]},{"name":"ANO1","data":[[2,101]]},{"name":"ANO10","data":[[1,5]]},{"name":"ANO4","data":[[2,71]]},{"name":"ANO9","data":[[7,122]]},{"name":"ANP32E","data":[[2,37]]},{"name":"ANTXR1","data":[[2,109]]},{"name":"AOC2","data":[[1,6]]},{"name":"AOC3","data":[[1,6]]},{"name":"AOC4P","data":[[1,6]]},{"name":"AP1B1","data":[[2,185]]},{"name":"AP2A2","data":[[1,10]]},{"name":"AP3M2","data":[[3,73]]},{"name":"AP4B1","data":[[1,51]]},{"name":"AP5B1","data":[[2,77]]},{"name":"APC","data":[[6,40]]},{"name":"APEH","data":[[2,5]]},{"name":"APH1A","data":[[2,37]]},{"name":"APITD1","data":[[1,7]]},{"name":"APOBEC1","data":[[2,96]]},{"name":"AQP11","data":[[2,152]]},{"name":"AQP12A","data":[[2,27]]},{"name":"AQP8","data":[[2,154]]},{"name":"AQPEP","data":[[1,1]]},{"name":"AR","data":[[1,19]]},{"name":"ARAF","data":[[1,1]]},{"name":"ARAP3","data":[[1,1]]},{"name":"AREG","data":[[2,57]]},{"name":"AREL1","data":[[2,60]]},{"name":"ARF4","data":[[2,5]]},{"name":"ARFRP1","data":[[2,38]]},{"name":"ARHGAP11B","data":[[2,9]]},{"name":"ARHGAP26","data":[[1,1]]},{"name":"ARHGAP29","data":[[1,1]]},{"name":"ARHGAP30","data":[[1,3]]},{"name":"ARHGAP35","data":[[4,11]]},{"name":"ARHGAP4","data":[[2,52]]},{"name":"ARHGAP44","data":[[2,26]]},{"name":"ARHGEF10L","data":[[1,7]]},{"name":"ARHGEF15","data":[[1,1]]},{"name":"ARHGEF16","data":[[1,55]]},{"name":"ARHGEF18","data":[[2,25]]},{"name":"ARHGEF19","data":[[1,7]]},{"name":"ARHGEF3","data":[[2,5]]},{"name":"ARHGEF38","data":[[2,50]]},{"name":"ARID1A","data":[[24,203]]},{"name":"ARID2","data":[[3,74]]},{"name":"ARID5B","data":[[3,20]]},{"name":"ARIH2","data":[[2,5]]},{"name":"ARIH2OS","data":[[2,5]]},{"name":"ARL11","data":[[1,1]]},{"name":"ARL13B","data":[[2,156]]},{"name":"ARL2","data":[[2,77]]},{"name":"ARL6IP5","data":[[2,5]]},{"name":"ARNT","data":[[2,2]]},{"name":"ARPC1A","data":[[2,91]]},{"name":"ARPC4","data":[[2,5]]},{"name":"ARPP21","data":[[2,5]]},{"name":"ARRDC1","data":[[1,2]]},{"name":"ARSA","data":[[2,16]]},{"name":"ARVCF","data":[[2,99]]},{"name":"ASAP1","data":[[2,62]]},{"name":"ASB14","data":[[2,5]]},{"name":"ASB5","data":[[2,102]]},{"name":"ASCC3","data":[[2,53]]},{"name":"ASCL4","data":[[2,96]]},{"name":"ASPM","data":[[3,3]]},{"name":"ASTN2","data":[[2,111]]},{"name":"ASXL1","data":[[1,24]]},{"name":"ASXL2","data":[[3,41]]},{"name":"ATAD3A","data":[[2,55]]},{"name":"ATAD3B","data":[[2,55]]},{"name":"ATAD3C","data":[[2,55]]},{"name":"ATE1","data":[[2,22]]},{"name":"ATG13","data":[[2,67]]},{"name":"ATG2A","data":[[2,77]]},{"name":"ATG2B","data":[[2,24]]},{"name":"ATG4B","data":[[4,174]]},{"name":"ATHL1","data":[[6,121]]},{"name":"ATM","data":[[17,180]]},{"name":"ATN1","data":[[2,58]]},{"name":"ATP10B","data":[[1,1]]},{"name":"ATP11B","data":[[1,6]]},{"name":"ATP13A2","data":[[3,15]]},{"name":"ATP1B1","data":[[1,24]]},{"name":"ATP1B2","data":[[5,61]]},{"name":"ATP2A1","data":[[2,74]]},{"name":"ATP5D","data":[[4,95]]},{"name":"ATP5I","data":[[2,23]]},{"name":"ATP6V1B1","data":[[2,150]]},{"name":"ATP7B","data":[[1,1]]},{"name":"ATP8B4","data":[[1,1]]},{"name":"ATR","data":[[2,2]]},{"name":"ATRIP","data":[[4,51]]},{"name":"ATRX","data":[[11,72]]},{"name":"ATXN1","data":[[2,38]]},{"name":"ATXN7","data":[[2,5]]},{"name":"ATXN7L3","data":[[2,71]]},{"name":"AURKA","data":[[1,1]]},{"name":"AURKAIP1","data":[[2,55]]},{"name":"AXIN1","data":[[5,29]]},{"name":"AXIN2","data":[[2,2]]},{"name":"AZI2","data":[[2,5]]},{"name":"B2M","data":[[5,70]]},{"name":"B3GALT6","data":[[2,55]]},{"name":"B4GALNT3","data":[[8,311]]},{"name":"B4GALNT4","data":[[4,63]]},{"name":"BAP1","data":[[7,15]]},{"name":"BARD1","data":[[6,38]]},{"name":"BATF2","data":[[2,77]]},{"name":"BBS9","data":[[2,79]]},{"name":"BCAM","data":[[2,152]]},{"name":"BCAR4","data":[[2,55]]},{"name":"BCAS2","data":[[2,32]]},{"name":"BCKDHB","data":[[4,138]]},{"name":"BCL11B","data":[[3,64]]},{"name":"BCL2L1","data":[[4,22]]},{"name":"BCL9L","data":[[1,1]]},{"name":"BCLAF1","data":[[4,189]]},{"name":"BCOR","data":[[9,35]]},{"name":"BDP1","data":[[1,2]]},{"name":"BECN1","data":[[2,5]]},{"name":"BET1L","data":[[7,122]]},{"name":"BIN3","data":[[2,23]]},{"name":"BIRC3","data":[[1,1]]},{"name":"BIRC6","data":[[1,1]]},{"name":"BMP8A","data":[[2,144]]},{"name":"BOK","data":[[4,174]]},{"name":"BORA","data":[[1,1]]},{"name":"BRAF","data":[[49,231]]},{"name":"BRCA1","data":[[9,45]]},{"name":"BRCA2","data":[[7,42]]},{"name":"BRD1","data":[[2,16]]},{"name":"BRD7","data":[[2,38]]},{"name":"BRD8","data":[[1,1]]},{"name":"BRD9","data":[[7,170]]},{"name":"BRIP1","data":[[6,119]]},{"name":"BRK1","data":[[2,5]]},{"name":"BRPF1","data":[[2,5]]},{"name":"BRWD1","data":[[1,1]]},{"name":"BSN","data":[[1,1]]},{"name":"BTBD11","data":[[2,154]]},{"name":"BTD","data":[[2,5]]},{"name":"BTG2","data":[[2,30]]},{"name":"BYSL","data":[[2,132]]},{"name":"C10orf76","data":[[2,51]]},{"name":"C12orf43","data":[[2,25]]},{"name":"C14orf39","data":[[1,16]]},{"name":"C17orf74","data":[[1,1]]},{"name":"C1orf173","data":[[1,1]]},{"name":"C1orf94","data":[[2,124]]},{"name":"C3orf70","data":[[2,13]]},{"name":"C6","data":[[2,56]]},{"name":"C7","data":[[2,105]]},{"name":"C8A","data":[[2,59]]},{"name":"C9orf131","data":[[2,149]]},{"name":"CAB39L","data":[[1,1]]},{"name":"CABLES1","data":[[2,19]]},{"name":"CACNA1D","data":[[1,1]]},{"name":"CACNA1E","data":[[1,2]]},{"name":"CACNA1I","data":[[1,1]]},{"name":"CACNA2D3","data":[[1,1]]},{"name":"CADM1","data":[[2,154]]},{"name":"CADM2","data":[[2,61]]},{"name":"CALCR","data":[[2,37]]},{"name":"CALML6","data":[[2,55]]},{"name":"CALN1","data":[[2,106]]},{"name":"CALR","data":[[5,8]]},{"name":"CALY","data":[[2,44]]},{"name":"CAMK1","data":[[2,5]]},{"name":"CAMK2N1","data":[[1,7]]},{"name":"CAMTA1","data":[[3,63]]},{"name":"CAMTA2","data":[[2,56]]},{"name":"CAP1","data":[[2,33]]},{"name":"CAP2","data":[[1,3]]},{"name":"CAPN1","data":[[2,77]]},{"name":"CAPN15","data":[[2,25]]},{"name":"CAPN7","data":[[2,5]]},{"name":"CAPZA2","data":[[4,80]]},{"name":"CAPZB","data":[[1,7]]},{"name":"CARD11","data":[[1,2]]},{"name":"CASP3","data":[[1,1]]},{"name":"CASP8","data":[[10,281]]},{"name":"CASP9","data":[[1,7]]},{"name":"CASZ1","data":[[1,7]]},{"name":"CAT","data":[[2,58]]},{"name":"CATSPER3","data":[[1,1]]},{"name":"CATSPERG","data":[[2,51]]},{"name":"CBFB","data":[[3,5]]},{"name":"CBL","data":[[2,6]]},{"name":"CBLC","data":[[2,152]]},{"name":"CBLN4","data":[[2,108]]},{"name":"CBR1","data":[[3,5]]},{"name":"CBWD1","data":[[2,109]]},{"name":"CBWD6","data":[[7,206]]},{"name":"CCDC12","data":[[2,5]]},{"name":"CCDC127","data":[[7,170]]},{"name":"CCDC13","data":[[2,5]]},{"name":"CCDC132","data":[[2,78]]},{"name":"CCDC153","data":[[2,151]]},{"name":"CCDC174","data":[[2,5]]},{"name":"CCDC18","data":[[3,73]]},{"name":"CCDC36","data":[[3,53]]},{"name":"CCDC51","data":[[2,46]]},{"name":"CCDC6","data":[[2,7]]},{"name":"CCDC66","data":[[2,5]]},{"name":"CCDC70","data":[[1,1]]},{"name":"CCDC71","data":[[2,5]]},{"name":"CCDC77","data":[[8,311]]},{"name":"CCDC78","data":[[2,25]]},{"name":"CCDC85A","data":[[2,98]]},{"name":"CCDC85B","data":[[2,77]]},{"name":"CCDC97","data":[[2,60]]},{"name":"CCKAR","data":[[2,10]]},{"name":"CCND1","data":[[7,40]]},{"name":"CCND2","data":[[5,57]]},{"name":"CCND3","data":[[3,133]]},{"name":"CCNE1","data":[[15,306]]},{"name":"CCNE2","data":[[1,1]]},{"name":"CCNL2","data":[[2,55]]},{"name":"CCR6","data":[[1,1]]},{"name":"CCR9","data":[[2,5]]},{"name":"CCSER1","data":[[6,100]]},{"name":"CCT8L2","data":[[2,77]]},{"name":"CCZ1","data":[[1,1]]},{"name":"CD1A","data":[[2,122]]},{"name":"CD1E","data":[[4,206]]},{"name":"CD274","data":[[2,51]]},{"name":"CD28","data":[[1,3]]},{"name":"CD4","data":[[2,25]]},{"name":"CD44","data":[[4,258]]},{"name":"CD52","data":[[1,6]]},{"name":"CD5L","data":[[4,199]]},{"name":"CD68","data":[[1,1]]},{"name":"CDADC1","data":[[1,1]]},{"name":"CDC16","data":[[2,56]]},{"name":"CDC25A","data":[[2,5]]},{"name":"CDC27","data":[[2,72]]},{"name":"CDC42","data":[[1,7]]},{"name":"CDC42BPB","data":[[1,4]]},{"name":"CDC42BPG","data":[[2,77]]},{"name":"CDC42EP2","data":[[2,77]]},{"name":"CDC42SE2","data":[[2,4]]},{"name":"CDC45","data":[[2,99]]},{"name":"CDC5L","data":[[2,154]]},{"name":"CDCP1","data":[[1,1]]},{"name":"CDH1","data":[[6,62]]},{"name":"CDH10","data":[[2,96]]},{"name":"CDH11","data":[[2,55]]},{"name":"CDH12","data":[[2,104]]},{"name":"CDH13","data":[[2,86]]},{"name":"CDH17","data":[[2,125]]},{"name":"CDH9","data":[[6,145]]},{"name":"CDHR1","data":[[2,67]]},{"name":"CDHR5","data":[[1,2]]},{"name":"CDK10","data":[[4,60]]},{"name":"CDK11A","data":[[2,55]]},{"name":"CDK11B","data":[[2,55]]},{"name":"CDK12","data":[[5,38]]},{"name":"CDK4","data":[[10,179]]},{"name":"CDK6","data":[[5,111]]},{"name":"CDK9","data":[[2,70]]},{"name":"CDKN1A","data":[[1,1]]},{"name":"CDKN1B","data":[[7,160]]},{"name":"CDKN2A","data":[[50,401]]},{"name":"CDKN2A-AS1","data":[[1,1]]},{"name":"CDKN2B","data":[[9,163]]},{"name":"CDKN2C","data":[[5,83]]},{"name":"CDR2","data":[[2,25]]},{"name":"CEACAM4","data":[[2,18]]},{"name":"CEBPA","data":[[4,95]]},{"name":"CECR1","data":[[2,68]]},{"name":"CECR5","data":[[2,19]]},{"name":"CELSR3","data":[[3,47]]},{"name":"CENPBD1","data":[[4,60]]},{"name":"CEP104","data":[[2,55]]},{"name":"CEP120","data":[[1,1]]},{"name":"CEP170","data":[[4,12]]},{"name":"CEP19","data":[[2,57]]},{"name":"CEP72","data":[[7,170]]},{"name":"CEP85L","data":[[1,1]]},{"name":"CERS3","data":[[4,191]]},{"name":"CES1","data":[[4,222]]},{"name":"CETN2","data":[[2,106]]},{"name":"CFL1","data":[[2,77]]},{"name":"CFL1P1","data":[[2,52]]},{"name":"CHAMP1","data":[[2,56]]},{"name":"CHD1","data":[[4,67]]},{"name":"CHD3","data":[[2,2]]},{"name":"CHD4","data":[[3,4]]},{"name":"CHD5","data":[[5,88]]},{"name":"CHD8","data":[[1,1]]},{"name":"CHEK1","data":[[3,9]]},{"name":"CHEK2","data":[[7,39]]},{"name":"CHFR","data":[[1,1]]},{"name":"CHKB","data":[[2,16]]},{"name":"CHL1","data":[[4,114]]},{"name":"CHMP1A","data":[[4,60]]},{"name":"CHMP2A","data":[[2,18]]},{"name":"CHMP4B","data":[[2,73]]},{"name":"CHRFAM7A","data":[[2,9]]},{"name":"CHRM2","data":[[2,61]]},{"name":"CHRM3","data":[[1,1]]},{"name":"CHRNB1","data":[[1,1]]},{"name":"CHSY3","data":[[1,1]]},{"name":"CIC","data":[[6,86]]},{"name":"CIDECP","data":[[2,5]]},{"name":"CKAP2","data":[[2,2]]},{"name":"CLASP1","data":[[2,92]]},{"name":"CLASP2","data":[[2,5]]},{"name":"CLCA4","data":[[1,1]]},{"name":"CLCF1","data":[[2,85]]},{"name":"CLCN4","data":[[2,42]]},{"name":"CLCN6","data":[[1,7]]},{"name":"CLIC4","data":[[1,6]]},{"name":"CLK2","data":[[2,80]]},{"name":"CLNS1A","data":[[2,152]]},{"name":"CLOCK","data":[[2,18]]},{"name":"CLSTN1","data":[[1,7]]},{"name":"CLSTN2","data":[[2,107]]},{"name":"CLTCL1","data":[[2,99]]},{"name":"CLVS2","data":[[2,98]]},{"name":"CMC1","data":[[2,5]]},{"name":"CMKLR1","data":[[2,124]]},{"name":"CMTM7","data":[[2,5]]},{"name":"CNGA3","data":[[2,37]]},{"name":"CNNM1","data":[[2,82]]},{"name":"CNNM2","data":[[2,55]]},{"name":"CNOT10","data":[[2,5]]},{"name":"CNTD1","data":[[2,5]]},{"name":"CNTLN","data":[[2,144]]},{"name":"CNTN4","data":[[6,124]]},{"name":"CNTN5","data":[[2,21]]},{"name":"CNTN6","data":[[5,116]]},{"name":"CNTNAP1","data":[[2,5]]},{"name":"CNTNAP2","data":[[4,100]]},{"name":"CNTNAP3","data":[[5,164]]},{"name":"CNTNAP4","data":[[2,100]]},{"name":"CNTNAP5","data":[[4,87]]},{"name":"CNTROB","data":[[1,1]]},{"name":"COA3","data":[[2,5]]},{"name":"COG3","data":[[1,1]]},{"name":"COL11A1","data":[[5,165]]},{"name":"COL18A1","data":[[1,1]]},{"name":"COL1A2","data":[[2,41]]},{"name":"COL22A1","data":[[4,118]]},{"name":"COL24A1","data":[[1,1]]},{"name":"COL4A4","data":[[2,20]]},{"name":"COL4A5","data":[[2,50]]},{"name":"COL5A1","data":[[2,26]]},{"name":"COL5A3","data":[[4,9]]},{"name":"COL7A1","data":[[1,1]]},{"name":"COLQ","data":[[2,5]]},{"name":"COMTD1","data":[[2,86]]},{"name":"COPS4","data":[[2,19]]},{"name":"CORT","data":[[1,7]]},{"name":"CPB2","data":[[1,1]]},{"name":"CPM","data":[[6,255]]},{"name":"CPNE7","data":[[4,60]]},{"name":"CPNE8","data":[[2,55]]},{"name":"CPS1","data":[[2,103]]},{"name":"CPSF3L","data":[[2,55]]},{"name":"CPSF6","data":[[8,473]]},{"name":"CPXCR1","data":[[2,100]]},{"name":"CR1","data":[[2,154]]},{"name":"CR2","data":[[2,18]]},{"name":"CRB1","data":[[5,108]]},{"name":"CRB2","data":[[2,26]]},{"name":"CRBN","data":[[2,109]]},{"name":"CREBBP","data":[[10,95]]},{"name":"CRELD2","data":[[2,16]]},{"name":"CRIP2","data":[[2,9]]},{"name":"CRIP3","data":[[2,38]]},{"name":"CRIPAK","data":[[2,4]]},{"name":"CRKL","data":[[2,99]]},{"name":"CROCC","data":[[3,18]]},{"name":"CROCCP2","data":[[3,18]]},{"name":"CROCCP3","data":[[1,7]]},{"name":"CRYGA","data":[[2,149]]},{"name":"CSF2RB","data":[[1,1]]},{"name":"CSMD1","data":[[11,118]]},{"name":"CSMD2","data":[[1,1]]},{"name":"CSMD3","data":[[2,2]]},{"name":"CSRNP1","data":[[2,5]]},{"name":"CSTF2T","data":[[2,52]]},{"name":"CTAGE10P","data":[[1,1]]},{"name":"CTC1","data":[[2,2]]},{"name":"CTCF","data":[[7,70]]},{"name":"CTDP1","data":[[12,253]]},{"name":"CTDSPL","data":[[2,5]]},{"name":"CTNNA1","data":[[1,1]]},{"name":"CTNNB1","data":[[27,159]]},{"name":"CTNNBIP1","data":[[1,7]]},{"name":"CTNND1","data":[[2,152]]},{"name":"CTSW","data":[[2,77]]},{"name":"CUL3","data":[[6,116]]},{"name":"CX3CR1","data":[[2,5]]},{"name":"CXCR4","data":[[1,1]]},{"name":"CXorf22","data":[[2,40]]},{"name":"CYB561D2","data":[[2,5]]},{"name":"CYB5D1","data":[[1,1]]},{"name":"CYFIP2","data":[[1,1]]},{"name":"CYLC1","data":[[4,77]]},{"name":"CYLC2","data":[[2,152]]},{"name":"CYLD","data":[[1,1]]},{"name":"CYP11B1","data":[[2,102]]},{"name":"CYP27B1","data":[[4,145]]},{"name":"CYP2E1","data":[[2,117]]},{"name":"CYP7B1","data":[[2,152]]},{"name":"CYSLTR2","data":[[1,3]]},{"name":"D2HGDH","data":[[4,174]]},{"name":"DAAM1","data":[[2,22]]},{"name":"DACH1","data":[[3,59]]},{"name":"DACH2","data":[[2,93]]},{"name":"DAGLB","data":[[1,1]]},{"name":"DALRD3","data":[[2,5]]},{"name":"DAO","data":[[2,153]]},{"name":"DBH","data":[[1,1]]},{"name":"DBIL5P","data":[[1,1]]},{"name":"DBNDD1","data":[[4,60]]},{"name":"DCAF12L1","data":[[2,92]]},{"name":"DCAF12L2","data":[[2,36]]},{"name":"DCAF8L2","data":[[2,105]]},{"name":"DCDC1","data":[[6,97]]},{"name":"DCHS1","data":[[2,2]]},{"name":"DCHS2","data":[[1,1]]},{"name":"DCLRE1B","data":[[2,51]]},{"name":"DCP1A","data":[[2,5]]},{"name":"DCTD","data":[[2,23]]},{"name":"DDAH1","data":[[1,1]]},{"name":"DDC","data":[[2,149]]},{"name":"DDI2","data":[[1,7]]},{"name":"DDOST","data":[[1,7]]},{"name":"DDX1","data":[[2,39]]},{"name":"DDX10","data":[[4,34]]},{"name":"DDX11","data":[[2,71]]},{"name":"DDX46","data":[[1,1]]},{"name":"DDX51","data":[[2,62]]},{"name":"DEAF1","data":[[2,2]]},{"name":"DECR2","data":[[2,25]]},{"name":"DEF8","data":[[4,60]]},{"name":"DEFB112","data":[[2,58]]},{"name":"DEFB118","data":[[2,59]]},{"name":"DEK","data":[[2,30]]},{"name":"DENND6A","data":[[2,5]]},{"name":"DEPDC5","data":[[1,1]]},{"name":"DFFA","data":[[1,7]]},{"name":"DFFB","data":[[2,55]]},{"name":"DGCR14","data":[[2,99]]},{"name":"DGCR2","data":[[2,99]]},{"name":"DGCR6","data":[[2,99]]},{"name":"DGCR6L","data":[[2,99]]},{"name":"DGCR8","data":[[2,99]]},{"name":"DGKH","data":[[1,1]]},{"name":"DGKQ","data":[[2,23]]},{"name":"DGKZ","data":[[2,32]]},{"name":"DHDDS","data":[[3,18]]},{"name":"DHRS12","data":[[2,2]]},{"name":"DHRS3","data":[[1,7]]},{"name":"DHX30","data":[[2,5]]},{"name":"DIAPH1","data":[[1,1]]},{"name":"DIAPH2","data":[[6,145]]},{"name":"DIAPH3","data":[[2,2]]},{"name":"DICER1","data":[[1,1]]},{"name":"DIP2C","data":[[6,103]]},{"name":"DIS3","data":[[3,4]]},{"name":"DISP1","data":[[2,24]]},{"name":"DIXDC1","data":[[2,6]]},{"name":"DKK4","data":[[2,3]]},{"name":"DLEC1","data":[[1,1]]},{"name":"DLEU1","data":[[3,40]]},{"name":"DLEU2","data":[[2,39]]},{"name":"DLG1","data":[[2,57]]},{"name":"DLG2","data":[[4,56]]},{"name":"DLGAP1","data":[[2,16]]},{"name":"DLGAP3","data":[[2,119]]},{"name":"DMD","data":[[5,38]]},{"name":"DMRT2","data":[[2,50]]},{"name":"DMRT3","data":[[2,50]]},{"name":"DMRTA1","data":[[2,6]]},{"name":"DMXL1","data":[[1,1]]},{"name":"DMXL2","data":[[2,144]]},{"name":"DNAH1","data":[[1,1]]},{"name":"DNAH2","data":[[1,1]]},{"name":"DNAH3","data":[[2,9]]},{"name":"DNAH5","data":[[4,22]]},{"name":"DNAH8","data":[[1,1]]},{"name":"DNAH9","data":[[1,1]]},{"name":"DNAJC11","data":[[2,55]]},{"name":"DNAJC16","data":[[1,7]]},{"name":"DNAJC5","data":[[2,38]]},{"name":"DNER","data":[[2,13]]},{"name":"DNM2","data":[[2,27]]},{"name":"DNM3","data":[[2,29]]},{"name":"DNMT3A","data":[[6,110]]},{"name":"DOCK2","data":[[1,1]]},{"name":"DOCK3","data":[[1,1]]},{"name":"DOCK5","data":[[2,9]]},{"name":"DOK6","data":[[2,50]]},{"name":"DPEP2","data":[[2,58]]},{"name":"DPF2","data":[[2,77]]},{"name":"DPH3","data":[[2,5]]},{"name":"DPM2","data":[[2,70]]},{"name":"DPP10","data":[[2,47]]},{"name":"DRD2","data":[[2,107]]},{"name":"DRG2","data":[[2,18]]},{"name":"DSCAM","data":[[2,2]]},{"name":"DSCAML1","data":[[1,1]]},{"name":"DSCR3","data":[[2,51]]},{"name":"DSCR9","data":[[2,51]]},{"name":"DSP","data":[[2,9]]},{"name":"DST","data":[[3,3]]},{"name":"DSTN","data":[[2,146]]},{"name":"DTX3","data":[[2,2]]},{"name":"DTYMK","data":[[4,174]]},{"name":"DUSP22","data":[[7,209]]},{"name":"DVL1","data":[[2,55]]},{"name":"DVL2","data":[[1,1]]},{"name":"DYNC1H1","data":[[2,2]]},{"name":"DYNC1I1","data":[[2,37]]},{"name":"DYNC1LI1","data":[[2,5]]},{"name":"DYNC2H1","data":[[1,1]]},{"name":"DYRK1A","data":[[4,20]]},{"name":"E2F1","data":[[1,1]]},{"name":"E2F3","data":[[3,6]]},{"name":"EBF1","data":[[3,3]]},{"name":"EBPL","data":[[1,1]]},{"name":"ECE1","data":[[1,7]]},{"name":"ECHS1","data":[[2,44]]},{"name":"EDIL3","data":[[2,98]]},{"name":"EEF1A1","data":[[2,40]]},{"name":"EEF2","data":[[1,5]]},{"name":"EEF2K","data":[[2,25]]},{"name":"EFEMP2","data":[[2,77]]},{"name":"EFHD2","data":[[1,7]]},{"name":"EFNB3","data":[[2,2]]},{"name":"EGFR","data":[[40,469]]},{"name":"EGR3","data":[[2,23]]},{"name":"EHBP1L1","data":[[2,77]]},{"name":"EHD1","data":[[2,77]]},{"name":"EHD3","data":[[2,10]]},{"name":"EIF1AX","data":[[6,8]]},{"name":"EIF1B","data":[[2,5]]},{"name":"EIF2AK1","data":[[1,1]]},{"name":"EIF4A1","data":[[2,2]]},{"name":"EIF4G3","data":[[1,7]]},{"name":"ELAC1","data":[[7,119]]},{"name":"ELF3","data":[[5,165]]},{"name":"ELF4","data":[[2,7]]},{"name":"ELOVL5","data":[[2,65]]},{"name":"ELP6","data":[[2,5]]},{"name":"ELTD1","data":[[2,103]]},{"name":"EMC1","data":[[1,7]]},{"name":"EMG1","data":[[2,60]]},{"name":"EML4","data":[[2,2]]},{"name":"EMR3","data":[[2,74]]},{"name":"ENOX1","data":[[1,1]]},{"name":"ENSA","data":[[6,121]]},{"name":"EP300","data":[[6,41]]},{"name":"EP400","data":[[3,63]]},{"name":"EP400NL","data":[[2,62]]},{"name":"EPAS1","data":[[2,68]]},{"name":"EPB41L3","data":[[4,164]]},{"name":"EPDR1","data":[[2,59]]},{"name":"EPHA2","data":[[5,34]]},{"name":"EPHA3","data":[[4,5]]},{"name":"EPHA6","data":[[4,262]]},{"name":"EPHA7","data":[[2,105]]},{"name":"EPM2AIP1","data":[[2,5]]},{"name":"EPS8L2","data":[[1,1]]},{"name":"EPSTI1","data":[[1,1]]},{"name":"ERBB2","data":[[38,797]]},{"name":"ERBB3","data":[[6,186]]},{"name":"ERBB4","data":[[4,54]]},{"name":"ERC1","data":[[2,79]]},{"name":"ERCC2","data":[[2,35]]},{"name":"ERG","data":[[1,9]]},{"name":"ERRFI1","data":[[4,85]]},{"name":"ESPNP","data":[[1,7]]},{"name":"ESR1","data":[[1,1]]},{"name":"ESRRG","data":[[2,100]]},{"name":"ESYT2","data":[[2,43]]},{"name":"ETV1","data":[[2,7]]},{"name":"ETV4","data":[[2,7]]},{"name":"ETV5","data":[[1,3]]},{"name":"ETV6","data":[[3,62]]},{"name":"EVC2","data":[[1,1]]},{"name":"EVI5","data":[[3,72]]},{"name":"EWSR1","data":[[2,185]]},{"name":"EXOC2","data":[[4,106]]},{"name":"EXOC3","data":[[7,170]]},{"name":"EXOG","data":[[2,5]]},{"name":"EXOSC10","data":[[1,7]]},{"name":"EXOSC7","data":[[2,5]]},{"name":"EYA1","data":[[2,58]]},{"name":"EYS","data":[[2,96]]},{"name":"EZH1","data":[[3,7]]},{"name":"EZH2","data":[[4,27]]},{"name":"EZR","data":[[1,3]]},{"name":"F5","data":[[2,24]]},{"name":"FAAP20","data":[[4,30]]},{"name":"FADD","data":[[1,1]]},{"name":"FAF1","data":[[2,4]]},{"name":"FAM101B","data":[[3,26]]},{"name":"FAM102A","data":[[2,70]]},{"name":"FAM107A","data":[[2,5]]},{"name":"FAM110C","data":[[2,31]]},{"name":"FAM110D","data":[[1,6]]},{"name":"FAM124A","data":[[1,1]]},{"name":"FAM129B","data":[[2,70]]},{"name":"FAM133A","data":[[2,151]]},{"name":"FAM138D","data":[[2,67]]},{"name":"FAM138F","data":[[2,19]]},{"name":"FAM13B","data":[[1,1]]},{"name":"FAM150B","data":[[2,31]]},{"name":"FAM167A","data":[[2,43]]},{"name":"FAM170A","data":[[1,1]]},{"name":"FAM173A","data":[[2,25]]},{"name":"FAM189A1","data":[[2,78]]},{"name":"FAM189B","data":[[2,80]]},{"name":"FAM194B","data":[[1,1]]},{"name":"FAM195A","data":[[2,25]]},{"name":"FAM198A","data":[[2,5]]},{"name":"FAM19A1","data":[[2,60]]},{"name":"FAM19A2","data":[[2,142]]},{"name":"FAM19A5","data":[[6,43]]},{"name":"FAM208A","data":[[2,5]]},{"name":"FAM208B","data":[[2,136]]},{"name":"FAM20C","data":[[2,21]]},{"name":"FAM212A","data":[[2,105]]},{"name":"FAM213B","data":[[2,55]]},{"name":"FAM220A","data":[[1,1]]},{"name":"FAM3A","data":[[2,126]]},{"name":"FAM43B","data":[[1,7]]},{"name":"FAM46C","data":[[1,1]]},{"name":"FAM47A","data":[[2,40]]},{"name":"FAM53C","data":[[1,1]]},{"name":"FAM57A","data":[[1,1]]},{"name":"FAM60A","data":[[2,82]]},{"name":"FAM71B","data":[[2,129]]},{"name":"FAM71C","data":[[2,107]]},{"name":"FAM76A","data":[[1,7]]},{"name":"FAM83B","data":[[2,97]]},{"name":"FAM86B1","data":[[2,38]]},{"name":"FAM89B","data":[[2,77]]},{"name":"FAM92B","data":[[1,2]]},{"name":"FAM95B1","data":[[4,161]]},{"name":"FAM9A","data":[[2,17]]},{"name":"FAN1","data":[[4,30]]},{"name":"FANCA","data":[[4,60]]},{"name":"FANCB","data":[[1,1]]},{"name":"FANCE","data":[[5,31]]},{"name":"FANCM","data":[[4,30]]},{"name":"FARP2","data":[[2,22]]},{"name":"FAT1","data":[[9,71]]},{"name":"FAT2","data":[[2,4]]},{"name":"FAT3","data":[[3,5]]},{"name":"FAT4","data":[[4,5]]},{"name":"FAU","data":[[2,77]]},{"name":"FBF1","data":[[2,47]]},{"name":"FBLIM1","data":[[1,7]]},{"name":"FBLL1","data":[[2,60]]},{"name":"FBN1","data":[[1,1]]},{"name":"FBN2","data":[[1,1]]},{"name":"FBXL16","data":[[2,25]]},{"name":"FBXO25","data":[[4,81]]},{"name":"FBXO4","data":[[2,153]]},{"name":"FBXO42","data":[[1,7]]},{"name":"FBXO44","data":[[1,7]]},{"name":"FBXO6","data":[[1,7]]},{"name":"FBXO7","data":[[2,60]]},{"name":"FBXW7","data":[[16,146]]},{"name":"FCAR","data":[[2,95]]},{"name":"FCGBP","data":[[2,13]]},{"name":"FCHSD1","data":[[3,70]]},{"name":"FCN3","data":[[1,7]]},{"name":"FCRL4","data":[[2,60]]},{"name":"FDPS","data":[[2,80]]},{"name":"FDXACB1","data":[[2,7]]},{"name":"FGF13","data":[[2,155]]},{"name":"FGF19","data":[[3,154]]},{"name":"FGFR1","data":[[6,16]]},{"name":"FGFR2","data":[[12,191]]},{"name":"FGFR3","data":[[10,26]]},{"name":"FGFR4","data":[[4,5]]},{"name":"FGFRL1","data":[[2,23]]},{"name":"FGR","data":[[1,7]]},{"name":"FH","data":[[3,3]]},{"name":"FHIT","data":[[10,71]]},{"name":"FIBP","data":[[2,77]]},{"name":"FIP1L1","data":[[2,54]]},{"name":"FLG","data":[[3,4]]},{"name":"FLG2","data":[[2,68]]},{"name":"FLI1","data":[[2,6]]},{"name":"FLNB","data":[[3,6]]},{"name":"FLNC","data":[[2,2]]},{"name":"FLT3","data":[[8,19]]},{"name":"FMN2","data":[[4,40]]},{"name":"FN1","data":[[3,3]]},{"name":"FNDC3A","data":[[1,1]]},{"name":"FOLH1","data":[[2,102]]},{"name":"FOSL1","data":[[2,77]]},{"name":"FOXA1","data":[[6,53]]},{"name":"FOXA2","data":[[2,2]]},{"name":"FOXD4","data":[[2,109]]},{"name":"FOXD4L3","data":[[6,200]]},{"name":"FOXD4L5","data":[[4,158]]},{"name":"FOXD4L6","data":[[6,200]]},{"name":"FOXG1","data":[[2,62]]},{"name":"FOXL2","data":[[2,2]]},{"name":"FOXQ1","data":[[2,40]]},{"name":"FPGS","data":[[2,70]]},{"name":"FRAS1","data":[[1,5]]},{"name":"FREM2","data":[[1,1]]},{"name":"FRMD8","data":[[2,77]]},{"name":"FRS2","data":[[2,95]]},{"name":"FSHR","data":[[2,152]]},{"name":"FSTL4","data":[[1,1]]},{"name":"FTSJ2","data":[[2,26]]},{"name":"FUBP1","data":[[6,12]]},{"name":"FUCA1","data":[[1,6]]},{"name":"FUOM","data":[[2,44]]},{"name":"FXR2","data":[[1,1]]},{"name":"FYCO1","data":[[5,30]]},{"name":"FZR1","data":[[1,1]]},{"name":"G3BP1","data":[[1,1]]},{"name":"G6PC","data":[[2,6]]},{"name":"G6PD","data":[[2,126]]},{"name":"GAB2","data":[[4,27]]},{"name":"GABRA2","data":[[4,144]]},{"name":"GABRB2","data":[[1,1]]},{"name":"GABRG1","data":[[2,59]]},{"name":"GABRG2","data":[[2,108]]},{"name":"GABRG3","data":[[2,99]]},{"name":"GAK","data":[[2,23]]},{"name":"GAL3ST2","data":[[4,174]]},{"name":"GALE","data":[[1,6]]},{"name":"GAMT","data":[[2,28]]},{"name":"GARNL3","data":[[2,70]]},{"name":"GAS8","data":[[4,60]]},{"name":"GATA2","data":[[4,106]]},{"name":"GATA3","data":[[6,29]]},{"name":"GATA4","data":[[2,99]]},{"name":"GBA","data":[[2,80]]},{"name":"GEMIN4","data":[[1,1]]},{"name":"GEMIN5","data":[[1,1]]},{"name":"GFRA3","data":[[1,1]]},{"name":"GHRL","data":[[2,5]]},{"name":"GIGYF2","data":[[1,1]]},{"name":"GK2","data":[[2,59]]},{"name":"GLB1L2","data":[[4,46]]},{"name":"GLB1L3","data":[[2,23]]},{"name":"GLI1","data":[[3,4]]},{"name":"GLIS2","data":[[1,1]]},{"name":"GLOD4","data":[[1,1]]},{"name":"GLRB","data":[[2,59]]},{"name":"GLT8D1","data":[[2,5]]},{"name":"GLTSCR1","data":[[2,110]]},{"name":"GLYCTK","data":[[2,5]]},{"name":"GMDS","data":[[4,104]]},{"name":"GMEB2","data":[[2,38]]},{"name":"GML","data":[[2,60]]},{"name":"GMPPB","data":[[2,5]]},{"name":"GNA11","data":[[5,9]]},{"name":"GNAI2","data":[[4,64]]},{"name":"GNAQ","data":[[8,13]]},{"name":"GNAS","data":[[3,3]]},{"name":"GNB1","data":[[2,55]]},{"name":"GNB1L","data":[[2,99]]},{"name":"GNPTAB","data":[[2,7]]},{"name":"GOLPH3L","data":[[4,115]]},{"name":"GP2","data":[[2,94]]},{"name":"GPATCH3","data":[[1,6]]},{"name":"GPC5","data":[[2,99]]},{"name":"GPN2","data":[[3,19]]},{"name":"GPR112","data":[[2,2]]},{"name":"GPR141","data":[[4,215]]},{"name":"GPR158","data":[[2,119]]},{"name":"GPR160","data":[[2,89]]},{"name":"GPR3","data":[[1,7]]},{"name":"GPR34","data":[[2,3]]},{"name":"GPR50","data":[[2,40]]},{"name":"GPR98","data":[[1,1]]},{"name":"GPRIN2","data":[[2,40]]},{"name":"GPS2","data":[[2,41]]},{"name":"GPSM3","data":[[2,150]]},{"name":"GPX4","data":[[2,17]]},{"name":"GRB7","data":[[4,195]]},{"name":"GRHL3","data":[[1,6]]},{"name":"GRIA1","data":[[1,1]]},{"name":"GRID2","data":[[2,49]]},{"name":"GRID2IP","data":[[1,1]]},{"name":"GRIN2A","data":[[2,10]]},{"name":"GRM1","data":[[2,16]]},{"name":"GRM2","data":[[1,1]]},{"name":"GRM5","data":[[2,149]]},{"name":"GRXCR1","data":[[6,269]]},{"name":"GSTCD","data":[[2,63]]},{"name":"GSTM3","data":[[4,5]]},{"name":"GSTT1","data":[[3,6]]},{"name":"GTF2H2","data":[[2,63]]},{"name":"GTF2H2C","data":[[2,63]]},{"name":"GTF2I","data":[[2,3]]},{"name":"GUCA1B","data":[[2,43]]},{"name":"GUCY1B2","data":[[1,1]]},{"name":"GUCY2D","data":[[1,1]]},{"name":"GUSB","data":[[2,7]]},{"name":"GUSBP3","data":[[2,63]]},{"name":"GYLTL1B","data":[[2,151]]},{"name":"H2AFX","data":[[2,8]]},{"name":"H2AFY","data":[[1,1]]},{"name":"H3-K27M","data":[[2,3]]},{"name":"H3F3A","data":[[5,8]]},{"name":"HACL1","data":[[2,5]]},{"name":"HAO1","data":[[2,98]]},{"name":"HAPLN1","data":[[2,108]]},{"name":"HARS2","data":[[1,1]]},{"name":"HBD","data":[[2,61]]},{"name":"HBG2","data":[[2,60]]},{"name":"HCFC1","data":[[2,52]]},{"name":"HCN1","data":[[2,41]]},{"name":"HCN3","data":[[2,80]]},{"name":"HDAC10","data":[[2,16]]},{"name":"HDAC3","data":[[3,34]]},{"name":"HDAC4","data":[[6,100]]},{"name":"HDAC9","data":[[2,98]]},{"name":"HDLBP","data":[[4,164]]},{"name":"HEMK1","data":[[2,5]]},{"name":"HERC1","data":[[1,1]]},{"name":"HERC2","data":[[4,87]]},{"name":"HES2","data":[[2,55]]},{"name":"HES3","data":[[2,55]]},{"name":"HES4","data":[[6,6]]},{"name":"HES5","data":[[1,1]]},{"name":"HFM1","data":[[1,1]]},{"name":"HGF","data":[[2,152]]},{"name":"HHLA2","data":[[2,61]]},{"name":"HIC1","data":[[2,2]]},{"name":"HIC2","data":[[2,99]]},{"name":"HIF1A","data":[[1,1]]},{"name":"HIPK1","data":[[2,51]]},{"name":"HIPK2","data":[[1,1]]},{"name":"HIRA","data":[[2,99]]},{"name":"HIST1H2AA","data":[[2,61]]},{"name":"HIST1H2AG","data":[[2,32]]},{"name":"HLA-A","data":[[4,272]]},{"name":"HLA-DRB5","data":[[2,36]]},{"name":"HMGCL","data":[[1,6]]},{"name":"HMGN2","data":[[3,18]]},{"name":"HNF1A","data":[[2,39]]},{"name":"HNF4G","data":[[2,60]]},{"name":"HNRNPR","data":[[1,6]]},{"name":"HORMAD1","data":[[2,34]]},{"name":"HOXA1","data":[[2,99]]},{"name":"HP1BP3","data":[[1,7]]},{"name":"HPS3","data":[[2,63]]},{"name":"HRAS","data":[[41,147]]},{"name":"HS1BP3","data":[[2,84]]},{"name":"HSBP1L1","data":[[12,253]]},{"name":"HSD11B1L","data":[[2,10]]},{"name":"HSD17B4","data":[[1,1]]},{"name":"HSF4","data":[[2,68]]},{"name":"HSFY1P1","data":[[2,77]]},{"name":"HSPA4","data":[[2,29]]},{"name":"HSPA8","data":[[2,66]]},{"name":"HSPG2","data":[[2,8]]},{"name":"HTR2A","data":[[1,1]]},{"name":"HTR6","data":[[1,7]]},{"name":"HUS1B","data":[[2,43]]},{"name":"HUWE1","data":[[2,3]]},{"name":"HYDIN","data":[[1,1]]},{"name":"ICMT","data":[[2,55]]},{"name":"ID3","data":[[1,6]]},{"name":"IDH1","data":[[23,246]]},{"name":"IDH2","data":[[11,41]]},{"name":"IDUA","data":[[2,23]]},{"name":"IFFO2","data":[[1,7]]},{"name":"IFI6","data":[[1,7]]},{"name":"IFITM1","data":[[6,121]]},{"name":"IFITM2","data":[[6,121]]},{"name":"IFITM3","data":[[6,121]]},{"name":"IFITM5","data":[[2,59]]},{"name":"IFNA13","data":[[4,35]]},{"name":"IFNE","data":[[2,3]]},{"name":"IFNLR1","data":[[1,6]]},{"name":"IFT88","data":[[2,8]]},{"name":"IGF1R","data":[[2,3]]},{"name":"IGFBP1","data":[[2,152]]},{"name":"IGH","data":[[1,2]]},{"name":"IGHV4-34","data":[[1,1]]},{"name":"IGLL5","data":[[2,3]]},{"name":"IGSF21","data":[[3,101]]},{"name":"IGSF3","data":[[2,72]]},{"name":"IKBKB","data":[[2,151]]},{"name":"IKZF1","data":[[1,1]]},{"name":"IKZF3","data":[[2,90]]},{"name":"IL17RA","data":[[2,19]]},{"name":"IL17RD","data":[[2,5]]},{"name":"IL18RAP","data":[[2,34]]},{"name":"IL1RAPL1","data":[[2,108]]},{"name":"IL22RA1","data":[[1,6]]},{"name":"IL32","data":[[2,4]]},{"name":"IL4R","data":[[2,38]]},{"name":"IL5RA","data":[[2,109]]},{"name":"IMMP2L","data":[[2,56]]},{"name":"ING1","data":[[4,21]]},{"name":"ING5","data":[[4,174]]},{"name":"INHBA","data":[[2,109]]},{"name":"INPP4B","data":[[1,1]]},{"name":"INTS2","data":[[2,89]]},{"name":"INTS4","data":[[2,28]]},{"name":"INTS6","data":[[1,1]]},{"name":"IP6K1","data":[[2,5]]},{"name":"IP6K2","data":[[2,5]]},{"name":"IPO5","data":[[2,153]]},{"name":"IQSEC3","data":[[2,67]]},{"name":"IRAK1","data":[[2,82]]},{"name":"IRF1","data":[[1,1]]},{"name":"IRF4","data":[[2,43]]},{"name":"IRF7","data":[[2,27]]},{"name":"IRS2","data":[[2,2]]},{"name":"IRX1","data":[[2,39]]},{"name":"ISCA2","data":[[2,60]]},{"name":"ISG15","data":[[2,55]]},{"name":"ISOC2","data":[[4,170]]},{"name":"ITFG3","data":[[2,25]]},{"name":"ITGA8","data":[[2,54]]},{"name":"ITGAM","data":[[2,10]]},{"name":"ITGAX","data":[[2,10]]},{"name":"ITGBL1","data":[[2,96]]},{"name":"ITIH3","data":[[3,6]]},{"name":"ITIH4","data":[[2,5]]},{"name":"ITM2B","data":[[2,39]]},{"name":"IWS1","data":[[2,150]]},{"name":"JAG2","data":[[4,113]]},{"name":"JAGN1","data":[[2,5]]},{"name":"JAK1","data":[[7,55]]},{"name":"JAK2","data":[[9,14]]},{"name":"JAK3","data":[[5,15]]},{"name":"JAKMIP2","data":[[1,1]]},{"name":"JAM3","data":[[2,23]]},{"name":"JMJD8","data":[[2,25]]},{"name":"JUN","data":[[4,36]]},{"name":"KALRN","data":[[1,1]]},{"name":"KANK1","data":[[2,109]]},{"name":"KAT2A","data":[[1,1]]},{"name":"KAT2B","data":[[3,7]]},{"name":"KAT5","data":[[2,77]]},{"name":"KAT6A","data":[[2,2]]},{"name":"KAZN","data":[[1,7]]},{"name":"KBTBD6","data":[[1,1]]},{"name":"KBTBD8","data":[[2,5]]},{"name":"KCNA4","data":[[2,20]]},{"name":"KCNA6","data":[[2,16]]},{"name":"KCNAB2","data":[[4,87]]},{"name":"KCNB1","data":[[2,24]]},{"name":"KCNB2","data":[[2,39]]},{"name":"KCND2","data":[[2,96]]},{"name":"KCNG2","data":[[8,216]]},{"name":"KCNH8","data":[[2,5]]},{"name":"KCNIP4","data":[[2,12]]},{"name":"KCNJ13","data":[[4,50]]},{"name":"KCNJ3","data":[[2,99]]},{"name":"KCNK6","data":[[2,51]]},{"name":"KCNK7","data":[[2,77]]},{"name":"KCNMB3","data":[[4,383]]},{"name":"KCNRG","data":[[3,40]]},{"name":"KCTD16","data":[[1,1]]},{"name":"KCTD6","data":[[2,5]]},{"name":"KCTD9","data":[[2,151]]},{"name":"KDM1A","data":[[2,6]]},{"name":"KDM3B","data":[[1,1]]},{"name":"KDM5A","data":[[9,312]]},{"name":"KDM5C","data":[[2,8]]},{"name":"KDM6A","data":[[12,247]]},{"name":"KDM6B","data":[[2,2]]},{"name":"KDR","data":[[1,1]]},{"name":"KEAP1","data":[[7,69]]},{"name":"KEL","data":[[6,82]]},{"name":"KHDRBS2","data":[[6,239]]},{"name":"KIAA0141","data":[[1,1]]},{"name":"KIAA0195","data":[[4,136]]},{"name":"KIAA0226L","data":[[1,1]]},{"name":"KIAA0825","data":[[1,1]]},{"name":"KIAA1045","data":[[2,26]]},{"name":"KIAA1109","data":[[1,1]]},{"name":"KIAA1143","data":[[2,5]]},{"name":"KIAA1211","data":[[2,24]]},{"name":"KIAA1257","data":[[2,61]]},{"name":"KIAA2013","data":[[2,7]]},{"name":"KIF15","data":[[3,68]]},{"name":"KIF17","data":[[2,7]]},{"name":"KIF1B","data":[[2,7]]},{"name":"KIF20A","data":[[1,1]]},{"name":"KIF2B","data":[[2,153]]},{"name":"KIF3A","data":[[1,1]]},{"name":"KIF4B","data":[[1,1]]},{"name":"KIF5B","data":[[2,163]]},{"name":"KIRREL2","data":[[2,95]]},{"name":"KIT","data":[[17,53]]},{"name":"KLC2","data":[[2,153]]},{"name":"KLF12","data":[[1,1]]},{"name":"KLF3","data":[[2,151]]},{"name":"KLF4","data":[[3,7]]},{"name":"KLF5","data":[[1,1]]},{"name":"KLHDC7A","data":[[2,7]]},{"name":"KLHDC9","data":[[2,3]]},{"name":"KLHL17","data":[[2,55]]},{"name":"KLHL18","data":[[2,5]]},{"name":"KLHL21","data":[[2,55]]},{"name":"KLHL7","data":[[2,69]]},{"name":"KLHL9","data":[[2,3]]},{"name":"KLK15","data":[[1,6]]},{"name":"KLLN","data":[[20,565]]},{"name":"KMT2A","data":[[4,37]]},{"name":"KMT2B","data":[[2,2]]},{"name":"KMT2C","data":[[6,65]]},{"name":"KMT2D","data":[[1,1]]},{"name":"KPNA3","data":[[1,1]]},{"name":"KPNA7","data":[[2,91]]},{"name":"KRAS","data":[[69,607]]},{"name":"KREMEN1","data":[[2,185]]},{"name":"KRT2","data":[[4,62]]},{"name":"KRT76","data":[[2,26]]},{"name":"KRTAP10-10","data":[[2,72]]},{"name":"KRTAP10-7","data":[[2,108]]},{"name":"KRTAP4-11","data":[[2,4]]},{"name":"KRTAP4-5","data":[[2,22]]},{"name":"KRTCAP2","data":[[2,80]]},{"name":"LACC1","data":[[1,1]]},{"name":"LAGE3","data":[[2,126]]},{"name":"LAIR2","data":[[2,110]]},{"name":"LAMA1","data":[[2,2]]},{"name":"LAMA2","data":[[1,2]]},{"name":"LAMB2","data":[[3,6]]},{"name":"LARP1","data":[[1,1]]},{"name":"LARS2","data":[[2,5]]},{"name":"LATS1","data":[[3,3]]},{"name":"LATS2","data":[[2,2]]},{"name":"LCP1","data":[[3,55]]},{"name":"LDB2","data":[[2,101]]},{"name":"LDLRAD2","data":[[2,7]]},{"name":"LDLRAP1","data":[[2,6]]},{"name":"LETMD1","data":[[2,68]]},{"name":"LHCGR","data":[[2,150]]},{"name":"LIFR","data":[[1,1]]},{"name":"LIG4","data":[[1,1]]},{"name":"LIMD1","data":[[2,5]]},{"name":"LIMK2","data":[[2,18]]},{"name":"LIN28A","data":[[2,12]]},{"name":"LIN7A","data":[[2,61]]},{"name":"LMAN1","data":[[2,148]]},{"name":"LMAN2","data":[[2,24]]},{"name":"LMF2","data":[[2,16]]},{"name":"LMNA","data":[[1,1]]},{"name":"LMO7","data":[[2,62]]},{"name":"LPAR6","data":[[5,34]]},{"name":"LPCAT1","data":[[2,56]]},{"name":"LRCH1","data":[[1,1]]},{"name":"LRFN5","data":[[4,93]]},{"name":"LRP1","data":[[1,1]]},{"name":"LRP1B","data":[[4,83]]},{"name":"LRP2","data":[[5,40]]},{"name":"LRRC14B","data":[[3,148]]},{"name":"LRRC37A3","data":[[2,60]]},{"name":"LRRC47","data":[[2,55]]},{"name":"LRRC56","data":[[3,62]]},{"name":"LRRCC1","data":[[2,26]]},{"name":"LRRFIP2","data":[[2,5]]},{"name":"LRRIQ4","data":[[2,102]]},{"name":"LRRN2","data":[[2,151]]},{"name":"LRRTM3","data":[[2,95]]},{"name":"LRSAM1","data":[[2,70]]},{"name":"LSAMP","data":[[2,56]]},{"name":"LSM3","data":[[2,5]]},{"name":"LTBP2","data":[[2,60]]},{"name":"LTBP3","data":[[4,98]]},{"name":"LTF","data":[[1,1]]},{"name":"LUC7L","data":[[2,25]]},{"name":"LUM","data":[[2,128]]},{"name":"LUZP1","data":[[2,6]]},{"name":"LYL1","data":[[2,2]]},{"name":"LYPLA2","data":[[2,6]]},{"name":"LYRM2","data":[[2,136]]},{"name":"LYRM5","data":[[2,116]]},{"name":"LYZ","data":[[1,1]]},{"name":"LZIC","data":[[2,7]]},{"name":"LZTFL1","data":[[2,5]]},{"name":"LZTR1","data":[[4,137]]},{"name":"MACF1","data":[[3,145]]},{"name":"MAD1L1","data":[[2,26]]},{"name":"MAGEA1","data":[[2,106]]},{"name":"MAGEA3","data":[[2,106]]},{"name":"MAGEA6","data":[[2,106]]},{"name":"MAGEB2","data":[[2,97]]},{"name":"MAGEC1","data":[[2,14]]},{"name":"MAGEE2","data":[[2,153]]},{"name":"MAGI1","data":[[2,49]]},{"name":"MALAT1","data":[[2,77]]},{"name":"MALT1","data":[[1,2]]},{"name":"MAML3","data":[[1,1]]},{"name":"MAN1A1","data":[[1,1]]},{"name":"MAP2K1","data":[[7,67]]},{"name":"MAP2K3","data":[[1,1]]},{"name":"MAP2K4","data":[[8,62]]},{"name":"MAP2K5","data":[[1,1]]},{"name":"MAP3K1","data":[[3,8]]},{"name":"MAP3K11","data":[[2,77]]},{"name":"MAP3K4","data":[[1,1]]},{"name":"MAP3K5","data":[[1,2]]},{"name":"MAP3K6","data":[[2,7]]},{"name":"MAP4","data":[[2,5]]},{"name":"MAPK1","data":[[6,139]]},{"name":"MAPK11","data":[[2,16]]},{"name":"MAPK12","data":[[2,16]]},{"name":"MAPK8IP2","data":[[2,10]]},{"name":"MAPKAPK3","data":[[2,5]]},{"name":"MARCH9","data":[[2,48]]},{"name":"MASP2","data":[[2,7]]},{"name":"MAX","data":[[4,93]]},{"name":"MBD3","data":[[2,71]]},{"name":"MBP","data":[[2,7]]},{"name":"MBTPS1","data":[[2,48]]},{"name":"MC1R","data":[[4,60]]},{"name":"MCL1","data":[[3,6]]},{"name":"MDC1","data":[[1,1]]},{"name":"MDK","data":[[2,32]]},{"name":"MDM2","data":[[19,303]]},{"name":"MDM4","data":[[5,13]]},{"name":"MDN1","data":[[1,1]]},{"name":"MDS2","data":[[2,6]]},{"name":"MECOM","data":[[1,1]]},{"name":"MECP2","data":[[2,77]]},{"name":"MED12","data":[[7,13]]},{"name":"MED15","data":[[2,99]]},{"name":"MED23","data":[[2,7]]},{"name":"MED29","data":[[2,86]]},{"name":"MEF2C","data":[[2,58]]},{"name":"MEGF10","data":[[3,9]]},{"name":"MEGF9","data":[[2,9]]},{"name":"MET","data":[[18,392]]},{"name":"METRN","data":[[2,25]]},{"name":"METTL1","data":[[2,139]]},{"name":"METTL14","data":[[2,17]]},{"name":"METTL21B","data":[[2,139]]},{"name":"METTL6","data":[[2,5]]},{"name":"METTL9","data":[[2,25]]},{"name":"MEX3D","data":[[2,71]]},{"name":"MFF","data":[[2,66]]},{"name":"MFI2","data":[[2,57]]},{"name":"MFN1","data":[[2,247]]},{"name":"MFN2","data":[[2,7]]},{"name":"MFRP","data":[[2,151]]},{"name":"MFSD7","data":[[2,23]]},{"name":"MGA","data":[[5,7]]},{"name":"MGMT","data":[[1,1]]},{"name":"MIB2","data":[[2,55]]},{"name":"MICALCL","data":[[2,151]]},{"name":"MID1","data":[[4,90]]},{"name":"MIDN","data":[[4,95]]},{"name":"MIEN1","data":[[6,222]]},{"name":"MIER3","data":[[2,8]]},{"name":"MIIP","data":[[2,7]]},{"name":"MINOS1","data":[[2,7]]},{"name":"MIPOL1","data":[[4,129]]},{"name":"MIR17HG","data":[[1,1]]},{"name":"MIR31HG","data":[[1,3]]},{"name":"MITF","data":[[2,36]]},{"name":"MKI67","data":[[1,1]]},{"name":"MKRN2","data":[[2,5]]},{"name":"MKX","data":[[2,57]]},{"name":"MLC1","data":[[2,16]]},{"name":"MLH1","data":[[1,1]]},{"name":"MLLT3","data":[[2,31]]},{"name":"MLLT4","data":[[5,52]]},{"name":"MMEL1","data":[[2,55]]},{"name":"MMP16","data":[[2,63]]},{"name":"MMP3","data":[[2,147]]},{"name":"MNDA","data":[[2,151]]},{"name":"MPDU1","data":[[1,1]]},{"name":"MPG","data":[[2,25]]},{"name":"MPL","data":[[3,8]]},{"name":"MPP7","data":[[2,59]]},{"name":"MPPED2","data":[[2,100]]},{"name":"MRE11A","data":[[2,8]]},{"name":"MRPL36","data":[[2,56]]},{"name":"MRPL38","data":[[2,47]]},{"name":"MRPL40","data":[[2,99]]},{"name":"MRPL49","data":[[2,77]]},{"name":"MRTO4","data":[[2,7]]},{"name":"MS4A14","data":[[2,99]]},{"name":"MS4A4A","data":[[2,128]]},{"name":"MST1","data":[[1,1]]},{"name":"MST1L","data":[[4,18]]},{"name":"MST1R","data":[[1,1]]},{"name":"MTAP","data":[[3,7]]},{"name":"MTDH","data":[[2,29]]},{"name":"MTFR1L","data":[[2,6]]},{"name":"MTG1","data":[[2,44]]},{"name":"MTHFR","data":[[2,7]]},{"name":"MTMR14","data":[[2,5]]},{"name":"MTNR1B","data":[[2,98]]},{"name":"MTOR","data":[[7,25]]},{"name":"MTUS2","data":[[1,1]]},{"name":"MTX1","data":[[2,80]]},{"name":"MUC1","data":[[2,24]]},{"name":"MUC16","data":[[7,19]]},{"name":"MUC17","data":[[7,104]]},{"name":"MUC2","data":[[2,72]]},{"name":"MUC4","data":[[6,19]]},{"name":"MUC5B","data":[[6,12]]},{"name":"MUL1","data":[[2,7]]},{"name":"MUS81","data":[[2,77]]},{"name":"MUSTN1","data":[[2,5]]},{"name":"MXD3","data":[[2,24]]},{"name":"MYB","data":[[2,39]]},{"name":"MYC","data":[[15,439]]},{"name":"MYCBP2","data":[[1,1]]},{"name":"MYCL","data":[[2,3]]},{"name":"MYCN","data":[[6,15]]},{"name":"MYH1","data":[[1,1]]},{"name":"MYH10","data":[[1,1]]},{"name":"MYH13","data":[[1,1]]},{"name":"MYH2","data":[[3,21]]},{"name":"MYH3","data":[[1,1]]},{"name":"MYH4","data":[[3,19]]},{"name":"MYH8","data":[[3,18]]},{"name":"MYH9","data":[[2,4]]},{"name":"MYL3","data":[[2,5]]},{"name":"MYL5","data":[[2,23]]},{"name":"MYNN","data":[[2,4]]},{"name":"MYO15A","data":[[1,1]]},{"name":"MYO18B","data":[[2,2]]},{"name":"MYO3A","data":[[2,16]]},{"name":"MYO6","data":[[2,35]]},{"name":"MYOCD","data":[[1,1]]},{"name":"MYOM3","data":[[2,6]]},{"name":"MYT1","data":[[2,38]]},{"name":"MZF1","data":[[2,18]]},{"name":"MZT1","data":[[1,1]]},{"name":"NAA10","data":[[2,52]]},{"name":"NAA16","data":[[1,1]]},{"name":"NAALADL1","data":[[2,77]]},{"name":"NADK","data":[[2,55]]},{"name":"NAIF1","data":[[2,70]]},{"name":"NAIP","data":[[2,63]]},{"name":"NAP1L2","data":[[2,60]]},{"name":"NAPEPLD","data":[[2,153]]},{"name":"NARFL","data":[[2,25]]},{"name":"NAT10","data":[[2,19]]},{"name":"NAT14","data":[[2,22]]},{"name":"NAV2","data":[[4,45]]},{"name":"NAV3","data":[[4,240]]},{"name":"NBEA","data":[[2,3]]},{"name":"NBEAL2","data":[[1,1]]},{"name":"NBL1","data":[[2,7]]},{"name":"NBN","data":[[1,1]]},{"name":"NBPF1","data":[[6,89]]},{"name":"NBPF10","data":[[2,67]]},{"name":"NBPF3","data":[[2,7]]},{"name":"NBR2","data":[[2,114]]},{"name":"NCAPD3","data":[[4,45]]},{"name":"NCAPH2","data":[[2,16]]},{"name":"NCBP2","data":[[2,57]]},{"name":"NCKIPSD","data":[[2,46]]},{"name":"NCOA3","data":[[1,1]]},{"name":"NCOR1","data":[[7,49]]},{"name":"NCOR2","data":[[3,116]]},{"name":"NDNL2","data":[[4,87]]},{"name":"NDUFAF3","data":[[2,5]]},{"name":"NDUFS6","data":[[2,56]]},{"name":"NEAT1","data":[[2,77]]},{"name":"NEB","data":[[3,3]]},{"name":"NECAP2","data":[[2,7]]},{"name":"NEDD4L","data":[[2,59]]},{"name":"NEDD9","data":[[2,2]]},{"name":"NEFH","data":[[6,137]]},{"name":"NEGR1","data":[[2,6]]},{"name":"NEK10","data":[[2,5]]},{"name":"NEK3","data":[[2,2]]},{"name":"NEK5","data":[[3,59]]},{"name":"NEK8","data":[[2,54]]},{"name":"NEURL4","data":[[1,1]]},{"name":"NEUROD2","data":[[2,108]]},{"name":"NF1","data":[[29,214]]},{"name":"NF2","data":[[11,19]]},{"name":"NFASC","data":[[1,1]]},{"name":"NFATC1","data":[[11,245]]},{"name":"NFE2L2","data":[[15,271]]},{"name":"NFE2L3","data":[[2,33]]},{"name":"NFIA","data":[[2,50]]},{"name":"NFIC","data":[[2,23]]},{"name":"NFKB1","data":[[2,3]]},{"name":"NFKBIA","data":[[2,2]]},{"name":"NGLY1","data":[[2,5]]},{"name":"NHLRC1","data":[[2,22]]},{"name":"NHLRC4","data":[[2,25]]},{"name":"NHSL2","data":[[2,15]]},{"name":"NICN1","data":[[2,5]]},{"name":"NIM1K","data":[[2,7]]},{"name":"NINJ2","data":[[4,193]]},{"name":"NIPAL3","data":[[2,6]]},{"name":"NIPBL","data":[[2,22]]},{"name":"NISCH","data":[[3,6]]},{"name":"NKD2","data":[[2,145]]},{"name":"NKX2-1","data":[[1,2]]},{"name":"NLGN1","data":[[4,98]]},{"name":"NLGN2","data":[[1,1]]},{"name":"NLGN4X","data":[[2,49]]},{"name":"NLK","data":[[2,153]]},{"name":"NLRP1","data":[[1,1]]},{"name":"NLRP14","data":[[2,100]]},{"name":"NLRP5","data":[[4,135]]},{"name":"NLRP6","data":[[2,59]]},{"name":"NLRP8","data":[[2,24]]},{"name":"NME4","data":[[2,25]]},{"name":"NME6","data":[[3,6]]},{"name":"NMNAT1","data":[[2,7]]},{"name":"NMS","data":[[2,59]]},{"name":"NMUR2","data":[[1,1]]},{"name":"NNMT","data":[[2,43]]},{"name":"NNT","data":[[2,49]]},{"name":"NOBOX","data":[[2,151]]},{"name":"NOC2L","data":[[2,55]]},{"name":"NOC4L","data":[[2,62]]},{"name":"NOL9","data":[[2,55]]},{"name":"NOTCH1","data":[[13,77]]},{"name":"NOTCH2","data":[[2,2]]},{"name":"NOTCH3","data":[[2,152]]},{"name":"NOV","data":[[2,2]]},{"name":"NPAS3","data":[[2,18]]},{"name":"NPBWR2","data":[[2,38]]},{"name":"NPFFR2","data":[[4,166]]},{"name":"NPHP4","data":[[4,87]]},{"name":"NPM1","data":[[4,30]]},{"name":"NPRL3","data":[[2,25]]},{"name":"NQO2","data":[[2,22]]},{"name":"NR2F2","data":[[2,22]]},{"name":"NR3C1","data":[[1,1]]},{"name":"NR4A2","data":[[2,9]]},{"name":"NRAS","data":[[43,139]]},{"name":"NRD1","data":[[2,38]]},{"name":"NRG1","data":[[2,23]]},{"name":"NRG3","data":[[2,103]]},{"name":"NRK","data":[[2,60]]},{"name":"NRN1L","data":[[2,43]]},{"name":"NRXN1","data":[[2,107]]},{"name":"NRXN3","data":[[2,2]]},{"name":"NSD1","data":[[7,47]]},{"name":"NSDHL","data":[[2,106]]},{"name":"NTF3","data":[[2,16]]},{"name":"NTM","data":[[2,71]]},{"name":"NTN4","data":[[2,4]]},{"name":"NTRK1","data":[[2,8]]},{"name":"NTRK3","data":[[2,8]]},{"name":"NUCB2","data":[[2,106]]},{"name":"NUDC","data":[[2,6]]},{"name":"NUDT1","data":[[2,26]]},{"name":"NUDT14","data":[[2,80]]},{"name":"NUMA1","data":[[1,1]]},{"name":"NUP210","data":[[2,5]]},{"name":"NXN","data":[[1,1]]},{"name":"OBSCN","data":[[4,6]]},{"name":"ODF3","data":[[4,117]]},{"name":"OGG1","data":[[2,5]]},{"name":"OIP5","data":[[2,28]]},{"name":"OLFM4","data":[[1,1]]},{"name":"OMG","data":[[4,38]]},{"name":"OPRL1","data":[[2,38]]},{"name":"OR10A4","data":[[2,92]]},{"name":"OR10AG1","data":[[2,151]]},{"name":"OR10G8","data":[[4,166]]},{"name":"OR10S1","data":[[2,152]]},{"name":"OR13C2","data":[[2,58]]},{"name":"OR14A16","data":[[2,107]]},{"name":"OR2A2","data":[[2,112]]},{"name":"OR2A25","data":[[2,36]]},{"name":"OR2A5","data":[[2,104]]},{"name":"OR2AK2","data":[[2,99]]},{"name":"OR2B11","data":[[2,127]]},{"name":"OR2C3","data":[[2,32]]},{"name":"OR2G6","data":[[2,152]]},{"name":"OR2T12","data":[[4,256]]},{"name":"OR2T2","data":[[2,100]]},{"name":"OR2T33","data":[[2,106]]},{"name":"OR2T4","data":[[4,260]]},{"name":"OR2T8","data":[[2,95]]},{"name":"OR4A16","data":[[2,108]]},{"name":"OR4C11","data":[[4,227]]},{"name":"OR4C16","data":[[4,204]]},{"name":"OR4D11","data":[[2,44]]},{"name":"OR4D5","data":[[4,165]]},{"name":"OR4F6","data":[[2,49]]},{"name":"OR4K5","data":[[2,61]]},{"name":"OR4L1","data":[[2,96]]},{"name":"OR4M1","data":[[2,105]]},{"name":"OR4M2","data":[[2,153]]},{"name":"OR4N2","data":[[2,74]]},{"name":"OR4N4","data":[[4,162]]},{"name":"OR4P4","data":[[2,152]]},{"name":"OR4Q3","data":[[2,63]]},{"name":"OR51A7","data":[[4,252]]},{"name":"OR51B2","data":[[2,101]]},{"name":"OR51B5","data":[[2,154]]},{"name":"OR52E8","data":[[2,156]]},{"name":"OR52J3","data":[[2,106]]},{"name":"OR5AC2","data":[[2,106]]},{"name":"OR5AR1","data":[[2,36]]},{"name":"OR5AS1","data":[[2,98]]},{"name":"OR5D13","data":[[4,112]]},{"name":"OR5D14","data":[[2,152]]},{"name":"OR5F1","data":[[2,109]]},{"name":"OR5J2","data":[[2,127]]},{"name":"OR5K3","data":[[2,98]]},{"name":"OR5L1","data":[[4,162]]},{"name":"OR5L2","data":[[2,47]]},{"name":"OR5M9","data":[[2,94]]},{"name":"OR5T3","data":[[2,106]]},{"name":"OR6F1","data":[[2,103]]},{"name":"OR6K3","data":[[2,96]]},{"name":"OR8D1","data":[[2,18]]},{"name":"OR8D4","data":[[2,61]]},{"name":"OR8H1","data":[[2,94]]},{"name":"OR8H2","data":[[4,156]]},{"name":"OR8H3","data":[[2,112]]},{"name":"OR8I2","data":[[4,152]]},{"name":"OR8J3","data":[[2,50]]},{"name":"OR8K3","data":[[4,144]]},{"name":"OR8K5","data":[[2,96]]},{"name":"ORAOV1","data":[[2,10]]},{"name":"OTUD3","data":[[2,7]]},{"name":"OVOL1","data":[[2,77]]},{"name":"OXCT1","data":[[2,153]]},{"name":"OXNAD1","data":[[2,5]]},{"name":"OXSR1","data":[[2,5]]},{"name":"OXTR","data":[[2,5]]},{"name":"P2RY4","data":[[2,150]]},{"name":"P4HTM","data":[[2,5]]},{"name":"PABPC3","data":[[1,1]]},{"name":"PACRG","data":[[2,43]]},{"name":"PAF1","data":[[2,86]]},{"name":"PAFAH1B1","data":[[2,153]]},{"name":"PAFAH2","data":[[2,6]]},{"name":"PAK1","data":[[5,44]]},{"name":"PAK2","data":[[2,57]]},{"name":"PALB2","data":[[4,30]]},{"name":"PANK4","data":[[2,55]]},{"name":"PAOX","data":[[4,47]]},{"name":"PAPLN","data":[[2,8]]},{"name":"PAQR7","data":[[2,6]]},{"name":"PARD3","data":[[4,106]]},{"name":"PARD6B","data":[[2,24]]},{"name":"PARD6G","data":[[12,253]]},{"name":"PARK2","data":[[12,204]]},{"name":"PARM1","data":[[2,61]]},{"name":"PARP1","data":[[1,1]]},{"name":"PARP11","data":[[2,75]]},{"name":"PAX2","data":[[2,152]]},{"name":"PAX6","data":[[2,156]]},{"name":"PAX8","data":[[2,7]]},{"name":"PBRM1","data":[[10,68]]},{"name":"PCBP1","data":[[4,10]]},{"name":"PCDH1","data":[[1,1]]},{"name":"PCDH11X","data":[[2,37]]},{"name":"PCDH12","data":[[1,1]]},{"name":"PCDH15","data":[[1,1]]},{"name":"PCDH17","data":[[1,1]]},{"name":"PCDH19","data":[[2,8]]},{"name":"PCDH20","data":[[1,1]]},{"name":"PCDH8","data":[[1,1]]},{"name":"PCDH9","data":[[4,54]]},{"name":"PCDHA1","data":[[1,1]]},{"name":"PCDHA10","data":[[1,1]]},{"name":"PCDHA11","data":[[2,2]]},{"name":"PCDHA12","data":[[1,1]]},{"name":"PCDHA13","data":[[1,1]]},{"name":"PCDHA2","data":[[1,1]]},{"name":"PCDHA3","data":[[1,1]]},{"name":"PCDHA4","data":[[1,1]]},{"name":"PCDHA5","data":[[1,1]]},{"name":"PCDHA6","data":[[1,1]]},{"name":"PCDHA7","data":[[1,1]]},{"name":"PCDHA8","data":[[1,1]]},{"name":"PCDHA9","data":[[1,1]]},{"name":"PCDHAC1","data":[[1,1]]},{"name":"PCDHAC2","data":[[1,1]]},{"name":"PCDHB1","data":[[1,1]]},{"name":"PCDHB10","data":[[1,1]]},{"name":"PCDHB11","data":[[1,1]]},{"name":"PCDHB12","data":[[1,1]]},{"name":"PCDHB13","data":[[1,1]]},{"name":"PCDHB14","data":[[1,1]]},{"name":"PCDHB15","data":[[1,1]]},{"name":"PCDHB16","data":[[3,39]]},{"name":"PCDHB17","data":[[1,1]]},{"name":"PCDHB2","data":[[1,1]]},{"name":"PCDHB3","data":[[1,1]]},{"name":"PCDHB4","data":[[1,1]]},{"name":"PCDHB5","data":[[1,1]]},{"name":"PCDHB6","data":[[1,1]]},{"name":"PCDHB7","data":[[1,1]]},{"name":"PCDHB8","data":[[1,1]]},{"name":"PCDHGA1","data":[[1,1]]},{"name":"PCDHGA10","data":[[1,1]]},{"name":"PCDHGA11","data":[[1,1]]},{"name":"PCDHGA12","data":[[1,1]]},{"name":"PCDHGA2","data":[[1,1]]},{"name":"PCDHGA3","data":[[1,1]]},{"name":"PCDHGA4","data":[[1,1]]},{"name":"PCDHGA5","data":[[1,1]]},{"name":"PCDHGA6","data":[[1,1]]},{"name":"PCDHGA7","data":[[1,1]]},{"name":"PCDHGA8","data":[[1,1]]},{"name":"PCDHGA9","data":[[1,1]]},{"name":"PCDHGB1","data":[[1,1]]},{"name":"PCDHGB2","data":[[1,1]]},{"name":"PCDHGB3","data":[[1,1]]},{"name":"PCDHGB4","data":[[1,1]]},{"name":"PCDHGB6","data":[[1,1]]},{"name":"PCDHGB7","data":[[1,1]]},{"name":"PCDHGC3","data":[[1,1]]},{"name":"PCDHGC4","data":[[1,1]]},{"name":"PCDHGC5","data":[[1,1]]},{"name":"PCGF3","data":[[2,23]]},{"name":"PCLO","data":[[5,30]]},{"name":"PCMTD1","data":[[1,1]]},{"name":"PCMTD2","data":[[2,38]]},{"name":"PCSK6","data":[[2,49]]},{"name":"PDCD1LG2","data":[[2,51]]},{"name":"PDCD6","data":[[8,170]]},{"name":"PDCD6IP","data":[[2,5]]},{"name":"PDE10A","data":[[4,71]]},{"name":"PDE3A","data":[[2,8]]},{"name":"PDE4C","data":[[2,75]]},{"name":"PDE4D","data":[[10,140]]},{"name":"PDGFRA","data":[[9,120]]},{"name":"PDGFRB","data":[[1,1]]},{"name":"PDHB","data":[[2,5]]},{"name":"PDIK1L","data":[[2,6]]},{"name":"PDLIM2","data":[[2,23]]},{"name":"PEBP4","data":[[2,23]]},{"name":"PER1","data":[[1,1]]},{"name":"PEX10","data":[[2,55]]},{"name":"PEX14","data":[[2,7]]},{"name":"PEX26","data":[[2,99]]},{"name":"PFAS","data":[[2,2]]},{"name":"PFDN2","data":[[2,3]]},{"name":"PFKFB4","data":[[2,46]]},{"name":"PGAP2","data":[[2,59]]},{"name":"PGAP3","data":[[4,184]]},{"name":"PGD","data":[[2,7]]},{"name":"PGM5","data":[[2,98]]},{"name":"PGM5P2","data":[[6,164]]},{"name":"PHACTR1","data":[[2,35]]},{"name":"PHC2","data":[[2,68]]},{"name":"PHF13","data":[[2,55]]},{"name":"PHF21A","data":[[2,160]]},{"name":"PHF3","data":[[2,97]]},{"name":"PHF7","data":[[2,5]]},{"name":"PHIP","data":[[2,24]]},{"name":"PHRF1","data":[[1,2]]},{"name":"PI15","data":[[2,155]]},{"name":"PI4KA","data":[[2,99]]},{"name":"PI4KAP1","data":[[2,99]]},{"name":"PI4KAP2","data":[[2,99]]},{"name":"PI4KB","data":[[2,6]]},{"name":"PIAS1","data":[[2,51]]},{"name":"PIBF1","data":[[1,1]]},{"name":"PIGG","data":[[2,23]]},{"name":"PIGQ","data":[[2,25]]},{"name":"PIGV","data":[[12,114]]},{"name":"PIGX","data":[[2,57]]},{"name":"PIGZ","data":[[2,57]]},{"name":"PIK3C2G","data":[[2,31]]},{"name":"PIK3CA","data":[[61,771]]},{"name":"PIK3CB","data":[[3,5]]},{"name":"PIK3CD","data":[[2,7]]},{"name":"PIK3CG","data":[[1,1]]},{"name":"PIK3R1","data":[[20,167]]},{"name":"PIK3R2","data":[[6,6]]},{"name":"PIK3R5","data":[[5,8]]},{"name":"PIM1","data":[[1,1]]},{"name":"PINK1","data":[[2,7]]},{"name":"PIP5KL1","data":[[2,70]]},{"name":"PITHD1","data":[[2,6]]},{"name":"PIWIL1","data":[[2,38]]},{"name":"PKLR","data":[[2,80]]},{"name":"PKP3","data":[[5,118]]},{"name":"PLCB4","data":[[1,3]]},{"name":"PLCD1","data":[[2,5]]},{"name":"PLCE1","data":[[2,2]]},{"name":"PLCG1","data":[[1,3]]},{"name":"PLCL1","data":[[2,63]]},{"name":"PLCL2","data":[[2,5]]},{"name":"PLEKHA6","data":[[4,231]]},{"name":"PLEKHG2","data":[[2,86]]},{"name":"PLEKHG4B","data":[[4,19]]},{"name":"PLEKHH3","data":[[2,5]]},{"name":"PLEKHM2","data":[[2,7]]},{"name":"PLEKHN1","data":[[2,55]]},{"name":"PLEKHO1","data":[[2,25]]},{"name":"PLGRKT","data":[[2,51]]},{"name":"PLK4","data":[[1,1]]},{"name":"PLOD1","data":[[2,7]]},{"name":"PLOD3","data":[[2,64]]},{"name":"PLXNA3","data":[[2,126]]},{"name":"PLXNB1","data":[[3,47]]},{"name":"PMS2","data":[[1,1]]},{"name":"PNLIP","data":[[2,93]]},{"name":"PNLIPRP3","data":[[2,98]]},{"name":"PNMT","data":[[4,261]]},{"name":"PNRC2","data":[[2,6]]},{"name":"POGZ","data":[[2,6]]},{"name":"POLA2","data":[[2,77]]},{"name":"POLB","data":[[2,151]]},{"name":"POLQ","data":[[4,30]]},{"name":"POLR2A","data":[[3,11]]},{"name":"POLR3E","data":[[2,25]]},{"name":"POLR3K","data":[[2,25]]},{"name":"POM121L4P","data":[[2,99]]},{"name":"POSTN","data":[[3,120]]},{"name":"POTEG","data":[[4,155]]},{"name":"POTEH","data":[[2,60]]},{"name":"POTEM","data":[[2,59]]},{"name":"POU4F2","data":[[2,7]]},{"name":"PPAP2C","data":[[2,19]]},{"name":"PPARA","data":[[2,18]]},{"name":"PPARG","data":[[2,6]]},{"name":"PPFIA1","data":[[2,30]]},{"name":"PPIL2","data":[[2,99]]},{"name":"PPM1D","data":[[2,2]]},{"name":"PPM1M","data":[[2,5]]},{"name":"PPP1R12A","data":[[2,3]]},{"name":"PPP1R12B","data":[[2,3]]},{"name":"PPP1R8","data":[[2,7]]},{"name":"PPP2R1A","data":[[9,19]]},{"name":"PPP2R5B","data":[[2,77]]},{"name":"PPP2R5C","data":[[2,44]]},{"name":"PPP3CC","data":[[2,23]]},{"name":"PPP6C","data":[[2,61]]},{"name":"PPP6R2","data":[[2,16]]},{"name":"PQLC1","data":[[12,253]]},{"name":"PQLC2","data":[[2,7]]},{"name":"PRB2","data":[[4,113]]},{"name":"PRDM2","data":[[5,57]]},{"name":"PRDM4","data":[[2,69]]},{"name":"PRDM7","data":[[2,43]]},{"name":"PRELID1","data":[[2,24]]},{"name":"PREX2","data":[[2,96]]},{"name":"PRG4","data":[[4,95]]},{"name":"PRIM2","data":[[2,123]]},{"name":"PRKAA1","data":[[1,3]]},{"name":"PRKAB1","data":[[2,154]]},{"name":"PRKACA","data":[[1,1]]},{"name":"PRKAR1A","data":[[2,3]]},{"name":"PRKCD","data":[[4,18]]},{"name":"PRKCI","data":[[2,148]]},{"name":"PRKCZ","data":[[2,55]]},{"name":"PRKDC","data":[[1,1]]},{"name":"PRODH","data":[[2,99]]},{"name":"PROS1","data":[[4,101]]},{"name":"PROSER1","data":[[1,1]]},{"name":"PROX1","data":[[4,84]]},{"name":"PRPF3","data":[[2,37]]},{"name":"PRPF40B","data":[[1,7]]},{"name":"PRPF6","data":[[2,38]]},{"name":"PRPF8","data":[[1,1]]},{"name":"PRR14L","data":[[1,1]]},{"name":"PRR20A","data":[[1,1]]},{"name":"PRR20B","data":[[1,1]]},{"name":"PRR20C","data":[[1,1]]},{"name":"PRR20D","data":[[1,1]]},{"name":"PRR20E","data":[[1,1]]},{"name":"PRR23B","data":[[2,101]]},{"name":"PRSS1","data":[[2,24]]},{"name":"PRSS48","data":[[2,60]]},{"name":"PSG11","data":[[2,108]]},{"name":"PSG2","data":[[4,206]]},{"name":"PSG4","data":[[2,57]]},{"name":"PSG6","data":[[2,26]]},{"name":"PSG8","data":[[2,55]]},{"name":"PSIP1","data":[[4,47]]},{"name":"PSMB4","data":[[4,30]]},{"name":"PSMD11","data":[[2,23]]},{"name":"PSMD13","data":[[6,122]]},{"name":"PSMD6","data":[[2,5]]},{"name":"PSME3","data":[[2,6]]},{"name":"PSME4","data":[[2,18]]},{"name":"PTBP1","data":[[4,112]]},{"name":"PTCH1","data":[[3,6]]},{"name":"PTCHD2","data":[[2,7]]},{"name":"PTDSS2","data":[[4,64]]},{"name":"PTEN","data":[[48,863]]},{"name":"PTGES2","data":[[2,70]]},{"name":"PTH1R","data":[[3,6]]},{"name":"PTP4A1","data":[[4,196]]},{"name":"PTPN11","data":[[5,27]]},{"name":"PTPN13","data":[[2,34]]},{"name":"PTPN14","data":[[2,2]]},{"name":"PTPN23","data":[[3,6]]},{"name":"PTPN4","data":[[2,146]]},{"name":"PTPRD","data":[[8,269]]},{"name":"PTPRQ","data":[[2,39]]},{"name":"PTRH1","data":[[2,70]]},{"name":"PUM2","data":[[2,84]]},{"name":"PUS1","data":[[2,62]]},{"name":"PUSL1","data":[[2,55]]},{"name":"PVRL4","data":[[2,3]]},{"name":"PVT1","data":[[4,55]]},{"name":"PYHIN1","data":[[6,338]]},{"name":"QARS","data":[[2,5]]},{"name":"QKI","data":[[6,103]]},{"name":"QRICH1","data":[[2,5]]},{"name":"QSER1","data":[[2,150]]},{"name":"RAB11FIP3","data":[[2,25]]},{"name":"RAB24","data":[[2,14]]},{"name":"RAB3IP","data":[[2,3]]},{"name":"RAB40C","data":[[2,25]]},{"name":"RAB5A","data":[[2,5]]},{"name":"RABL2B","data":[[2,16]]},{"name":"RAC1","data":[[9,41]]},{"name":"RAD18","data":[[2,5]]},{"name":"RAD21","data":[[2,7]]},{"name":"RAD50","data":[[1,1]]},{"name":"RAD51B","data":[[8,104]]},{"name":"RAD51C","data":[[4,32]]},{"name":"RAD51D","data":[[2,30]]},{"name":"RAD52","data":[[2,79]]},{"name":"RAD54L2","data":[[1,1]]},{"name":"RAF1","data":[[3,8]]},{"name":"RAG1","data":[[2,71]]},{"name":"RAI1","data":[[1,1]]},{"name":"RALGAPA1","data":[[2,81]]},{"name":"RALGPS1","data":[[2,70]]},{"name":"RANBP1","data":[[2,99]]},{"name":"RANBP2","data":[[2,57]]},{"name":"RANGRF","data":[[1,1]]},{"name":"RAP1GAP","data":[[2,7]]},{"name":"RAPGEF6","data":[[1,1]]},{"name":"RARG","data":[[2,60]]},{"name":"RARRES3","data":[[2,20]]},{"name":"RASA1","data":[[9,77]]},{"name":"RASA3","data":[[2,55]]},{"name":"RASAL3","data":[[2,51]]},{"name":"RASSF1","data":[[3,5]]},{"name":"RASSF7","data":[[3,78]]},{"name":"RB1","data":[[26,259]]},{"name":"RBBP7","data":[[2,90]]},{"name":"RBFA","data":[[12,253]]},{"name":"RBFOX1","data":[[1,1]]},{"name":"RBL2","data":[[2,2]]},{"name":"RBM10","data":[[1,1]]},{"name":"RBM11","data":[[2,61]]},{"name":"RBM15B","data":[[3,6]]},{"name":"RBM23","data":[[2,69]]},{"name":"RBM27","data":[[1,1]]},{"name":"RBM5","data":[[3,6]]},{"name":"RBM6","data":[[6,210]]},{"name":"RBMX","data":[[1,2]]},{"name":"RBP1","data":[[1,2]]},{"name":"RBP7","data":[[2,7]]},{"name":"RBPJ","data":[[2,18]]},{"name":"RCBTB2","data":[[1,1]]},{"name":"RCC2","data":[[2,7]]},{"name":"REEP6","data":[[2,28]]},{"name":"REG1A","data":[[4,160]]},{"name":"REG3A","data":[[4,206]]},{"name":"REG3G","data":[[2,95]]},{"name":"REL","data":[[2,11]]},{"name":"RELA","data":[[2,77]]},{"name":"RELL2","data":[[2,33]]},{"name":"RELN","data":[[2,5]]},{"name":"REPS2","data":[[2,90]]},{"name":"RER1","data":[[2,55]]},{"name":"RERE","data":[[2,16]]},{"name":"RERG","data":[[2,59]]},{"name":"RET","data":[[11,51]]},{"name":"REV3L","data":[[1,1]]},{"name":"RFC3","data":[[2,63]]},{"name":"RFT1","data":[[2,5]]},{"name":"RFTN1","data":[[2,5]]},{"name":"RFX5","data":[[2,6]]},{"name":"RFX6","data":[[1,1]]},{"name":"RGS18","data":[[2,136]]},{"name":"RGS19","data":[[2,38]]},{"name":"RHBDD3","data":[[2,185]]},{"name":"RHBDF1","data":[[2,25]]},{"name":"RHBDL1","data":[[2,25]]},{"name":"RHCE","data":[[2,6]]},{"name":"RHD","data":[[2,6]]},{"name":"RHOA","data":[[8,18]]},{"name":"RHOBTB2","data":[[2,23]]},{"name":"RHOT1","data":[[1,4]]},{"name":"RHOT2","data":[[2,25]]},{"name":"RHPN2","data":[[2,63]]},{"name":"RIC8A","data":[[6,122]]},{"name":"RICTOR","data":[[5,14]]},{"name":"RIMBP3B","data":[[2,22]]},{"name":"RIPK4","data":[[2,30]]},{"name":"RNASEH2B","data":[[3,40]]},{"name":"RNASEH2C","data":[[2,77]]},{"name":"RNF123","data":[[3,6]]},{"name":"RNF14","data":[[1,1]]},{"name":"RNF144A","data":[[2,96]]},{"name":"RNF186","data":[[2,7]]},{"name":"RNF207","data":[[3,38]]},{"name":"RNF213","data":[[1,1]]},{"name":"RNF216","data":[[1,1]]},{"name":"RNF43","data":[[4,6]]},{"name":"RNH1","data":[[1,2]]},{"name":"RNMTL1","data":[[1,1]]},{"name":"RNU4ATAC","data":[[2,93]]},{"name":"ROS1","data":[[3,10]]},{"name":"RP1L1","data":[[2,26]]},{"name":"RPA2","data":[[2,7]]},{"name":"RPH3AL","data":[[1,1]]},{"name":"RPL10","data":[[2,5]]},{"name":"RPL10L","data":[[4,261]]},{"name":"RPL11","data":[[2,6]]},{"name":"RPL13","data":[[4,60]]},{"name":"RPL15","data":[[2,5]]},{"name":"RPL22","data":[[11,218]]},{"name":"RPL23AP53","data":[[4,81]]},{"name":"RPL27","data":[[2,6]]},{"name":"RPL5","data":[[2,32]]},{"name":"RPP14","data":[[2,5]]},{"name":"RPRD2","data":[[2,37]]},{"name":"RPS15","data":[[2,27]]},{"name":"RPS16","data":[[2,86]]},{"name":"RPS5","data":[[2,18]]},{"name":"RPS6KA1","data":[[2,68]]},{"name":"RPS6KA3","data":[[2,37]]},{"name":"RPS6KA6","data":[[2,155]]},{"name":"RPS6KB1","data":[[4,27]]},{"name":"RPSA","data":[[2,5]]},{"name":"RPTN","data":[[2,45]]},{"name":"RPTOR","data":[[3,39]]},{"name":"RQCD1","data":[[2,61]]},{"name":"RREB1","data":[[2,26]]},{"name":"RRN3P3","data":[[2,25]]},{"name":"RSC1A1","data":[[2,7]]},{"name":"RSG1","data":[[2,7]]},{"name":"RSPO2","data":[[4,7]]},{"name":"RSPO3","data":[[2,6]]},{"name":"RTEL1","data":[[2,38]]},{"name":"RTN1","data":[[2,100]]},{"name":"RUNDC1","data":[[2,6]]},{"name":"RUNX1","data":[[6,61]]},{"name":"RUNX1T1","data":[[2,56]]},{"name":"RUNX2","data":[[2,24]]},{"name":"RUNX3","data":[[2,6]]},{"name":"RXRA","data":[[3,14]]},{"name":"RXRB","data":[[2,3]]},{"name":"RXRG","data":[[1,3]]},{"name":"RYBP","data":[[2,74]]},{"name":"RYR1","data":[[4,41]]},{"name":"RYR2","data":[[8,47]]},{"name":"RYR3","data":[[5,36]]},{"name":"S1PR1","data":[[2,135]]},{"name":"SAC3D1","data":[[2,77]]},{"name":"SACM1L","data":[[2,5]]},{"name":"SACS","data":[[1,1]]},{"name":"SALL1","data":[[2,71]]},{"name":"SAMD10","data":[[2,38]]},{"name":"SAMD4B","data":[[2,86]]},{"name":"SAT2","data":[[1,1]]},{"name":"SATB1","data":[[3,11]]},{"name":"SATB2","data":[[2,110]]},{"name":"SAV1","data":[[3,19]]},{"name":"SBF1","data":[[2,16]]},{"name":"SBNO2","data":[[4,37]]},{"name":"SCAF4","data":[[1,1]]},{"name":"SCAMP3","data":[[2,80]]},{"name":"SCAP","data":[[3,6]]},{"name":"SCN10A","data":[[1,1]]},{"name":"SCN11A","data":[[1,1]]},{"name":"SCN2A","data":[[2,23]]},{"name":"SCN4A","data":[[2,61]]},{"name":"SCN5A","data":[[3,6]]},{"name":"SCN7A","data":[[2,102]]},{"name":"SCN9A","data":[[2,41]]},{"name":"SCNN1D","data":[[2,55]]},{"name":"SCO2","data":[[2,16]]},{"name":"SCRIB","data":[[2,24]]},{"name":"SCYL1","data":[[2,77]]},{"name":"SDC1","data":[[2,84]]},{"name":"SDCCAG8","data":[[2,4]]},{"name":"SDF2L1","data":[[2,99]]},{"name":"SDF4","data":[[2,55]]},{"name":"SDHA","data":[[7,170]]},{"name":"SDHAP3","data":[[2,56]]},{"name":"SDHB","data":[[2,7]]},{"name":"SDHC","data":[[2,15]]},{"name":"SDK1","data":[[1,1]]},{"name":"SEC13","data":[[2,5]]},{"name":"SEC22C","data":[[2,5]]},{"name":"SEC24A","data":[[1,1]]},{"name":"SEC62","data":[[2,89]]},{"name":"SELK","data":[[2,5]]},{"name":"SEMA3E","data":[[2,40]]},{"name":"SEMA3F","data":[[1,1]]},{"name":"SEMA4B","data":[[4,220]]},{"name":"SEMG1","data":[[2,39]]},{"name":"SENP3","data":[[1,1]]},{"name":"SENP5","data":[[2,57]]},{"name":"SEPN1","data":[[2,6]]},{"name":"SERF1A","data":[[2,63]]},{"name":"SERINC2","data":[[2,30]]},{"name":"SERPINE3","data":[[1,1]]},{"name":"SERPINI1","data":[[2,152]]},{"name":"SETBP1","data":[[4,55]]},{"name":"SETD2","data":[[8,158]]},{"name":"SETDB2","data":[[1,1]]},{"name":"SETMAR","data":[[2,37]]},{"name":"SF1","data":[[4,34]]},{"name":"SF3A1","data":[[2,7]]},{"name":"SF3B1","data":[[9,47]]},{"name":"SFMBT1","data":[[2,5]]},{"name":"SFRP1","data":[[1,1]]},{"name":"SFTA3","data":[[2,63]]},{"name":"SH2B3","data":[[2,6]]},{"name":"SH3BGRL3","data":[[2,6]]},{"name":"SH3GL2","data":[[1,10]]},{"name":"SH3RF2","data":[[1,1]]},{"name":"SH3YL1","data":[[2,31]]},{"name":"SHANK3","data":[[2,16]]},{"name":"SHBG","data":[[1,1]]},{"name":"SHISA5","data":[[2,46]]},{"name":"SHROOM2","data":[[2,55]]},{"name":"SIAH3","data":[[1,1]]},{"name":"SIGIRR","data":[[6,122]]},{"name":"SIN3A","data":[[3,18]]},{"name":"SIPA1","data":[[2,77]]},{"name":"SIPA1L3","data":[[2,46]]},{"name":"SIRT3","data":[[6,122]]},{"name":"SKIL","data":[[2,149]]},{"name":"SKIV2L2","data":[[2,2]]},{"name":"SKP2","data":[[1,1]]},{"name":"SLC10A3","data":[[2,126]]},{"name":"SLC12A2","data":[[2,71]]},{"name":"SLC12A7","data":[[6,164]]},{"name":"SLC13A1","data":[[2,99]]},{"name":"SLC16A1","data":[[1,1]]},{"name":"SLC17A8","data":[[2,101]]},{"name":"SLC20A2","data":[[2,67]]},{"name":"SLC22A5","data":[[1,1]]},{"name":"SLC25A2","data":[[1,1]]},{"name":"SLC25A20","data":[[2,5]]},{"name":"SLC25A25","data":[[2,70]]},{"name":"SLC25A26","data":[[2,5]]},{"name":"SLC25A30","data":[[1,1]]},{"name":"SLC25A33","data":[[2,8]]},{"name":"SLC25A34","data":[[2,7]]},{"name":"SLC25A35","data":[[1,1]]},{"name":"SLC25A38","data":[[2,5]]},{"name":"SLC25A45","data":[[2,77]]},{"name":"SLC26A1","data":[[2,23]]},{"name":"SLC26A3","data":[[2,40]]},{"name":"SLC26A6","data":[[4,51]]},{"name":"SLC27A5","data":[[2,18]]},{"name":"SLC27A6","data":[[1,1]]},{"name":"SLC2A4RG","data":[[2,38]]},{"name":"SLC2A8","data":[[2,70]]},{"name":"SLC30A9","data":[[2,56]]},{"name":"SLC38A8","data":[[2,48]]},{"name":"SLC39A14","data":[[2,23]]},{"name":"SLC43A1","data":[[2,56]]},{"name":"SLC43A3","data":[[2,44]]},{"name":"SLC45A4","data":[[2,24]]},{"name":"SLC4A7","data":[[2,5]]},{"name":"SLC4A9","data":[[1,1]]},{"name":"SLC51A","data":[[2,41]]},{"name":"SLC5A7","data":[[2,30]]},{"name":"SLC6A12","data":[[2,126]]},{"name":"SLC6A13","data":[[4,193]]},{"name":"SLC6A18","data":[[4,153]]},{"name":"SLC6A20","data":[[2,5]]},{"name":"SLC6A3","data":[[4,37]]},{"name":"SLC7A4","data":[[2,99]]},{"name":"SLC9A1","data":[[2,6]]},{"name":"SLC9A3","data":[[2,145]]},{"name":"SLC9A5","data":[[2,58]]},{"name":"SLIT3","data":[[1,1]]},{"name":"SLITRK2","data":[[2,155]]},{"name":"SLITRK4","data":[[2,107]]},{"name":"SLITRK5","data":[[1,5]]},{"name":"SLITRK6","data":[[2,107]]},{"name":"SMAD2","data":[[5,12]]},{"name":"SMAD3","data":[[2,2]]},{"name":"SMAD4","data":[[15,156]]},{"name":"SMARCA4","data":[[7,112]]},{"name":"SMARCB1","data":[[5,25]]},{"name":"SMARCC1","data":[[2,5]]},{"name":"SMC3","data":[[1,1]]},{"name":"SMG1P1","data":[[2,25]]},{"name":"SMIM1","data":[[2,57]]},{"name":"SMN1","data":[[2,63]]},{"name":"SMN2","data":[[2,63]]},{"name":"SMO","data":[[5,9]]},{"name":"SMPDL3B","data":[[2,8]]},{"name":"SMURF1","data":[[4,150]]},{"name":"SMYD3","data":[[2,22]]},{"name":"SNAP29","data":[[2,99]]},{"name":"SNAP91","data":[[2,60]]},{"name":"SNCAIP","data":[[1,1]]},{"name":"SNORA65","data":[[2,70]]},{"name":"SNRK","data":[[2,5]]},{"name":"SNRNP25","data":[[2,25]]},{"name":"SNTG1","data":[[4,178]]},{"name":"SNTG2","data":[[4,146]]},{"name":"SNX15","data":[[2,77]]},{"name":"SNX2","data":[[1,7]]},{"name":"SNX29","data":[[2,72]]},{"name":"SNX29P2","data":[[2,39]]},{"name":"SNX32","data":[[2,77]]},{"name":"SOCS1","data":[[1,3]]},{"name":"SORBS3","data":[[2,23]]},{"name":"SORCS1","data":[[2,71]]},{"name":"SORL1","data":[[1,1]]},{"name":"SOX11","data":[[2,48]]},{"name":"SOX15","data":[[1,1]]},{"name":"SOX17","data":[[4,9]]},{"name":"SOX2","data":[[1,5]]},{"name":"SOX30","data":[[1,1]]},{"name":"SOX4","data":[[2,17]]},{"name":"SOX5","data":[[2,24]]},{"name":"SOX9","data":[[1,1]]},{"name":"SP4","data":[[2,68]]},{"name":"SPAG16","data":[[2,61]]},{"name":"SPANXN2","data":[[2,114]]},{"name":"SPANXN5","data":[[2,60]]},{"name":"SPATA16","data":[[2,60]]},{"name":"SPATA18","data":[[2,112]]},{"name":"SPATA20","data":[[2,152]]},{"name":"SPATA2L","data":[[4,60]]},{"name":"SPATA33","data":[[4,60]]},{"name":"SPATA41","data":[[2,21]]},{"name":"SPATC1L","data":[[2,33]]},{"name":"SPCS1","data":[[2,5]]},{"name":"SPEN","data":[[5,10]]},{"name":"SPERT","data":[[1,1]]},{"name":"SPG20","data":[[2,154]]},{"name":"SPG7","data":[[4,60]]},{"name":"SPHKAP","data":[[4,110]]},{"name":"SPINK5","data":[[1,1]]},{"name":"SPINT2","data":[[2,51]]},{"name":"SPIRE2","data":[[4,60]]},{"name":"SPOCK1","data":[[1,1]]},{"name":"SPOP","data":[[6,15]]},{"name":"SPOPL","data":[[4,163]]},{"name":"SPRED1","data":[[2,74]]},{"name":"SPRN","data":[[4,161]]},{"name":"SPRR2G","data":[[2,57]]},{"name":"SPRYD7","data":[[3,40]]},{"name":"SPTA1","data":[[2,6]]},{"name":"SPTBN5","data":[[1,1]]},{"name":"SREBF1","data":[[1,3]]},{"name":"SRGAP3","data":[[2,20]]},{"name":"SRM","data":[[2,7]]},{"name":"SRRM1","data":[[2,6]]},{"name":"SRSF10","data":[[2,6]]},{"name":"SRSF2","data":[[5,33]]},{"name":"SS18L2","data":[[2,5]]},{"name":"SSH3","data":[[2,85]]},{"name":"SSSCA1","data":[[2,77]]},{"name":"SSU72","data":[[2,55]]},{"name":"SSUH2","data":[[2,5]]},{"name":"ST6GAL1","data":[[2,125]]},{"name":"ST6GALNAC6","data":[[2,70]]},{"name":"STAB1","data":[[1,1]]},{"name":"STAB2","data":[[3,37]]},{"name":"STAG1","data":[[1,1]]},{"name":"STAG2","data":[[6,59]]},{"name":"STARD3","data":[[2,108]]},{"name":"STARD6","data":[[2,56]]},{"name":"STAT1","data":[[1,1]]},{"name":"STAT3","data":[[1,1]]},{"name":"STAT5B","data":[[2,14]]},{"name":"STC1","data":[[1,2]]},{"name":"STK11","data":[[11,238]]},{"name":"STK19","data":[[1,1]]},{"name":"STK3","data":[[2,2]]},{"name":"STMN3","data":[[2,38]]},{"name":"STOML3","data":[[1,1]]},{"name":"STPG1","data":[[2,6]]},{"name":"STUB1","data":[[2,25]]},{"name":"STX12","data":[[2,7]]},{"name":"STX19","data":[[2,64]]},{"name":"STXBP1","data":[[2,70]]},{"name":"SUCLA2","data":[[1,1]]},{"name":"SUFU","data":[[2,5]]},{"name":"SUGT1","data":[[1,1]]},{"name":"SULT1B1","data":[[2,40]]},{"name":"SUPT5H","data":[[2,86]]},{"name":"SUV39H1","data":[[1,1]]},{"name":"SYCE1","data":[[4,161]]},{"name":"SYCP1","data":[[2,151]]},{"name":"SYF2","data":[[2,6]]},{"name":"SYNE1","data":[[1,1]]},{"name":"SYNE2","data":[[1,1]]},{"name":"SYNGR1","data":[[2,19]]},{"name":"SYNJ1","data":[[1,1]]},{"name":"SYTL1","data":[[2,7]]},{"name":"SYVN1","data":[[2,77]]},{"name":"SZRD1","data":[[2,7]]},{"name":"SZT2","data":[[1,1]]},{"name":"TADA3","data":[[2,5]]},{"name":"TAF1","data":[[3,6]]},{"name":"TAF1B","data":[[2,23]]},{"name":"TAF1L","data":[[2,71]]},{"name":"TAF4","data":[[2,27]]},{"name":"TAF4B","data":[[2,102]]},{"name":"TAF8","data":[[2,132]]},{"name":"TALDO1","data":[[1,1]]},{"name":"TANC2","data":[[2,2]]},{"name":"TANGO2","data":[[2,99]]},{"name":"TARDBP","data":[[2,7]]},{"name":"TARS2","data":[[2,37]]},{"name":"TARSL2","data":[[2,49]]},{"name":"TAS1R1","data":[[2,55]]},{"name":"TATDN2","data":[[2,5]]},{"name":"TBC1D22A","data":[[2,19]]},{"name":"TBC1D8B","data":[[2,69]]},{"name":"TBL1X","data":[[2,74]]},{"name":"TBL1XR1","data":[[4,51]]},{"name":"TBRG4","data":[[2,2]]},{"name":"TBX1","data":[[2,99]]},{"name":"TBX22","data":[[2,111]]},{"name":"TBX3","data":[[1,4]]},{"name":"TBX4","data":[[2,152]]},{"name":"TCAIM","data":[[2,5]]},{"name":"TCAP","data":[[2,108]]},{"name":"TCEA3","data":[[2,6]]},{"name":"TCEB3","data":[[2,6]]},{"name":"TCERG1","data":[[1,1]]},{"name":"TCF12","data":[[4,133]]},{"name":"TCF25","data":[[3,60]]},{"name":"TCF3","data":[[2,71]]},{"name":"TCF7","data":[[7,13]]},{"name":"TCF7L2","data":[[2,3]]},{"name":"TCP10","data":[[2,29]]},{"name":"TDRD10","data":[[2,5]]},{"name":"TDRD3","data":[[2,2]]},{"name":"TDRP","data":[[4,81]]},{"name":"TECRL","data":[[2,99]]},{"name":"TENM4","data":[[1,1]]},{"name":"TEP1","data":[[2,24]]},{"name":"TERT","data":[[20,179]]},{"name":"TET2","data":[[4,17]]},{"name":"TEX13A","data":[[2,92]]},{"name":"TFDP1","data":[[2,2]]},{"name":"TG","data":[[1,2]]},{"name":"TGFBI","data":[[1,1]]},{"name":"TGFBR1","data":[[2,16]]},{"name":"TGFBR2","data":[[8,187]]},{"name":"TGFBR3","data":[[1,1]]},{"name":"TGIF2","data":[[1,1]]},{"name":"TGIF2LX","data":[[4,124]]},{"name":"THAP4","data":[[4,174]]},{"name":"THAP7","data":[[2,99]]},{"name":"THBS1","data":[[2,75]]},{"name":"THBS3","data":[[2,80]]},{"name":"THEMIS2","data":[[2,7]]},{"name":"THOC7","data":[[2,5]]},{"name":"THRB","data":[[2,5]]},{"name":"THSD1","data":[[1,1]]},{"name":"THSD1P1","data":[[1,1]]},{"name":"THUMPD3","data":[[2,5]]},{"name":"THYN1","data":[[3,25]]},{"name":"TIAM1","data":[[1,1]]},{"name":"TIFAB","data":[[1,1]]},{"name":"TIGD3","data":[[2,77]]},{"name":"TIMM22","data":[[1,1]]},{"name":"TINAG","data":[[2,96]]},{"name":"TJP1","data":[[3,108]]},{"name":"TKT","data":[[2,5]]},{"name":"TKTL2","data":[[2,94]]},{"name":"TLE1","data":[[1,1]]},{"name":"TLR4","data":[[2,149]]},{"name":"TM2D3","data":[[2,49]]},{"name":"TM7SF2","data":[[2,77]]},{"name":"TMA7","data":[[4,51]]},{"name":"TMC4","data":[[2,148]]},{"name":"TMCC1","data":[[2,26]]},{"name":"TMCO4","data":[[2,7]]},{"name":"TMEM110","data":[[2,5]]},{"name":"TMEM115","data":[[2,5]]},{"name":"TMEM126B","data":[[4,59]]},{"name":"TMEM130","data":[[2,59]]},{"name":"TMEM132C","data":[[2,70]]},{"name":"TMEM136","data":[[1,1]]},{"name":"TMEM145","data":[[2,68]]},{"name":"TMEM175","data":[[2,23]]},{"name":"TMEM187","data":[[2,52]]},{"name":"TMEM191A","data":[[2,99]]},{"name":"TMEM201","data":[[2,8]]},{"name":"TMEM222","data":[[2,7]]},{"name":"TMEM41A","data":[[2,141]]},{"name":"TMEM42","data":[[2,5]]},{"name":"TMEM50A","data":[[2,6]]},{"name":"TMEM51","data":[[2,7]]},{"name":"TMEM52","data":[[2,55]]},{"name":"TMEM57","data":[[2,6]]},{"name":"TMEM80","data":[[1,2]]},{"name":"TMEM82","data":[[2,7]]},{"name":"TMEM88","data":[[1,1]]},{"name":"TMF1","data":[[2,5]]},{"name":"TMIE","data":[[2,5]]},{"name":"TMPRSS2","data":[[2,69]]},{"name":"TMTC1","data":[[2,106]]},{"name":"TMUB2","data":[[2,71]]},{"name":"TNFAIP3","data":[[3,6]]},{"name":"TNFRSF10B","data":[[2,23]]},{"name":"TNFRSF10C","data":[[2,23]]},{"name":"TNFRSF18","data":[[2,55]]},{"name":"TNFRSF1B","data":[[2,7]]},{"name":"TNFRSF25","data":[[2,55]]},{"name":"TNFRSF8","data":[[2,7]]},{"name":"TNFSF10","data":[[4,108]]},{"name":"TNKS1BP1","data":[[2,24]]},{"name":"TNR","data":[[2,107]]},{"name":"TOP2B","data":[[2,5]]},{"name":"TOR2A","data":[[2,70]]},{"name":"TP53","data":[[56,376]]},{"name":"TP53BP1","data":[[1,2]]},{"name":"TP53BP2","data":[[1,3]]},{"name":"TP53TG3B","data":[[2,8]]},{"name":"TP63","data":[[1,2]]},{"name":"TPD52L2","data":[[2,38]]},{"name":"TPPP","data":[[5,25]]},{"name":"TPR","data":[[1,2]]},{"name":"TPTE","data":[[5,68]]},{"name":"TPTE2","data":[[6,236]]},{"name":"TPTEP1","data":[[4,96]]},{"name":"TPX2","data":[[3,13]]},{"name":"TRABD","data":[[2,16]]},{"name":"TRAF3","data":[[3,44]]},{"name":"TRAF4","data":[[2,54]]},{"name":"TRAF7","data":[[1,6]]},{"name":"TRAM1L1","data":[[2,152]]},{"name":"TRANK1","data":[[3,6]]},{"name":"TRAPPC1","data":[[1,1]]},{"name":"TRAT1","data":[[4,163]]},{"name":"TREX1","data":[[2,46]]},{"name":"TRHDE","data":[[4,200]]},{"name":"TRIM13","data":[[3,40]]},{"name":"TRIM28","data":[[1,18]]},{"name":"TRIM33","data":[[2,53]]},{"name":"TRIM46","data":[[2,80]]},{"name":"TRIM47","data":[[2,47]]},{"name":"TRIM49","data":[[2,53]]},{"name":"TRIM65","data":[[2,47]]},{"name":"TRIML2","data":[[2,153]]},{"name":"TRIO","data":[[1,1]]},{"name":"TRIOBP","data":[[1,1]]},{"name":"TRIP13","data":[[7,170]]},{"name":"TRIP4","data":[[2,150]]},{"name":"TRMT2A","data":[[2,99]]},{"name":"TRNT1","data":[[2,109]]},{"name":"TRPC4","data":[[3,176]]},{"name":"TRPC7","data":[[1,1]]},{"name":"TRPV6","data":[[2,37]]},{"name":"TRRAP","data":[[7,154]]},{"name":"TSC1","data":[[4,53]]},{"name":"TSC2","data":[[1,5]]},{"name":"TSC22D1","data":[[1,1]]},{"name":"TSEN2","data":[[2,5]]},{"name":"TSFM","data":[[3,141]]},{"name":"TSPAN31","data":[[1,3]]},{"name":"TSPAN4","data":[[1,2]]},{"name":"TSPYL1","data":[[2,23]]},{"name":"TTC16","data":[[2,70]]},{"name":"TTC28","data":[[2,26]]},{"name":"TTC33","data":[[1,3]]},{"name":"TTLL2","data":[[2,137]]},{"name":"TTLL3","data":[[2,5]]},{"name":"TTLL7","data":[[1,1]]},{"name":"TTN","data":[[4,10]]},{"name":"TUBA3FP","data":[[2,99]]},{"name":"TUBB2A","data":[[2,16]]},{"name":"TUBB2B","data":[[2,16]]},{"name":"TUBB3","data":[[1,17]]},{"name":"TUBB8","data":[[2,39]]},{"name":"TUBD1","data":[[2,21]]},{"name":"TUBG1","data":[[1,5]]},{"name":"TUBG2","data":[[1,5]]},{"name":"TUBGCP2","data":[[2,44]]},{"name":"TUBGCP6","data":[[2,16]]},{"name":"TUSC2","data":[[2,5]]},{"name":"TUSC3","data":[[4,191]]},{"name":"TWF2","data":[[2,5]]},{"name":"TXLNG","data":[[2,90]]},{"name":"TXNDC15","data":[[1,1]]},{"name":"TXNDC8","data":[[2,8]]},{"name":"TXNL4A","data":[[11,253]]},{"name":"TXNRD2","data":[[2,99]]},{"name":"U2AF1","data":[[4,23]]},{"name":"U2AF2","data":[[2,7]]},{"name":"UBA3","data":[[2,5]]},{"name":"UBE2E1","data":[[2,5]]},{"name":"UBE2E2","data":[[2,5]]},{"name":"UBE2J2","data":[[4,113]]},{"name":"UBE2L3","data":[[2,99]]},{"name":"UBE2M","data":[[1,18]]},{"name":"UBE2Q1","data":[[2,75]]},{"name":"UBE2V2","data":[[1,5]]},{"name":"UBE3A","data":[[4,82]]},{"name":"UBE4B","data":[[1,7]]},{"name":"UBIAD1","data":[[1,7]]},{"name":"UBL3","data":[[1,1]]},{"name":"UBL4A","data":[[2,126]]},{"name":"UBP1","data":[[2,5]]},{"name":"UBR4","data":[[4,10]]},{"name":"UBXN10","data":[[1,7]]},{"name":"UBXN11","data":[[1,6]]},{"name":"UCKL1","data":[[2,38]]},{"name":"UFD1L","data":[[2,99]]},{"name":"UGT2B10","data":[[2,58]]},{"name":"UGT2B28","data":[[2,89]]},{"name":"UGT3A2","data":[[2,94]]},{"name":"ULK4","data":[[4,53]]},{"name":"ULK4P2","data":[[2,78]]},{"name":"ULK4P3","data":[[2,78]]},{"name":"UNC13C","data":[[3,50]]},{"name":"UNC93A","data":[[2,137]]},{"name":"UPF3A","data":[[2,56]]},{"name":"UQCR11","data":[[2,71]]},{"name":"UQCRC1","data":[[1,46]]},{"name":"UQCRC2","data":[[1,25]]},{"name":"URAHP","data":[[3,60]]},{"name":"URI1","data":[[4,156]]},{"name":"USH2A","data":[[1,3]]},{"name":"USP17L2","data":[[2,60]]},{"name":"USP19","data":[[2,5]]},{"name":"USP22","data":[[1,3]]},{"name":"USP29","data":[[2,105]]},{"name":"USP4","data":[[3,6]]},{"name":"USP42","data":[[1,1]]},{"name":"USP48","data":[[1,7]]},{"name":"USP6","data":[[1,1]]},{"name":"USP9X","data":[[2,2]]},{"name":"UST","data":[[2,57]]},{"name":"UTP14C","data":[[2,2]]},{"name":"UTS2","data":[[2,55]]},{"name":"VAMP2","data":[[1,1]]},{"name":"VAMP3","data":[[2,55]]},{"name":"VAT1","data":[[1,6]]},{"name":"VAV2","data":[[6,137]]},{"name":"VCAN","data":[[6,49]]},{"name":"VDAC3","data":[[2,68]]},{"name":"VEGFA","data":[[3,104]]},{"name":"VEGFC","data":[[2,61]]},{"name":"VENTX","data":[[2,44]]},{"name":"VHL","data":[[1,9]]},{"name":"VILL","data":[[2,5]]},{"name":"VIPR2","data":[[2,43]]},{"name":"VMP1","data":[[2,102]]},{"name":"VPRBP","data":[[3,6]]},{"name":"VPS13C","data":[[1,1]]},{"name":"VPS13D","data":[[1,7]]},{"name":"VPS25","data":[[1,5]]},{"name":"VPS26B","data":[[2,23]]},{"name":"VPS33A","data":[[2,52]]},{"name":"VPS36","data":[[1,1]]},{"name":"VPS45","data":[[2,25]]},{"name":"VPS51","data":[[2,77]]},{"name":"VPS53","data":[[1,1]]},{"name":"VPS9D1","data":[[3,60]]},{"name":"VWA1","data":[[2,55]]},{"name":"WASF2","data":[[1,7]]},{"name":"WASF3","data":[[2,153]]},{"name":"WASL","data":[[2,75]]},{"name":"WBP2","data":[[2,47]]},{"name":"WDFY2","data":[[2,2]]},{"name":"WDFY3","data":[[1,2]]},{"name":"WDR24","data":[[2,25]]},{"name":"WDR45B","data":[[2,33]]},{"name":"WDR48","data":[[2,5]]},{"name":"WDR49","data":[[2,153]]},{"name":"WDR55","data":[[1,1]]},{"name":"WDR6","data":[[3,6]]},{"name":"WDR60","data":[[2,43]]},{"name":"WDR64","data":[[2,120]]},{"name":"WDR90","data":[[2,25]]},{"name":"WDTC1","data":[[1,6]]},{"name":"WFIKKN1","data":[[2,25]]},{"name":"WHAMMP2","data":[[3,87]]},{"name":"WHSC1L1","data":[[4,84]]},{"name":"WNK1","data":[[6,232]]},{"name":"WNK4","data":[[1,5]]},{"name":"WNT5A","data":[[2,5]]},{"name":"WRAP53","data":[[1,1]]},{"name":"WRAP73","data":[[2,55]]},{"name":"WSCD2","data":[[2,39]]},{"name":"WT1","data":[[2,19]]},{"name":"WWC1","data":[[1,1]]},{"name":"WWC2","data":[[2,23]]},{"name":"WWC3","data":[[2,42]]},{"name":"WWOX","data":[[13,266]]},{"name":"XBP1","data":[[2,185]]},{"name":"XIRP1","data":[[2,6]]},{"name":"XIRP2","data":[[1,1]]},{"name":"XKR6","data":[[2,66]]},{"name":"XPC","data":[[1,5]]},{"name":"XRCC4","data":[[1,30]]},{"name":"YAP1","data":[[1,3]]},{"name":"YBX2","data":[[1,1]]},{"name":"YDJC","data":[[2,99]]},{"name":"YIF1A","data":[[2,55]]},{"name":"YIF1B","data":[[1,51]]},{"name":"YPEL1","data":[[2,99]]},{"name":"YTHDC2","data":[[1,1]]},{"name":"ZADH2","data":[[2,54]]},{"name":"ZAN","data":[[1,1]]},{"name":"ZBBX","data":[[2,106]]},{"name":"ZBED4","data":[[1,16]]},{"name":"ZBTB17","data":[[1,7]]},{"name":"ZBTB20","data":[[2,8]]},{"name":"ZBTB39","data":[[2,58]]},{"name":"ZBTB4","data":[[1,1]]},{"name":"ZBTB40","data":[[1,6]]},{"name":"ZBTB45","data":[[1,18]]},{"name":"ZBTB48","data":[[2,55]]},{"name":"ZBTB7B","data":[[2,31]]},{"name":"ZC3H13","data":[[2,3]]},{"name":"ZCCHC11","data":[[1,26]]},{"name":"ZCCHC12","data":[[1,16]]},{"name":"ZDHHC11","data":[[2,145]]},{"name":"ZDHHC14","data":[[1,9]]},{"name":"ZDHHC18","data":[[2,19]]},{"name":"ZDHHC3","data":[[1,5]]},{"name":"ZDHHC5","data":[[2,69]]},{"name":"ZEB2","data":[[2,99]]},{"name":"ZFHX3","data":[[7,35]]},{"name":"ZFHX4","data":[[2,2]]},{"name":"ZFP36L1","data":[[2,103]]},{"name":"ZFP36L2","data":[[4,184]]},{"name":"ZFP42","data":[[2,97]]},{"name":"ZFPL1","data":[[2,77]]},{"name":"ZFPM2","data":[[2,49]]},{"name":"ZFYVE28","data":[[2,98]]},{"name":"ZGPAT","data":[[2,38]]},{"name":"ZHX3","data":[[1,24]]},{"name":"ZIC4","data":[[2,101]]},{"name":"ZKSCAN1","data":[[1,5]]},{"name":"ZMAT4","data":[[2,61]]},{"name":"ZMYM3","data":[[2,71]]},{"name":"ZMYND11","data":[[9,231]]},{"name":"ZNF124","data":[[2,146]]},{"name":"ZNF141","data":[[1,23]]},{"name":"ZNF148","data":[[1,2]]},{"name":"ZNF180","data":[[1,34]]},{"name":"ZNF197","data":[[1,5]]},{"name":"ZNF208","data":[[2,154]]},{"name":"ZNF217","data":[[4,160]]},{"name":"ZNF263","data":[[1,6]]},{"name":"ZNF267","data":[[1,13]]},{"name":"ZNF268","data":[[2,65]]},{"name":"ZNF276","data":[[2,60]]},{"name":"ZNF280A","data":[[2,45]]},{"name":"ZNF286A","data":[[1,12]]},{"name":"ZNF287","data":[[2,2]]},{"name":"ZNF292","data":[[2,34]]},{"name":"ZNF300","data":[[1,1]]},{"name":"ZNF324B","data":[[1,18]]},{"name":"ZNF436","data":[[1,6]]},{"name":"ZNF445","data":[[2,6]]},{"name":"ZNF446","data":[[1,18]]},{"name":"ZNF48","data":[[2,151]]},{"name":"ZNF492","data":[[2,125]]},{"name":"ZNF497","data":[[1,18]]},{"name":"ZNF511","data":[[2,44]]},{"name":"ZNF578","data":[[1,24]]},{"name":"ZNF584","data":[[1,18]]},{"name":"ZNF593","data":[[1,6]]},{"name":"ZNF595","data":[[3,83]]},{"name":"ZNF596","data":[[3,81]]},{"name":"ZNF608","data":[[1,1]]},{"name":"ZNF620","data":[[1,5]]},{"name":"ZNF626","data":[[2,152]]},{"name":"ZNF628","data":[[1,22]]},{"name":"ZNF644","data":[[1,1]]},{"name":"ZNF658","data":[[6,206]]},{"name":"ZNF676","data":[[6,322]]},{"name":"ZNF679","data":[[2,61]]},{"name":"ZNF683","data":[[1,12]]},{"name":"ZNF70","data":[[2,46]]},{"name":"ZNF714","data":[[1,36]]},{"name":"ZNF716","data":[[2,57]]},{"name":"ZNF718","data":[[1,23]]},{"name":"ZNF721","data":[[1,23]]},{"name":"ZNF74","data":[[2,99]]},{"name":"ZNF750","data":[[3,54]]},{"name":"ZNF770","data":[[1,30]]},{"name":"ZNF799","data":[[2,28]]},{"name":"ZNF80","data":[[1,99]]},{"name":"ZNF800","data":[[1,75]]},{"name":"ZNF804B","data":[[2,149]]},{"name":"ZNF814","data":[[4,72]]},{"name":"ZNF837","data":[[1,18]]},{"name":"ZNF844","data":[[1,12]]},{"name":"ZNF876P","data":[[1,23]]},{"name":"ZNF878","data":[[2,148]]},{"name":"ZNF98","data":[[5,327]]},{"name":"ZNF99","data":[[2,93]]},{"name":"ZNHIT2","data":[[1,77]]},{"name":"ZNRF3","data":[[5,66]]},{"name":"ZP4","data":[[1,38]]},{"name":"ZRSR2","data":[[1,7]]},{"name":"ZSCAN18","data":[[1,31]]},{"name":"ZSWIM2","data":[[1,97]]},{"name":"ZWINT","data":[[1,153]]},{"name":"ZZEF1","data":[[1,1]]},{"name":"14q","data":[[1,2]]},{"name":"8p","data":[[1,3]]},{"name":"6q","data":[[2,6]]},{"name":"3q27.2","data":[[1,1]]},{"name":"13q21.1","data":[[1,4]]},{"name":"7p22.2","data":[[1,1]]},{"name":"13q21.2","data":[[2,8]]},{"name":"8q22.3","data":[[1,2]]},{"name":"9q34.2","data":[[1,3]]},{"name":"3q26.31","data":[[2,4]]},{"name":"3q27.3","data":[[1,3]]},{"name":"8q23.2","data":[[2,3]]},{"name":"3q26.1","data":[[2,3]]},{"name":"6q26","data":[[1,2]]},{"name":"6p21.1","data":[[2,7]]},{"name":"13q14.13","data":[[2,4]]},{"name":"9q34.12","data":[[1,1]]},{"name":"3q26.32","data":[[1,1]]},{"name":"8q23.3","data":[[1,1]]},{"name":"20q13.13","data":[[1,2]]},{"name":"3q26.33","data":[[1,1]]},{"name":"3q28","data":[[1,3]]},{"name":"13q14.2","data":[[1,1]]},{"name":"20q13.11","data":[[1,3]]},{"name":"3q23","data":[[1,1]]},{"name":"11q13.4","data":[[1,8]]},{"name":"3q27.1","data":[[2,6]]},{"name":"8q22.1","data":[[1,1]]},{"name":"20q13.31","data":[[1,3]]},{"name":"11q13.5","data":[[1,6]]},{"name":"8q24.11","data":[[1,2]]},{"name":"3q26.2","data":[[2,6]]},{"name":"20q13.2","data":[[1,1]]},{"name":"8q22.2","data":[[1,1]]},{"name":"7p12.1","data":[[1,1]]},{"name":"8q23.1","data":[[2,2]]},{"name":"20q13.33","data":[[1,1]]},{"name":"17q24.2","data":[[1,1]]},{"name":"8q24.12","data":[[1,1]]},{"name":"EML4-ALK","data":[[4,9]]},{"name":"BCR-ABL","data":[[1,3]]},{"name":"TMPRSS2-ERG","data":[[1,1]]},{"name":"chr17/7","data":[[1,1]]},{"name":"inv(16)","data":[[2,8]]},{"name":"t(8;21)","data":[[2,8]]},{"name":"t(15;17)","data":[[2,8]]},{"name":"t(9;11)","data":[[1,8]]},{"name":"inv(3)","data":[[2,8]]},{"name":"t(6;9)","data":[[2,27]]},{"name":"FN1-FGFR1","data":[[1,1]]},{"name":"1p/19q","data":[[10,14]]},{"name":"17p","data":[[1,1]]},{"name":"RUNX1-RUNX1T1","data":[[2,27]]},{"name":"CBFB-MYH11","data":[[2,28]]},{"name":"GATA2-MECOM","data":[[2,3]]},{"name":"t(3;3)","data":[[2,24]]},{"name":"CRTC1-CMAML2","data":[[1,1]]},{"name":"11q","data":[[1,2]]},{"name":"5p","data":[[1,1]]},{"name":"BCR-ABL1","data":[[2,2]]},{"name":"RET/PTC","data":[[3,9]]},{"name":"p16","data":[[1,1]]},{"name":"p15","data":[[1,1]]},{"name":"t(1;14)(p22;q32)","data":[[1,2]]},{"name":"t(11;18)(q21;q21)","data":[[2,2]]},{"name":"API2-MALT1","data":[[1,1]]},{"name":"t(14;18)","data":[[1,1]]},{"name":"13q","data":[[2,4]]},{"name":"6p","data":[[1,1]]},{"name":"3p","data":[[1,3]]},{"name":"1p","data":[[1,1]]},{"name":"16q","data":[[1,3]]},{"name":"t(14;11)","data":[[1,1]]},{"name":"1q","data":[[1,1]]},{"name":"t(14;4)","data":[[1,1]]},{"name":"13q22.2","data":[[1,6]]},{"name":"13q21.33","data":[[2,3]]},{"name":"13q21.31","data":[[1,4]]},{"name":"8p22","data":[[2,10]]},{"name":"10q11.21","data":[[1,2]]},{"name":"8p12","data":[[2,6]]},{"name":"8p21.1","data":[[2,7]]},{"name":"8p23.1","data":[[1,3]]},{"name":"7p22.3","data":[[2,4]]},{"name":"8p21.3","data":[[1,5]]},{"name":"15q15.2","data":[[1,1]]},{"name":"16q11.2","data":[[1,1]]},{"name":"9p22.2","data":[[1,1]]},{"name":"15q13.1","data":[[1,1]]},{"name":"13q21.32","data":[[1,1]]},{"name":"13q14.12","data":[[1,2]]},{"name":"13q14.3","data":[[1,2]]},{"name":"DUSP22/IRF4","data":[[2,2]]},{"name":"YWHAE-NUTM2E","data":[[1,1]]},{"name":"YWHAE-NUTM2B","data":[[1,1]]},{"name":"FGFR3-TACC3","data":[[1,1]]},{"name":"FN1-FGF1","data":[[1,1]]},{"name":"DEK-NUP214","data":[[2,3]]},{"name":"FLT3-ITD","data":[[2,19]]},{"name":"CRTC3-CMAML2","data":[[1,1]]},{"name":"RSPO2-RSPO3","data":[[1,2]]},{"name":"ETV6-RUNX1","data":[[1,1]]},{"name":"17p13","data":[[1,1]]},{"name":"PAX8-PPARG","data":[[2,5]]},{"name":"10q","data":[[1,1]]},{"name":"t(14;18)(q32;q21)","data":[[1,2]]},{"name":"IGH-MALT1","data":[[1,1]]},{"name":"7q","data":[[1,1]]},{"name":"3q27","data":[[1,1]]},{"name":"19q","data":[[1,1]]}]; 
							// 	     $scatterPlot("scatterContainer",'Cancer types count and mutual exclusive pairs count for each aberrant gene.',"",'Cancer types count','ME pairs count',false,scatterPlotData);	
								</script>
	                  </div>
                </div> 
              </div>
              
              
              <!-- Tree搜索展示 -->
              <div id="treeDisplay" style="display:none;">
	              <div id="browseDisplay" class="col-md-9 col-sm-9 col-xs-9">
	                    <div class="x_panel">
		                  <div class="x_title">
		                  	<h2><i class="fa fa-table"></i> Search Results</h2>
		                    <ul class="nav navbar-right panel_toolbox">
		                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
		                      </li>
		                    </ul>
		                    <div class="clearfix"></div>
		                  </div>
		                  <div class="x_content">
		                    <br/>
		                  
		                    <div id="ContainerTable"></div>
		                  </div>
	                    </div>  	                
		                <div class="x_panel">
		                  <div class="x_title">
		                  	<h2><i class="fa fa-certificate"></i> Network Display</h2>
		                    <ul class="nav navbar-right panel_toolbox">
		                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
		                      </li>
		                    </ul>
		                    <div class="clearfix"></div>
		                  </div>
		                  <div class="x_content">
		                    <br/>
		      			    <div style="margin-top:20px;font-size:15px;">
								<div style="float: left; width: 70%" id="network">
									<div id="cytoscapeweb" style="width:100%;min-width: 700px; height: 540px;"></div>
								</div>
								<div style="float: left; width: 25%; display: block" id="network_sider">
									<p style="padding-top:30px">
										<B><i class="fa fa-download"></i> Download</B>
									</p>
									<div>
	                					<span  onMouseOut="document.body.style.cursor='auto'" onMouseOver="document.body.style.cursor='pointer'"><a id="png"><span class="glyphicon glyphicon-save"></span>&nbsp;&nbsp;Export as png</a></span><br/>
	                					<span  onMouseOut="document.body.style.cursor='auto'" onMouseOver="document.body.style.cursor='pointer'"><a id="jpg"><span class="glyphicon glyphicon-save"></span>&nbsp;&nbsp;Export as jpg</a></span>
	            					</div>
									<p style="padding-top:20px">
										<B><i class="fa fa-tag"></i> Change Layout</B>
									</p>
									<ol class="styled" style="font-size:15px;width:30px;">
										<li id="circle" onMouseOut="document.body.style.cursor='auto';"
											onMouseOver="document.body.style.cursor='pointer'"><a>circle</a></li>
										<li id="grid" onMouseOut="document.body.style.cursor='auto'"
											onMouseOver="document.body.style.cursor='pointer'"><a>grid</a></li>
										<li id="arbor" onMouseOut="document.body.style.cursor='auto'"
											onMouseOver="document.body.style.cursor='pointer'"><a>arbor</a></li>
										<li id="cola" onMouseOut="document.body.style.cursor='auto'"
											onMouseOver="document.body.style.cursor='pointer'"><a>cola</a></li>
										<li id="cose" onMouseOut="document.body.style.cursor='auto'"
											onMouseOver="document.body.style.cursor='pointer'"><a>cose</a></li>
									</ol>
									<p>
										<B><i class="fa fa-eye"></i> Bird' eye</B>
									</p>
									<div id="containerNavigator">
										
									</div>
								</div>
							</div>
		                  </div>
		               </div> 
	              </div>
            </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-center">
            <strong>Copyright &copy; 2018 College of Bioinformatics Science and Technology, Harbin Medical University</strong> All rights reserved.<span><script type="text/javascript" src="//ra.revolvermaps.com/0/0/3.js?i=0e4hv6i8yu6&amp;b=0&amp;s=21&amp;m=0&amp;cl=ffffff&amp;co=010020&amp;cd=aa0000&amp;v0=60&amp;v1=60&amp;r=1" async="async"></script></span>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>
    <script src="../js/Bootstrap-DataTables-1.10.16/Buttons-1.5.1/js/datatables.buttons.min.js"></script>
    <script src="../js/Bootstrap-DataTables-1.10.16/Buttons-1.5.1/js/buttons.bootstrap.min.js"></script>
    <script src="../js/Bootstrap-DataTables-1.10.16/Buttons-1.5.1/js/buttons.colVis.min.js"></script>
    <script src="../js/Bootstrap-DataTables-1.10.16/Buttons-1.5.1/js/buttons.flash.min.js"></script>
    <script src="../js/Bootstrap-DataTables-1.10.16/Buttons-1.5.1/js/buttons.html5.min.js"></script>
    <script src="../js/Bootstrap-DataTables-1.10.16/Buttons-1.5.1/js/buttons.print.min.js"></script>
    <script src="../js/Bootstrap-DataTables-1.10.16/JSZip-2.5.0/jszip.min.js"></script>
    <script src="../js/Bootstrap-DataTables-1.10.16/pdfmake-0.1.32/pdfmake.min.js"></script>
    <script src="../js/Bootstrap-DataTables-1.10.16/pdfmake-0.1.32/vfs_fonts.js"></script>
    <!-- qtip2 -->
    <script src="../js/jquery-qtip2/jquery.qtip.min.js"></script>
    <!-- Cytoscape -->
    <script type="text/javascript" src="../js/cytoscape/js/cytoscape.min.js"></script>
    <script type="text/javascript" src="../js/cytoscape/js/cytoscape.js"></script>
    <script type="text/javascript" src="../js/cytoscape/js/arbor.js"></script>
    <script type="text/javascript" src="../js/cytoscape/js/cytoscape-arbor.js"></script>
    <script src="https://unpkg.com/webcola/WebCola/cola.min.js"></script>
    <script type="text/javascript" src="../js/cytoscape/js/cytoscape-cola.js"></script>
    <script type="text/javascript" src="../js/cytoscape/js/cytoscape-panzoom.js"></script>
    <script type="text/javascript" src="../js/cytoscape/js/cytoscape-navigator.js"></script>
    <script type="text/javascript" src="../js/cytoscape/js/cytoscape-qtip.js"></script>
    <script type="text/javascript" src="../js/expackages/jquery.cytoscape.js"></script>
    <script type="text/javascript" src="../js/expackages/JsonConvetor.js"></script> 
<%-- 	<script type="text/javascript" src="../js/expackages/scatterPlot.js"></script> --%>
	
	

  </body>
</html>