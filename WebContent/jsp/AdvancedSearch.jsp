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
    <!-- Custom Theme Style -->
    <link href="../css/custom.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/loading.css" type="text/css" media="screen" />
    <!-- datatable Stylesheet-->
    <link rel="stylesheet" href="../js/Bootstrap-DataTables-1.10.16/DataTables-1.10.16/css/dataTables.bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../js/Bootstrap-DataTables-1.10.16/Buttons-1.5.1/css/buttons.bootstrap.min.css" type="text/css">
    <!-- cytoscape Stylesheet-->
    <link rel="stylesheet" href="../js/cytoscape/css/cytoscape.js-panzoom.css" type="text/css">
    <link rel="stylesheet" href="../js/cytoscape/css/cytoscape.js-navigator.css" type="text/css">
    <link href="../css/font-awesome-4.0.3/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <!-- ztree Stylesheet-->
    <link rel="stylesheet" href="../js/zTree/css/metroStyle/metroStyle.css">
    <!-- qtip2 -->
    <link rel="stylesheet" type="text/css" href="../js/jquery-qtip2/jquery.qtip.min.css">
    <!--     select2 -->
    <link rel="stylesheet" href="../js/select2/dist/css/select2.min.css" type="text/css">
      <!-- jQuery -->
    <script src="../js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../js/bootstrap.min.js"></script>
        <!--     select2 -->
    <script type="text/javascript" src="../js/select2/dist/js/select2.min.js"></script>
	<%--<script type="text/javascript" src="../js/select2/dist/js/select2.full.js"></script> --%> <!-- 坑！！！！ 和cytoscape有冲突 -->
    <!-- NProgress -->
<%--     <script src="../js/nprogress.js"></script> --%>
	<script>
 	    var $reset1 = function(){
 	        $("#genes1").val("");     
 	        document.getElementById("diseases1").options.selectedIndex = 0; //select回到初始状态
 	        $('#diseases1').select2();
 	    };
	    var $reset2 = function(){
 	        $("#genes2").val("");
 	       	document.getElementById("genesets2").options.selectedIndex = 0; //select回到初始状态
 	        $("#genesets2").select2();      
 	        document.getElementById("diseases2").options.selectedIndex = 0; //select回到初始状态
 	        $('#diseases2').select2();
 	    };  
    	var $AdvSearch = function(){
    		var genes = $("#genes1").val();
    		var diseases = $("#diseases1").val();
            if(genes == "" && diseases == "All"){
            	alert("you did not input genes");
            }else{
            	$.ajax({
            		type: 'POST',
            		dataType:'json',
            		data: {
            			genes:genes,
            			diseases:diseases
            		},
            		url: 'Memain!AdvancedSearch',
            		beforeSend:function(){
            			$("#fuzzy").css("display","block");
            			$("#loading").css("display","block");
            			if(window.cy){
	        	    		cy.destroy();
	        	    		$(".container.body").nextAll().remove();
	        	    	}	
            		},
            		success:function(returnMsg){
            			$("#fuzzy").css("display","none");
        			    $("#loading").css("display","none");
        			    $("#noResult").hide();
        			    var ResultTable = returnMsg.resultTable;//鏉╂瑦妲告稉锟芥稉顏勭摟缁楋缚瑕�
        			    var JSONObject = JSON.parse(ResultTable);//鏉╂瑦妲告稉锟芥稉鐙玈ON鐎电钖� string鏉炵惙son
        			    if(JSONObject.length > 0){  //濡傛灉鏈夋暟鎹�
        			    	$("#ContainerDataTable").empty();
            			    $("#ContainerDataTable").html('<table id="TestTable" class="table table-striped table-bordered table-hover" style="width:100%;"><thead><tr><th>Tissue Origin</th><th>Cancer Type</th><th>Subtype</th><th>Gene A</th><th>Aberrance TypeA</th><th>Gene B</th><th>Aberrance TypeB</th><th>Source</th><th>Details</th></tr></thead><tbody></tbody></table>');
            			    for(var i = 0;i<JSONObject.length;i++){
            			    	$("#TestTable tbody").append("<tr><td>"+JSONObject[i].tissueorigin+"</td><td>"+JSONObject[i].cancertype+"</td><td>"+JSONObject[i].subtype+"</td><td>"+JSONObject[i].genename1+"</a></td><td>"+JSONObject[i].aberrancetype1+"</td><td>"+JSONObject[i].genename2+"</td><td>"+JSONObject[i].aberrancetype2+"</td><td>"+JSONObject[i].evidence+"</td><td><a target='_blank' href='Memain!DetailSearch?id="+JSONObject[i].mainid+"'><i class='fa fa-external-link'></i> Details</a></td></tr>");
            			    }
            			    $("#TestTable").DataTable({
            				    dom: '<"top"Bf>rt<"bottom"lp><"clear">',  //B浠ｈ〃button锛宖浠ｈ〃filter input锛宭浠ｈ〃length changing input control p浠ｈ〃pagination control
            					buttons: [
            						  'copy', 'csv', 'excel', 'pdf', 'print'
            				    ],
            				});
            			    $("#AdvResult").css("display","block");
            			    if(returnMsg.inputNodes != null){
            			    	var edges = $changeEdges(JSON.parse(returnMsg.inputNodes),JSON.parse(returnMsg.edges),"#CD853F","dashed");
            			    	var nodes = $changeNodes(JSON.parse(returnMsg.inputNodes),JSON.parse(returnMsg.nodes),"star","#F5A45D");  //rgb(255,71,71)
            			    	$("#containerNavigator").empty();
     	        			    $("#containerNavigator").append('<div id="navigator" style="width:350px;height:150px;margin-top:30px;position:relative;overflow:hidden;border: 1px solid #000;z-index: 99999;"></div>');
            			    	$networkVisualization(nodes,edges); 
            			    	window.location.href = "#AdvResult";
            			    }else{
                			    $("#containerNavigator").empty();
                			    $("#containerNavigator").append('<div id="navigator" style="width:350px;height:150px;margin-top:30px;position:relative;overflow:hidden;border: 1px solid #000;z-index: 99999;"></div>');
            			    	$networkVisualization(JSON.parse(returnMsg.nodes),JSON.parse(returnMsg.edges)); 
            			    	window.location.href = "#AdvResult";
            			    };
        			    }else{ //濡傛灉娌℃湁鏁版嵁
        			    	//alert("shijian");
        			    	$("#AdvResult").hide();
        			    	$("#noResult").show();
        			    }   			               			
            		},
            		complete:function(){
            			$("#fuzzy").css("display","none");
            			$("#loading").css("display","none");
            		},
            		error:function(){
            			alert("error");
            		}
            	});
            }
    	};
        var $AdvInnerSearch = function(){
        	var genes = $("#genes2").val();
    		var diseases = $("#diseases2").val();
    		var arrayGenes = genes.split(",");
            if(genes == "" || arrayGenes.length <= 1){
            	alert("the number of genes you input must be more than one;");
            }else{
            	$.ajax({
            		type: 'POST',
            		dataType:'json',
            		data: {
            			genes:genes,
            			diseases:diseases
            		},
            		url: 'Memain!AdvancedInnerSearch',
            		beforeSend:function(){
            			$("#fuzzy").css("display","block");
            			$("#loading").css("display","block");
            			if(window.cy){
	        	    		cy.destroy();
	        	    		$(".container.body").nextAll().remove();
	        	    	}	
            		},
            		success:function(returnMsg){
            			$("#fuzzy").css("display","none");
        			    $("#loading").css("display","none");
        			    $("#noResult").hide();
        			    var ResultTable = returnMsg.resultTable;//杩欐槸涓�涓瓧绗︿覆
        			    var JSONObject = JSON.parse(ResultTable);//杩欐槸涓�涓狫SON瀵硅薄 string杞琷son
        			    if(JSONObject.length > 0){  //如果有数据
        			    	$("#AdvResult").show();
        			    	$("#ContainerDataTable").empty();
            			    $("#ContainerDataTable").html('<table id="TestTable" class="table table-striped table-bordered table-hover" style="width:100%;"><thead><tr><th>Tissue Origin</th><th>Cancer Type</th><th>Subtype</th><th>Gene A</th><th>Aberrance TypeA</th><th>Gene B</th><th>Aberrance TypeB</th><th>Source</th><th>Details</th></tr></thead><tbody></tbody></table>');
            			    for(var i = 0;i<JSONObject.length;i++){
            			    	$("#TestTable tbody").append("<tr><td>"+JSONObject[i].tissueorigin+"</td><td>"+JSONObject[i].cancertype+"</td><td>"+JSONObject[i].subtype+"</td><td>"+JSONObject[i].genename1+"</a></td><td>"+JSONObject[i].aberrancetype1+"</td><td>"+JSONObject[i].genename2+"</td><td>"+JSONObject[i].aberrancetype2+"</td><td>"+JSONObject[i].evidence+"</td><td><a target='_blank' href='Memain!DetailSearch?id="+JSONObject[i].mainid+"'><i class='fa fa-external-link'></i> Details</a></td></tr>");
            			    }
            			    $("#TestTable").DataTable({
            				    dom: '<"top"Bf>rt<"bottom"lp><"clear">',  //B代表button，f代表filter input，l代表length changing input control p代表pagination control
            					buttons: [
            						  'copy', 'csv', 'excel', 'pdf', 'print'
            				    ],
            				});
            			    $("#containerNavigator").empty();
	        			    $("#containerNavigator").append('<div id="navigator" style="width:350px;height:150px;margin-top:30px;position:relative;overflow:hidden;border: 1px solid #000;z-index: 99999;"></div>');
               			    $networkVisualization(JSON.parse(returnMsg.nodes),JSON.parse(returnMsg.edges)); 
           			    	window.location.href = "#AdvResult";
        			    }else{ //如果没有数据
        			    	$("#AdvResult").hide();
        			    	$("#noResult").show();
        			    }   			               			
            		},
            		complete:function(){
            			$("#fuzzy").css("display","none");
            			$("#loading").css("display","none");
            		},
            		error:function(){
            			alert("error");
            		}
            	});
            }
        };
    </script>
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
<div class="row" >
              <div class="col-md-6 col-sm-6 col-xs-6">
                <div class="x_panel" >
                  <div class="x_title">
                  	<h2><i class="fa fa-search"></i> Search External Relations</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                   <br />
                    <form id="demo-form1" method="post" action="" data-parsley-validate class="form-horizontal form-label-left" style="font-size:14px;">

                      <div class="form-group" style="margin-top:20px;font-size:16px;">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Gene or Gene set<span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <textarea rows="2" id="genes1" name="genes"  data-toggle="tooltip" placeholder="NFE2L2,PIK3CA,ERCC2" data-placement="top" title="You can search for gene symbol like 'MTOR,RB1' divided by ','" style="width:556px;" class="form-control"></textarea>
                        </div>
                      </div>
                      <div class="form-group" style="margin-top:20px;font-size:16px;">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Diseases</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <select id="diseases1" class="select2_group form-control" name="diseases">
<!--                               <option value="All">All</option> -->
<option value="Adrenocortical Adenoma">Adrenocortical Adenoma</option>
<option value="Adrenocortical Carcinoma">Adrenocortical Carcinoma</option>
<option value="Ameloblastoma">Ameloblastoma</option>
<option value="Anaplastic Thyroid Cancer">Anaplastic Thyroid Cancer</option>
<option value="Bladder Adenocarcinoma">Bladder Adenocarcinoma</option>
<option value="Bladder Urothelial Carcinoma">Bladder Urothelial Carcinoma</option>
<option value="Breast Fibroepithelial Neoplasms">Breast Fibroepithelial Neoplasms</option>
<option value="Malignant Phyllodes Tumor of the Breast">&nbsp;&nbsp;&nbsp;&nbsp;Malignant Phyllodes Tumor of the Breast</option>
<option value="Cancer of Unknown Primary">Cancer of Unknown Primary</option>
<option value="Cervical Adenocarcinoma">Cervical Adenocarcinoma</option>
<option value="Cervical Endometrioid Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Cervical Endometrioid Carcinoma</option>
<option value="Cervical Squamous Cell Carcinoma">Cervical Squamous Cell Carcinoma</option>
<option value="Cholangiocarcinoma">Cholangiocarcinoma</option>
<option value="Intrahepatic Cholangiocarcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Intrahepatic Cholangiocarcinoma</option>
<option value="Chondrosarcoma">Chondrosarcoma</option>
<option value="Mesenchymal Chondrosarcoma">&nbsp;&nbsp;&nbsp;&nbsp;Mesenchymal Chondrosarcoma</option>
<option value="Collecting Duct Renal Cell Carcinoma">Collecting Duct Renal Cell Carcinoma</option>
<option value="Colorectal Adenocarcinoma">Colorectal Adenocarcinoma</option>
<option value="Colon Adenocarcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Colon Adenocarcinoma</option>
<option value="Mucinous Adenocarcinoma of the Colon and Rectum">&nbsp;&nbsp;&nbsp;&nbsp;Mucinous Adenocarcinoma of the Colon and Rectum</option>
<option value="Rectal Adenocarcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Rectal Adenocarcinoma</option>
<option value="Colorectal Precursor Lesion">Colorectal Precursor Lesion</option>
<option value="Conjunctival Melanocytic Tumors">Conjunctival Melanocytic Tumors</option>
<option value="Desmoid/Aggressive Fibromatosis">Desmoid/Aggressive Fibromatosis</option>
<option value="Diffuse Glioma">Diffuse Glioma</option>
<option value="Glioblastoma">&nbsp;&nbsp;&nbsp;&nbsp;Glioblastoma</option>
<option value="Glioblastoma Multiforme">&nbsp;&nbsp;&nbsp;&nbsp;Glioblastoma Multiforme</option>
<option value="Brainstem Glioma">&nbsp;&nbsp;&nbsp;&nbsp;Brainstem Glioma</option>
<option value="Oligodendroglioma">&nbsp;&nbsp;&nbsp;&nbsp;Oligodendroglioma</option>
<option value="High-Grade Glioma">&nbsp;&nbsp;&nbsp;&nbsp;High-Grade Glioma</option>
<option value="Astrocytoma">&nbsp;&nbsp;&nbsp;&nbsp;Astrocytoma</option>
<option value="Anaplastic Astrocytoma">&nbsp;&nbsp;&nbsp;&nbsp;Anaplastic Astrocytoma</option>
<option value="Embryonal Tumor">Embryonal Tumor</option>
<option value="Medulloblastoma with Extensive Nodularity">&nbsp;&nbsp;&nbsp;&nbsp;Medulloblastoma with Extensive Nodularity</option>
<option value="Medulloblastoma">&nbsp;&nbsp;&nbsp;&nbsp;Medulloblastoma</option>
<option value="Encapsulated Glioma">Encapsulated Glioma</option>
<option value="Low-Grade Glioma">&nbsp;&nbsp;&nbsp;&nbsp;Low-Grade Glioma</option>
<option value="Dysembryoplastic Neuroepithelial Tumor">&nbsp;&nbsp;&nbsp;&nbsp;Dysembryoplastic Neuroepithelial Tumor</option>
<option value="Endometrial Carcinoma">Endometrial Carcinoma</option>
<option value="Uterine Endometrioid Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Uterine Endometrioid Carcinoma</option>
<option value="Uterine Carcinosarcoma/Uterine Malignant Mixed Mullerian Tumor">&nbsp;&nbsp;&nbsp;&nbsp;Uterine Carcinosarcoma/Uterine Malignant Mixed Mullerian Tumor</option>
<option value="Esophageal Squamous Cell Carcinoma">Esophageal Squamous Cell Carcinoma</option>
<option value="Esophagogastric Adenocarcinoma">Esophagogastric Adenocarcinoma</option>
<option value="Esophageal Adenocarcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Esophageal Adenocarcinoma</option>
<option value="Stomach Adenocarcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Stomach Adenocarcinoma</option>
<option value="Ewing Sarcoma">Ewing Sarcoma</option>
<option value="Gallbladder Cancer">Gallbladder Cancer</option>
<option value="Gastrointestinal Stromal Tumor">Gastrointestinal Stromal Tumor</option>
<option value="Head and Neck Squamous Cell Carcinoma">Head and Neck Squamous Cell Carcinoma</option>
<option value="Oral Squamous Cell Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Oral Squamous Cell Carcinoma</option>
<option value="Oral Cavity Squamous Cell Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Oral Cavity Squamous Cell Carcinoma</option>
<option value="Oral Tongue Squamous Cell Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Oral Tongue Squamous Cell Carcinoma</option>
<option value="Hepatocellular Carcinoma">Hepatocellular Carcinoma</option>
<option value="Invasive Breast Carcinoma">Invasive Breast Carcinoma</option>
<option value="Breast Invasive Lobular Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Breast Invasive Lobular Carcinoma</option>
<option value="Langerhans Cell Histiocytosi">Langerhans Cell Histiocytosi</option>
<option value="Leiomyosarcoma">Leiomyosarcoma</option>
<option value="Liposarcoma">Liposarcoma</option>
<option value="Myxoid/Round-Cell Liposarcoma">&nbsp;&nbsp;&nbsp;&nbsp;Myxoid/Round-Cell Liposarcoma</option>
<option value="Well-Differentiated Liposarcoma">&nbsp;&nbsp;&nbsp;&nbsp;Well-Differentiated Liposarcoma</option>
<option value="Lung Neuroendocrine Tumor">Lung Neuroendocrine Tumor</option>
<option value="Small Cell Lung Cancer">&nbsp;&nbsp;&nbsp;&nbsp;Small Cell Lung Cancer</option>
<option value="Lymphoid Neoplasm">Lymphoid Neoplasm</option>
<option value="Multiple myeloma">&nbsp;&nbsp;&nbsp;&nbsp;Multiple myeloma</option>
<option value="Diffuse Large B-Cell Lymphoma">&nbsp;&nbsp;&nbsp;&nbsp;Diffuse Large B-Cell Lymphoma</option>
<option value="Extranodal Marginal Zone Lymphoma of Mucosa-Associated Lymphoid Tissue">&nbsp;&nbsp;&nbsp;&nbsp;MALT lymphoma</option>
<option value="Waldenstrom Macroglobulinemia">&nbsp;&nbsp;&nbsp;&nbsp;Waldenstrom Macroglobulinemia</option>
<option value="Anaplastic Large Cell Lymphoma">&nbsp;&nbsp;&nbsp;&nbsp;Anaplastic Large Cell Lymphoma</option>
<option value="Rosai-Dorfman Disease">&nbsp;&nbsp;&nbsp;&nbsp;Rosai-Dorfman Disease</option>
<option value="Angioimmunoblastic T-Cell Lymphoma">&nbsp;&nbsp;&nbsp;&nbsp;Angioimmunoblastic T-Cell Lymphoma</option>
<option value="Marginal Zone Lymphoma">&nbsp;&nbsp;&nbsp;&nbsp;Marginal Zone Lymphoma</option>
<option value="Chronic Lymphocytic Leukemia/Small Lymphocytic Lymphoma">&nbsp;&nbsp;&nbsp;&nbsp;Chronic Lymphocytic Leukemia/Small Lymphocytic Lymphoma</option>
<option value="Non-Hodgkin Lymphoma">&nbsp;&nbsp;&nbsp;&nbsp;Non-Hodgkin Lymphoma</option>
<option value="T-Lymphoblastic Leukemia/Lymphoma">&nbsp;&nbsp;&nbsp;&nbsp;T-Lymphoblastic Leukemia/Lymphoma</option>
<option value="Mantle Cell Lymphoma">&nbsp;&nbsp;&nbsp;&nbsp;Mantle Cell Lymphoma</option>
<option value="Follicular Lymphoma">&nbsp;&nbsp;&nbsp;&nbsp;Follicular Lymphoma</option>
<option value="Medullary Thyroid Cancer">Medullary Thyroid Cancer</option>
<option value="Melanoma">Melanoma</option>
<option value="Cutaneous Melanoma">&nbsp;&nbsp;&nbsp;&nbsp;Cutaneous Melanoma</option>
<option value="Meningothelial Tumor">Meningothelial Tumor</option>
<option value="Meningioma">&nbsp;&nbsp;&nbsp;&nbsp;Meningioma</option>
<option value="Mesothelioma">Mesothelioma</option>
<option value="Metastatic Bladder Cancer">Metastatic Bladder Cancer</option>
<option value="Mucosal Melanoma of the Urethra">Mucosal Melanoma of the Urethra</option>
<option value="Mucosal Melanoma of the Vulva/Vagina">Mucosal Melanoma of the Vulva/Vagina</option>
<option value="Myeloid Neoplasm">Myeloid Neoplasm</option>
<option value="Acute Myeloid Leukemia">&nbsp;&nbsp;&nbsp;&nbsp;Acute Myeloid Leukemia</option>
<option value="Myeloproliferative Neoplasms">&nbsp;&nbsp;&nbsp;&nbsp;Myeloproliferative Neoplasms</option>
<option value="Langerhans Cell Histiocytosis">&nbsp;&nbsp;&nbsp;&nbsp;Langerhans Cell Histiocytosis</option>
<option value="Erdheim-Chester Disease">&nbsp;&nbsp;&nbsp;&nbsp;Erdheim-Chester Disease</option>
<option value="Essential Thrombocythemia">&nbsp;&nbsp;&nbsp;&nbsp;Essential Thrombocythemia</option>
<option value="Primary Myelofibrosis">&nbsp;&nbsp;&nbsp;&nbsp;Primary Myelofibrosis</option>
<option value="Myelodysplastic Syndromes">&nbsp;&nbsp;&nbsp;&nbsp;Myelodysplastic Syndromes</option>
<option value="Chronic Lymphocytic Leukemia/Small Lymphocytic Lymphoma">&nbsp;&nbsp;&nbsp;&nbsp;Chronic Lymphocytic Leukemia/Small Lymphocytic Lymphoma</option>
<option value="T-Cell Acute Lymphoid Leukemia">&nbsp;&nbsp;&nbsp;&nbsp;T-Cell Acute Lymphoid Leukemia</option>
<option value="Chronic Myelomonocytic Leukemia">&nbsp;&nbsp;&nbsp;&nbsp;Chronic Myelomonocytic Leukemia</option>
<option value="Acute Lymphoid Leukemia">&nbsp;&nbsp;&nbsp;&nbsp;Acute Lymphoid Leukemia</option>
<option value="Blastic Plasmacytoid Dendritic Cell Neoplasm">&nbsp;&nbsp;&nbsp;&nbsp;Blastic Plasmacytoid Dendritic Cell Neoplasm</option>
<option value="Systemic Mastocytosis">&nbsp;&nbsp;&nbsp;&nbsp;Systemic Mastocytosis</option>
<option value="Leukemia">&nbsp;&nbsp;&nbsp;&nbsp;Leukemia</option>
<option value="Neuroblastoma">Neuroblastoma</option>
<option value="Non-Anaplastic Thyroid Cancer">Non-Anaplastic Thyroid Cancer</option>
<option value="Nonmuscle Invasive Bladder Cancer">Nonmuscle Invasive Bladder Cancer</option>
<option value="Non-Seminomatous Germ Cell Tumor">Non-Seminomatous Germ Cell Tumor</option>
<option value="Non-Small Cell Lung Cancer">Non-Small Cell Lung Cancer</option>
<option value="Lung Adenocarcinoma">Lung Adenocarcinoma</option>
<option value="Lung Squamous Cell Carcinoma">Lung Squamous Cell Carcinoma</option>
<option value="Lung Adenocarcinom">Lung Adenocarcinom</option>
<option value="Non-Small Cell Lung Cancer">Non-Small Cell Lung Cancer</option>
<option value="Ocular Melanoma">Ocular Melanoma</option>
<option value="Uveal Melanoma">&nbsp;&nbsp;&nbsp;&nbsp;Uveal Melanoma</option>
<option value="Iris Melanoma">&nbsp;&nbsp;&nbsp;&nbsp;Iris Melanoma</option>
<option value="Ovarian Cancer">Ovarian Cancer</option>
<option value="Ovarian Epithelial Tumor">Ovarian Epithelial Tumor</option>
<option value="Clear Cell Ovarian Cancer">&nbsp;&nbsp;&nbsp;&nbsp;Clear Cell Ovarian Cancer</option>
<option value="Low-Grade Serous Ovarian Cancer">&nbsp;&nbsp;&nbsp;&nbsp;Low-Grade Serous Ovarian Cancer</option>
<option value="High-Grade Serous Ovarian Cancer">&nbsp;&nbsp;&nbsp;&nbsp;High-Grade Serous Ovarian Cancer</option>
<option value="Mucinous Ovarian Cancer">&nbsp;&nbsp;&nbsp;&nbsp;Mucinous Ovarian Cancer</option>
<option value="Ovarian Seromucinous Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Ovarian Seromucinous Carcinoma</option>
<option value="Pancancer">Pancancer</option>
<option value="Pancreatic Adenocarcinoma">Pancreatic Adenocarcinoma</option>
<option value="Paraganglioma">Paraganglioma</option>
<option value="Pheochromocytoma">Pheochromocytoma</option>
<option value="Poorly Differentiated Thyroid Cancer">Poorly Differentiated Thyroid Cancer</option>
<option value="Porocarcinoma">Porocarcinoma</option>
<option value="Prostate Adenocarcinoma">Prostate Adenocarcinoma</option>
<option value="Renal Cell Carcinoma">Renal Cell Carcinoma</option>
<option value="Renal Clear Cell Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Renal Clear Cell Carcinoma</option>
<option value="Papillary Renal Cell Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Papillary Renal Cell Carcinoma</option>
<option value="Chromophobe Renal Cell Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Chromophobe Renal Cell Carcinoma</option>
<option value="Clear Cell Renal Cell Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Clear Cell Renal Cell Carcinoma</option>
<option value="Renal Mucinous Tubular Spindle Cell Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Renal Mucinous Tubular Spindle Cell Carcinoma</option>
<option value="Salivary Carcinoma">Salivary Carcinoma</option>
<option value="Salivary Duct Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Salivary Duct Carcinoma</option>
<option value="Mucoepidermoid Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Mucoepidermoid Carcinoma</option>
<option value="Sarcoma">Sarcoma</option>
<option value="Sebaceous Gland Hyperplasia">Sebaceous Gland Hyperplasia</option>
<option value="Sellar Tumor">Sellar Tumor</option>
<option value="Craniopharyngioma">&nbsp;&nbsp;&nbsp;&nbsp;Craniopharyngioma</option>
<option value="Pituitary Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Pituitary Carcinoma</option>
<option value="Pituitary Adenoma">&nbsp;&nbsp;&nbsp;&nbsp;Pituitary Adenoma</option>
<option value="Tenosynovial Giant Cell Tumor Diffuse Type">Tenosynovial Giant Cell Tumor Diffuse Type</option>
<option value="Thymic Epithelial Tumor">Thymic Epithelial Tumor</option>
<option value="Thymoma">&nbsp;&nbsp;&nbsp;&nbsp;Thymoma</option>
<option value="Tubular Adenoma of the Colon">Tubular Adenoma of the Colon</option>
<option value="Urinary Bladder Cancer">Urinary Bladder Cancer</option>
<option value="Uterine Sarcoma/Mesenchymal">Uterine Sarcoma/Mesenchymal</option>
<option value="Uterine Smooth Muscle Tumor">&nbsp;&nbsp;&nbsp;&nbsp;Uterine Smooth Muscle Tumor</option>
<option value="Uterine Leiomyoma">&nbsp;&nbsp;&nbsp;&nbsp;Uterine Leiomyoma</option>
<option value="Well-Differentiated Thyroid Cancer">Well-Differentiated Thyroid Cancer</option>
<option value="Papillary Thyroid Cancer">&nbsp;&nbsp;&nbsp;&nbsp;Papillary Thyroid Cancer</option>
<option value="Follicular Thyroid Cancer">&nbsp;&nbsp;&nbsp;&nbsp;Follicular Thyroid Cancer</option>
<option value="Wilms' Tumor">Wilms' Tumor</option>
                          </select>
	                          <script>
	                 		      $('#diseases1').select2();
	                          </script>
                        </div>
                      </div>
    
                      <div class="ln_solid" style="margin-top:20px;"></div>
                      <div class="form-group" style="margin-top:20px;">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-info" type="button" onclick="$('#genes1').val('NFE2L2,PIK3CA,ERCC2');document.getElementById('diseases1').options.selectedIndex = 5;$('#diseases1').select2();">Demo</button>
						  <button class="btn btn-primary" type="button" onclick="$reset1()">Reset</button>		
                          <button type="button" class="btn btn-success" onclick="$AdvSearch()">Submit</button>
                        </div>
                      </div>
                    </form>
                  </div>
                </div> 
                 
              </div>
              <!-- Note对输入框组的注释 -->
              <div class="col-md-6 col-xs-6 col-xs-6">
                <div class="x_panel">
                  <div class="x_title">
                  	<h2><i class="fa fa-bookmark-o"></i> Notes</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                   <br />
                     <p style="font-size:16px;"><b>Search External Relations Module</b> allows users to search the associated mutually exclusive partners with input genes <a href="Help.jsp#External"><i class="fa fa-key"></i></a>.</p>
			           	  <p style="font-size:16px;"><b>Gene or Gene set:</b> Users can input interesting genes <span style="color:rgb(144,11,9);">(must be less than ten genes)</span> with HGNC gene symbol. The gene set should be separated by commas.</p>
<p style=font-size:16px;"><b>Diseases:</b> Users can select an interesting cancer type. </p>	 
                  </div>
                </div> 
                 
              </div>
            </div>

<div class="row">
            	<div class="col-md-6 col-sm-6 col-xs-6">
            		<div class="x_panel">
                  <div class="x_title">
                  	<h2><i class="fa fa-search"></i> Search Internal Relations</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                   <br />
				   <form id="demo-form2" method="post" action="" data-parsley-validate class="form-horizontal form-label-left" style="font-size:14px;">

                      <div class="form-group" style="font-size:16px;">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Gene set<span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <textarea rows="2" id="genes2" name="genes"  data-toggle="tooltip" placeholder="MTOR,RB1,TP53,PTEN,EGFR" data-placement="top" title="You can search for gene symbol like 'MTOR,RB1' divided by ','"  style="width:557px;" class="form-control col-md-7 col-xs-12"></textarea>
                        </div>
                      </div>
                      <div class="form-group" style="margin-top:20px;font-size:16px;">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Defined Gene Sets</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <select id="genesets2" class="select2_group form-control">
                              <option value="">Select a predefined gene set</option>
                              <option value="EGFR,KRAS,KIT,HRAS,NRAS,FGFR3,NF1,BRAF,FGFR1,ERBB2,IGF1R,ERBB3,RAC1,RAF1,MET,PDGFRA,FLT3,RET,ABL1,FGFR2,MAPK1,RASA1,PTPN11,JAK2,ALK,MAP2K1,ROS1,CBL,ARAF,ERBB4">RTK RAS pathway</option>
                              <option value="KEAP1,NFE2L2,CUL3">Nrf2 pathway</option>
                              <option value="STK11,PPP2R1A,PIK3CA,PIK3R1,PTEN,PIK3R2,AKT1,RPTOR,PIK3CB,INPP4B,RICTOR,AKT2,MTOR,AKT3,TSC1,TSC2">PI3K pathway</option>
                              <option value="SMAD4,SMAD2,ACVR2A,ACVR1B,TGFBR2,SMAD3">TGF beta pathway</option>
                              <option value="CTNNB1,APC,AXIN1,RNF43,TCF7,ZNRF3,AXIN2,TCF7L2,AMER1">Wnt pathway</option>
                              <option value="MYC,MYCN,MGA,MYCL">Myc pathway</option>
                              <option value="TP53,ATM,CDKN2A,MDM2,MDM4,CHEK2">p53 pathway</option>
                              <option value="RB1,CDKN2A,CCND1,E2F3,CCND2,CCND3,CDK4,CDKN1B,CCNE1,CDK6,E2F1,CDKN2B,CDKN1A,CDKN2C">Cell cycle pathway</option>
                              <option value="FAT3,YAP1,FAT1,CRB1,LATS1,DCHS1,FAT4,NF2,FAT2,DCHS2,PTPN14,SAV1,WWC1,STK3,LATS2">Hippo pathway</option>
                              <option value="NOTCH1,FBXW7,CREBBP,ARRDC1,CNTN6,KAT2B,SPEN,KDM5A,MAML3,EP300,NOTCH2,NCOR1,NOV,NCOR2">Notch pathway</option>
                              <option value="EGFR,CDKN1B,ERRFI1,VEGFA,HDLBP,IGFBP1,RBPJ,COL5A1,PKLR,NEDD4L,JUN,B3GALT6,KLF6,DTNA,PRKCA,SLC2A3,MAP3K1,GYS1,GCNT2,IRS2,MYH9,ZNF292,STC1,GPC4,VHL,STC2,NR3C1,TGFBI,CDKN1A,TNFAIP3,CXCR4,PIM1">Hypoxia</option>
                              <option value="CTNNB1,PPARG,NSDHL,ERRFI1,TM7SF2,ABCA2,FBXO6,FDPS,GUSB,TP53INP1">Cholesterol Homeostasis</option>
                              <option value="TSC1,RASA1,SHROOM2,NF1,ATG4B,CDC42EP2,MAP3K11,SAC3D1,ARHGAP4,CEP72,CLASP1,RHOT2,KIF5B,PAFAH1B1,MID1,KIF15,CAPZB,CDC42,KIF1B,WASL,DLG1,ALMS1,CNTROB,TUBD1,PLEKHG2,TUBGCP6,CDC27,TUBGCP2,ARHGEF3,FLNB,NEDD9,ABI1,BRCA2,SMC1A,SMC3,ABL1">Mitotic Spindle</option>
                              <option value="CTNNB1,NOTCH1,CCND2,NCOR2,AXIN1,RBPJ,JAG2,TP53,MYC,HDAC2,PTCH1,HDAC5,DVL2,AXIN2,DKK4,KAT2A,TCF7,SKP2">Wnt Beta Catenin Signaling</option>
                              <option value="CTNNB1,TRIM33,NCOR2,TJP1,SKIL,ID3,THBS1,LTBP2,SMURF1,TGFBR1,CDK9,RHOA,PPM1A,ARID4B,CDH1,APC,FNTA,ACVR1,HIPK2,SMAD3,TGFB1">Tgf Beta Signaling</option>
                              <option value="REG1A,IL4R,CD44,IL17RA,TNFRSF1B,JUN,PTPN11,CBL,CSF2RB,IRF1,ACVR1B,PIK3R5,STAT3,TGFB1,STAT1,PIM1,SOCS1">Il6 Jak Stat3 Signaling</option>
                              <option value="ERCC2,GPX4,CETN2,POLB,POLA2,SAC3D1,MPG,NME4,BCAM,RPA2,TCEB3,NCBP2,RAD52,SUPT5H,TP53,RFC3,DGCR8,MRPL40,EIF1B,POLR2A,SRSF6,POLR2H,POLR2E,APRT,ZWINT,XPC,REV3L">DNA Repair</option>
                              <option value="CUL3,ATRX,CDK4,CDKN1B,CDKN2C,CTCF,DTYMK,POLA2,KIF5B,PAFAH1B1,KIF15,HMGN2,RPA2,SRSF10,SLC12A2,PRIM2,CHMP1A,TFDP1,DMD,HSPA8,CDC27,CDC45,HIRA,EWSR1,CDC25A,SMARCC1,BRCA2,MYC,AURKB,RAD21,SMC1A,ABL1,SRSF2,TRA2B,EZH2,BUB1,DKC1,KIF4A,NUP98,ODF2,CCND1,CBX1,HIST1H2BK,ILF3,PTTG1,MKI67,G3BP1,TPX2,BARD1,POLQ,NUMA1,E2F3,E2F1,AURKA,HIF1A,CHEK1,H2AFX,STAG1,PLK4,NOTCH2,PRPF4B,SUV39H1,SMAD3,TGFB1">G2m Checkpoint</option>
                              <option value="BCL2L1,CREBBP,BTG2,ERBB2,CTNNB1,GPX4,CASP8,IFITM3,CCND2,CDKN1B,PPP2R5B,RELA,CD44,RHOT2,ERBB3,HGF,CASP3,CASP9,DFFA,NEFH,TNFSF10,LUM,EGR3,JUN,SATB1,NEDD9,BRCA1,PDGFRB,WEE1,DNAJC3,MCL1,CCND1,SPTAN1,PAK1,IRF1,GUCY2D,CYLD,BIRC3,PTK2,BTG3,PLAT,TGFBR3,CDKN1A,LMNA,MGMT">Apoptosis</option>
                              <option value="NOTCH1,NOTCH3,APH1A,WNT5A,PRKCA,CCND1,KAT2A,NOTCH2,TCF7L2">Notch Pathway</option>
<option value="EGFR,CDKN1B,ERRFI1,VEGFA,HDLBP,IGFBP1,RBPJ,COL5A1,PKLR,NEDD4L,JUN,B3GALT6,KLF6,DTNA,PRKCA,SLC2A3,MAP3K1,GYS1,GCNT2,IRS2,MYH9,ZNF292,STC1,GPC4,VHL,STC2,NR3C1,TGFBI,CDKN1A,TNFAIP3,CXCR4,PIM1">Hypoxia</option>
<option value="CTNNB1,PPARG,NSDHL,ERRFI1,TM7SF2,ABCA2,FBXO6,FDPS,GUSB,TP53INP1">Cholesterol Homeostasis</option>
<option value="TSC1,RASA1,SHROOM2,NF1,ATG4B,CDC42EP2,MAP3K11,SAC3D1,ARHGAP4,CEP72,CLASP1,RHOT2,KIF5B,PAFAH1B1,MID1,KIF15,CAPZB,CDC42,KIF1B,WASL,DLG1,ALMS1,CNTROB,TUBD1,PLEKHG2,TUBGCP6,CDC27,TUBGCP2,ARHGEF3,FLNB,NEDD9,ABI1,BRCA2,SMC1A,SMC3,ABL1,AKAP13,BUB1,TRIO,KIF4A,ARHGEF2,APC,DST,DYNC1H1,SPTAN1,DOCK2,EZR,ARAP3,ARHGAP29,CRIPAK,TPX2,NUMA1,RICTOR,LATS1,AURKA,MYH9,NOTCH2,WASF2,GEMIN4,PCNT,MYH10,RAPGEF6,TIAM1">Mitotic Spindle</option>
<option value="CTNNB1,NOTCH1,CCND2,NCOR2,AXIN1,RBPJ,JAG2,TP53,MYC,HDAC2,PTCH1,HDAC5,DVL2,AXIN2,DKK4,KAT2A,TCF7,SKP2">Wnt Beta Catenin Signaling</option>
<option value="CTNNB1,TRIM33,NCOR2,TJP1,SKIL,ID3,THBS1,LTBP2,SMURF1,TGFBR1,CDK9,RHOA,PPM1A,ARID4B,CDH1,APC,FNTA,ACVR1,HIPK2,SMAD3,TGFB1">TGF Beta Signaling</option>
<option value="REG1A,IL4R,CD44,IL17RA,TNFRSF1B,JUN,PTPN11,CBL,CSF2RB,IRF1,ACVR1B,PIK3R5,STAT3,TGFB1,STAT1,PIM1,SOCS1">IL6 JAK Stat3 Signaling</option>
<option value="ERCC2,GPX4,CETN2,POLB,POLA2,SAC3D1,MPG,NME4,BCAM,RPA2,TCEB3,NCBP2,RAD52,SUPT5H,TP53,RFC3,DGCR8,MRPL40,EIF1B,POLR2A,SRSF6,POLR2H,POLR2E,APRT,ZWINT,XPC,REV3L">DNA repair</option>
<option value="CUL3,ATRX,CDK4,CDKN1B,CDKN2C,CTCF,DTYMK,POLA2,KIF5B,PAFAH1B1,KIF15,HMGN2,RPA2,SRSF10,SLC12A2,PRIM2,CHMP1A,TFDP1,DMD,HSPA8,CDC27,CDC45,HIRA,EWSR1,CDC25A,SMARCC1,BRCA2,MYC,AURKB,RAD21,SMC1A,ABL1,SRSF2,TRA2B,EZH2,BUB1,DKC1,KIF4A,NUP98,ODF2,CCND1,CBX1,HIST1H2BK,ILF3,PTTG1,MKI67,G3BP1,TPX2,BARD1,POLQ,NUMA1,E2F3,E2F1,AURKA,HIF1A,CHEK1,H2AFX,STAG1,PLK4,NOTCH2,PRPF4B,SUV39H1,SMAD3,TGFB1">G2M Checkpoint</option>
<option value="BCL2L1,CREBBP,BTG2,ERBB2,CTNNB1,GPX4,CASP8,IFITM3,CCND2,CDKN1B,PPP2R5B,RELA,CD44,RHOT2,ERBB3,HGF,CASP3,CASP9,DFFA,NEFH,TNFSF10,LUM,EGR3,JUN,SATB1,NEDD9,BRCA1,PDGFRB,WEE1,DNAJC3,MCL1,CCND1,SPTAN1,PAK1,IRF1,GUCY2D,CYLD,BIRC3,PTK2,BTG3,PLAT,TGFBR3,CDKN1A,LMNA,MGMT">Apoptosis</option>
<option value="NOTCH1,NOTCH3,APH1A,WNT5A,PRKCA,CCND1,KAT2A,NOTCH2,TCF7L2">Notch Signaling</option>
<option value="PPARG,GPX4,CDKN2C,UQCR11,ACOX1,CAT,SDHC,PEX14,SDHB,IDH1,RREB1,REEP6,ECHS1,JAGN1,TKT,ENPP2,ESYT1,PHLDB1,AGPAT6,ARAF,UQCRC1,TALDO1,LIFR,LAMA4,ITIH5,STAT5A">Adipogenesis</option>
<option value="CALCR,MYB,NCOR2,NAV2,CD44,ELF3,ELOVL5,DHRS3,KAZN,NBL1,BCL11B,MPPED2,MUC1,EGR3,TUBB2B,FAM102A,AR,AREG,SYNGR1,FLNB,XBP1,MYC,JAK2,KRT19,IGF1R,CCND1,DEPTOR,LRIG1,PODXL,FOXC1,GAB2,ADCY1,RET,KLF4,RBBP8,TJP3,WWC1,NRIP1,STC2,MED24,DLC1,SLC22A5,TIAM1,SLC16A1,TGIF2">Estrogen Response Early</option>
<option value="PKP3,CALCR,MDK,MYB,NCOR2,CD44,ELOVL5,GALE,NBL1,PLXNB1,JAK1,EGR3,FAM102A,SLC2A8,AREG,FLNB,XBP1,JAK2,FGFR3,IDH2,METTL3,KRT19,CDH1,IGSF1,CYP4F11,CCND1,FOXC1,LTF,KIF20A,RET,PLK4,KLF4,RBBP8,TJP3,NRIP1,BTG3,ST14,SLC22A5,TIAM1,SLC16A1">Estrogen Response Late</option>
<option value="PIAS1,CDK6,LMAN1,ELOVL5,TMEM50A,RPS6KA3,CCND3,B2M,TMPRSS2,NGLY1,ARID5B,KRT19,AKT1,GUCY1A3,ADAMTS1,CCND1,ALDH1A3,LIFR,TSC22D1,INPP4B">Androgen Response</option>
<option value="MEF2C,NOTCH1,CDH13,RB1,NAV2,ERBB3,ATP2A1,MYH2,MYH8,MYH4,ADAM12,DMD,TCAP,MAPK12,SORBS3,FDPS,KLF5,MYL3,IGF1,COL3A1,COL6A2,DTNA,MYH3,FGF2,AEBP1,COL1A1,FLII,RYR1,CTF1,COL6A3,MYH11,SPTAN1,HDAC5,CHRNB1,LAMA2,AKT2,ACTN2,MYH9,STC2,MYH1,CDKN1A,TGFB1,TSC2">Myogenesis</option>
<option value="EGFR,ATP6V1B1,LMAN1,KIF1B,STX12,RPS6KA3,MAPK1,VPS45,SCAMP3,ANP32E,RER1,VAMP3,RAB5A,GNAS,DST,SNX2,SEC31A,SH3GL2">Protein Secretion</option>
<option value="LPAR6,CASP8,IFITM1,IFITM2,IFITM3,IL4R,IRF7,BATF2,B2M,ADAR,ISG15,GBP4,EPSTI1,IRF1,RIPK2">Interferon Alpha Response</option>
<option value="CASP8,IFITM2,IFITM3,IL4R,IRF7,BATF2,CD274,HLA-A,CASP3,TNFSF10,CMKLR1,B2M,ADAR,IRF4,ISG15,ARID5B,JAK2,GBP4,IRF5,SELP,NCOA3,CSF2RB,EPSTI1,IRF1,NFKB1,HIF1A,LATS2,STAT4,CIITA,RIPK2,STAT3,RAPGEF6,RNF213,CDKN1A,TNFAIP3,STAT1,PIM1,NFKBIA,SOCS1">Interferon Gamma Response</option>
<option value="CAP1,EGFR,PVRL4,PTEN,TSC1,RASA1,SHROOM2,MDK,NF1,PARD6G,TJP1,CD274,CDH11,GRB7,CTNND1,LDLRAP1,NEGR1,WASL,NF2,DLG1,HRAS,JAM3,GAMT,MAPK11,SORBS3,THBS3,GNAI2,CADM2,VAV2,CDH1,COL17A1,ATP1A3,CNTN1,PLCG1,FLNC,FBN1,CTNNA1,ALOX15B,VCAN,AKT3,PIK3CB,AKT2,ACTN2,MYH9,TSPAN4,TUBG1,WNK4,PTK2,SYMPK,TRO,JUP,MYH10,TGFBI,PCDH1,NLGN2,NFASC">Apical Juncyion</option>
<option value="GATA3,SHROOM2,CROCC,GHRL,BRCA1,GSTM3,PKHD1">Apical Surface</option>
<option value="RASA1,NF1,VEGFA,CDK6,RTN1,GLI1,PTCH1,MYH9,L1CAM,TLE1">Hedgehog Signaling</option>
<option value="CPM,GATA3,CDH13,IRF7,PIK3CA,EHD1,ZFPM2,CR1,CASP3,CASP9,PRDM4,CR2,F5,PCLO,GNAI2,RAF1,JAK2,ADRA2B,CBLB,MMP13,DOCK9,CD59,LTF,DGKH,IRF1,PRKCD,ITGAM,FN1,ACTN2,GNB4,SH2B3,PIK3R5,PIK3CG,PLAT,LRP1,TNFAIP3,PIM1">Complement</option>
<option value="VEGFA,KIF5B,IGFBP1,EXOSC10,YIF1A,DDX10,EEF2,EXOC2,EIF4A1,TUBB2A,DCP1A,SPCS1,TATDN2,XBP1,NPM1,DKC1,DNAJC3,IARS,SRPR,EIF2AK3,EIF4EBP1,CALR,H2AFX,SKIV2L2,ZBTB17,GEMIN4,SEC31A,STC2,POP4,YWHAZ">Unfolded Protein Response</option>
<option value="EGFR,PTEN,CDK4,CDKN1B,CFL1,RPS6KA1,ADCY2,RPS6KA3,HRAS,MAPK1,RPTOR,RAC1,RAF1,PAK4,PTPN11,ADRBK1,AKT1,PLCG1,CAB39L,SMAD2,E2F1,CALR,MAP2K3,YWHAB,TIAM1,CDKN1A,CXCR4,TSC2">PI3K AKT MTOR Signaling</option>
<option value="BTG2,PSMD13,TM7SF2,ELOVL5,IDH1,G6PD,HSPA4,SDF2L1,CDC25A,XBP1,PSME3,BUB1,SLC2A3,ITGB2,PSPH,CALR,AURKA,MAP2K3,TUBG1,STC1,CDKN1A,CXCR4">Mtorc1 Signaling</option>
<option value="PSIP1,CDKN2A,CDK4,CDKN1B,CDKN2C,CTCF,POLA2,TRIP13,CCNE1,DCLRE1B,WDR90,PPP1R8,RPA2,MXD3,PRIM2,RBBP7,TP53,RQCD1,ANP32E,RFC3,DEK,RANBP1,DIAPH3,CDC25A,BRCA2,MYC,BRCA1,AURKB,CBX5,EED,RAD21,SMC1A,SMC3,SRSF2,TRA2B,EZH2,WEE1,KIF4A,NUP153,DNMT1,ILF3,PRKDC,PTTG1,MKI67,TBRG4,BARD1,CHEK2,RAD51C,AURKA,PPM1D,CHEK1,NBN,H2AFX,MRE11A,STAG1,PLK4,PMS2,TUBG1,RAD50,SUV39H1,CDKN1A,MLH1">E2F Targets</option>
<option value="CDK4,CLNS1A,TXNL4A,VDAC3,RPL22,HNRNPR,SRM,TARDBP,NCBP2,EIF4A1,TFDP1,ACP1,AIMP2,CDC45,DEK,RANBP1,UBE2L3,EXOSC7,SMARCC1,UBE2E1,RPS5,MYC,HDAC2,SRSF2,TRA2B,U2AF1,NPM1,IARS,PSMD1,G3BP1,PCBP1,EIF1AX,SF3A1,TRIM28">MYC targets V1</option>
<option value="CDK4,MAP3K6,MRTO4,SRM,BYSL,NOC4L,PUS1,AIMP2,MYC,NPM1,TBRG4,PLK4">MYC Targets V2</option>
<option value="COL1A2,EFEMP2,CDH11,CD44,VEGFA,CADM1,MMP3,NNMT,FUCA1,PLOD1,PLOD3,THBS1,ADAM12,INHBA,COL11A1,EDIL3,POSTN,LUM,COL5A1,NTM,JUN,AREG,VEGFC,SDC1,OXTR,WNT5A,PDGFRB,COL12A1,COL3A1,COL6A2,SLIT3,FGF2,COL1A1,PRRX1,ACTA2,DST,FBLN2,FBN1,COL6A3,MXRA5,COL5A3,LRRC15,CD59,FBN2,COL7A1,LAMA1,IL32,CAP2,VCAN,LAMA2,FN1,NOTCH2,NID2,TGFBI,SPOCK1,TGFBR3,LRP1,SFRP1,TGFB1,TNFAIP3">Epithelial Mesenchymal Transition</option>
<option value="AHR,BTG2,NPFFR2,IFITM1,IL4R,IL18RAP,IRF7,RELA,MET,KIF1B,TNFRSF1B,TNFSF10,ACVR2A,INHBA,CMKLR1,RAF1,ABI1,MYC,KLF6,NLRP3,PDPN,IL7R,MEFV,IRF1,NFKB1,ACVR1B,KCNMB2,PIK3R5,HIF1A,RNF144B,RIPK2,STAB1,ROS1,CDKN1A,NFKBIA">Inflammatory Response</option>
<option value="PROS1,REG1A,SLC6A12,CYP2E1,ACOX1,CAT,AP4B1,CES1,DDC,IGFBP1,ELOVL5,EPHA2,PGD,PINK1,RAP1GAP,IDH1,AKR1C2,AKR1C3,SPINT2,ACP1,HACL1,ITIH4,G6PC,IGF1,CYP4F2,HGFAC,GCNT2,ESR1,BPHL,CYFIP2,MAN1A1,CBR1,JUP,UPB1">Xenobiotic Metabolism</option>
<option value="NSDHL,D2HGDH,ACOX1,SDHA,SDHC,BCKDHB,ELOVL5,HMGCL,IDH1,NCAPH2,PPARA,REEP6,ECHS1,ACAA1,PDHB,AOC3,HSP90AA1,BPHL,HSD17B4,FH,CBR1,NBN,SLC22A5,SUCLA2">Fatty Acid Metabolism</option>
<option value="GPX4,NNT,ATP5D,ATP5I,UQCR11,SDHA,SDHC,VDAC3,RHOT2,MFN2,SDHB,ATP1B1,NDUFS6,IDH1,NQO2,ECHS1,ACAA1,PDHB,SLC25A20,IDH2,OGDH,ATP5E,FH,UQCRC2,UQCRC1,SUCLA2,RHOT1">Oxidative Phosphorylation</option>
<option value="EGFR,NSDHL,IDUA,CD44,SDHC,VEGFA,POLR3K,ELF3,HDLBP,MET,GALE,PLOD1,IDH1,G6PD,COL5A1,SDC1,B3GALT6,GMPPB,GYS1,KIF20A,SOX9,GUSB,VCAN,IRS2,AURKA,ZNF292,STC1,TALDO1,GPC4,HOMER1,STC2,MED24,TGFBI,CXCR4">Glycolysis</option>
<option value="ERCC2,GPX4,MBP,CAT,SBNO2,ABCC1,G6PD,TXNRD2,OXSR1,FES,SCAF4">Reactive Oxigen Species Pathway</option>
<option value="BTG2,CDKN2A,NOTCH1,CDH13,RB1,CCND2,MDM2,PVT1,FBXW7,CDKN2B,ZFP36L1,RAB40C,FGF13,PRKAB1,EPHA2,FUCA1,CEBPA,CCND3,HRAS,JAG2,JUN,TP53,HDAC3,SDC1,WRAP73,IP6K2,MAPKAPK3,IRAK1,EPS8L2,TRAF4,PTPN14,KRT17,EI24,CYFIP2,ALOX15B,ACVR1B,RXRA,RAD51C,ZMAT3,PPM1D,KLF4,XPC,TP63,TCHH,ST14,TSC22D1,CDKN1A,TGFB1,SOCS1">P53 pathway</option>
<option value="BTG2,ABCB1,SLC6A12,CDKN2B,CCNE1,PLCL1,PTPRD,CDC5L,CASP3,CCND3,STARD3,PRPF3,ACAA1,POLR2H,PRKACA,IRF1,PRKCD,MAPK8IP2,RET,RXRB,H2AFX,NTRK3,TCHH,BTG3,NFKBIA">UV Response</option>
<option value="ERBB2,PPARG,RUNX1,PTEN,PHF3,ATRX,COL1A2,PRDM2,CDKN1B,TJP1,MMP16,AMPH,TGFBR2,BCKDHB,DYRK1A,ABCC1,MET,PEX14,PIK3CD,NIPBL,DLG1,ACVR2A,ATXN1,COL11A1,VAV2,SFMBT1,MYC,KIT,PDGFRB,COL3A1,PRKCA,IGF1R,LPHN2,COL1A1,MAGI2,DDAH1,NFKB1,CAP2,RXRA,SPOP,AKT3,KALRN,MAP2K5,NOTCH2,SYNE1,DLC1,SCN8A,NR3C1,TGFBR3,SMAD3,INPP4B,PLCB4,MGMT">UV Response dn</option>
<option value="CCND2,VEGFA,POSTN,LUM,JAG2,VAV2,FGFR1,COL3A1,VCAN,STC1,PTK2">Angiogenesis</option>
<option value="BTG2,NNT,CDR2,CROCCP2,PPP2R5B,PQLC1,KEL,CAT,PIGQ,BCAM,KLF3,IGSF3,FBXO7,RAP1GAP,RHCE,RHD,CCND3,SLC10A3,DAAM1,HBD,CDC27,KAT2B,RBM5,RNF123,SLC25A38,EZH1,SPTB,ANK1,SPTA1,MAP2K3,EIF2AK1,XPO7,SLC25A37,NR3C1,SYNJ1,FAM46C">Heme Metabolism</option>
<option value="PROS1,MMP3,CASP9,MASP2,THBS1,CRIP2,C8A,RAC1,ARF4,FBN1,CPB2,FN1,MST1,C8B,PLAT,LRP1">Coagulation</option>
<option value="AHR,BCL2L1,GPX4,IFITM3,CCND2,ABCB1,IL4R,SCN9A,CCNE1,CD44,CASP3,DHRS3,TNFRSF1B,TNFRSF8,TNFSF10,CCND3,PUS1,MUC1,IRF4,TNFRSF18,PTH1R,XBP1,MYC,KLF6,GBP4,SLC2A3,IGF1R,SELP,PLEC,NCOA3,PTCH1,LRIG1,HUWE1,CDCP1,CTSZ,ETV4,HIPK2,CDC42SE2,RNH1,TLR7,SPRY4,ITIH5,SERPINB6,TIAM1,PIM1,SOCS1">IL2 stat5 signaling</option>
<option value="SULT1B1,CAT,ABCA2,CYP7B1,ATXN1,IDH1,HAO1,AR,PEX26,PAOX,HACL1,SLC27A5,IDH2,ABCA8,ABCA4,HSD17B4,ABCD3,RXRA,RXRG,RBP1">Bile Acid Metabolism</option>
<option value="ABCB1,ACOX1,CAT,CADM1,ELOVL5,DHRS3,HMGCL,PEX14,ATXN1,IDH1,HRAS,FDPS,ACAA1,SMARCC1,IDH2,CACNA1B,ABCC8,HSD17B4,ABCD3,SEMA3C,RXRG">Peroxisome</option>
<option value="EGFR,CDKN2A,CCND2,IL4R,IL18RAP,IRF7,IKBKB,HLA-A,CD4,EIF4G3,FGR,ACVR2A,INHBA,CCND3,HDAC9,TRAT1,B2M,IRF4,ABI1,BRCA1,JAK2,PRKCG,NPM1,NLRP3,AKT1,ITGB2,ELF4,HIF1A,CD28,STAT4,RIPK2,STAB1,TGFB1,STAT1,SOCS1">Allograft Rejection</option>
<option value="IFT88,PACRG,VDAC3,SYCP1,MTOR,NEFH,SLC12A2,NF2,JAM3,BRAF,SNAP91,IP6K1,PHF7,EZH2,BUB1,CCT6B,MLLT10,TOPBP1,AKAP4,GRM8,GSTM3,AURKA,CHFR,TALDO1,ZPBP,YBX2">Spermatogenesis</option>
<option value="LCP1,CCND2,ABCB1,PDCD1LG2,ADAMDEC1,FBXO4,FUCA1,TNFRSF1B,INHBA,ELTD1,CMKLR1,ITGBL1,ANO1,EPB41L3,HDAC9,EVI5,NAP1L2,SNAP91,ST6GAL1,ADAM8,SATB1,FLT4,IKZF1,PRKG2,GUCY1A3,IL7R,MAP3K1,SDCCAG8,PRRX1,CBL,GPR124,RELN,DOCK2,ITGB2,CDADC1,CAB39L,SOX9,MYCN,AKT2,SLMO2,ALDH1A3,ETV1,ETV4,KLF4,BIRC3,PRDM1,EPHB2,JUP,PLAT,ZNF639,TNFAIP3,CXCR4,ETV5">Kras Signaling Up</option>
<option value="BTG2,CCDC132,SLC6A3,IDUA,ATP6V1B1,P2RY4,PNMT,SKIL,PARK2,GPR3,MTHFR,RYR2,HNF1A,GP2,NTF3,GAMT,PRODH,YPEL1,ARPP21,ITIH3,THRB,FGFR3,PTPRJ,ATP4A,MEFV,KCNQ2,ABCB11,SCN10A,RYR1,MYO15A,NR4A2,GRID2,BARD1,PDE6B,TG,PCDHB1,YBX2,FAM46C">Kras Signaling Dn</option>
<option value="PAX6,HNF1A,PKLR,STXBP1,SPCS1,ABCC8,SST,AKT3,FOXA2">Pancreas Beta Cells</option>
                          </select>
                          <script> $('#genesets2').select2();</script>
                        </div>
                      </div>
                      
                      <div class="form-group" style="margin-top:20px;font-size:16px;">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Diseases</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <select id="diseases2" class="select2_group form-control" name="diseases">
<!--                               <option value="All">All</option> -->
								<option value="Adrenocortical Adenoma">Adrenocortical Adenoma</option>
								<option value="Adrenocortical Carcinoma">Adrenocortical Carcinoma</option>
								<option value="Ameloblastoma">Ameloblastoma</option>
								<option value="Anaplastic Thyroid Cancer">Anaplastic Thyroid Cancer</option>
								<option value="Bladder Adenocarcinoma">Bladder Adenocarcinoma</option>
								<option value="Bladder Urothelial Carcinoma">Bladder Urothelial Carcinoma</option>
								<option value="Breast Fibroepithelial Neoplasms">Breast Fibroepithelial Neoplasms</option>
								<option value="Malignant Phyllodes Tumor of the Breast">&nbsp;&nbsp;&nbsp;&nbsp;Malignant Phyllodes Tumor of the Breast</option>
								<option value="Cancer of Unknown Primary">Cancer of Unknown Primary</option>
								<option value="Cervical Adenocarcinoma">Cervical Adenocarcinoma</option>
								<option value="Cervical Endometrioid Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Cervical Endometrioid Carcinoma</option>
								<option value="Cervical Squamous Cell Carcinoma">Cervical Squamous Cell Carcinoma</option>
								<option value="Cholangiocarcinoma">Cholangiocarcinoma</option>
								<option value="Intrahepatic Cholangiocarcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Intrahepatic Cholangiocarcinoma</option>
								<option value="Chondrosarcoma">Chondrosarcoma</option>
								<option value="Mesenchymal Chondrosarcoma">&nbsp;&nbsp;&nbsp;&nbsp;Mesenchymal Chondrosarcoma</option>
								<option value="Collecting Duct Renal Cell Carcinoma">Collecting Duct Renal Cell Carcinoma</option>
								<option value="Colorectal Adenocarcinoma">Colorectal Adenocarcinoma</option>
								<option value="Colon Adenocarcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Colon Adenocarcinoma</option>
								<option value="Mucinous Adenocarcinoma of the Colon and Rectum">&nbsp;&nbsp;&nbsp;&nbsp;Mucinous Adenocarcinoma of the Colon and Rectum</option>
								<option value="Rectal Adenocarcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Rectal Adenocarcinoma</option>
								<option value="Colorectal Precursor Lesion">Colorectal Precursor Lesion</option>
								<option value="Conjunctival Melanocytic Tumors">Conjunctival Melanocytic Tumors</option>
								<option value="Desmoid/Aggressive Fibromatosis">Desmoid/Aggressive Fibromatosis</option>
								<option value="Diffuse Glioma">Diffuse Glioma</option>
								<option value="Glioblastoma">&nbsp;&nbsp;&nbsp;&nbsp;Glioblastoma</option>
								<option value="Glioblastoma Multiforme">&nbsp;&nbsp;&nbsp;&nbsp;Glioblastoma Multiforme</option>
								<option value="Brainstem Glioma">&nbsp;&nbsp;&nbsp;&nbsp;Brainstem Glioma</option>
								<option value="Oligodendroglioma">&nbsp;&nbsp;&nbsp;&nbsp;Oligodendroglioma</option>
								<option value="High-Grade Glioma">&nbsp;&nbsp;&nbsp;&nbsp;High-Grade Glioma</option>
								<option value="Astrocytoma">&nbsp;&nbsp;&nbsp;&nbsp;Astrocytoma</option>
								<option value="Anaplastic Astrocytoma">&nbsp;&nbsp;&nbsp;&nbsp;Anaplastic Astrocytoma</option>
								<option value="Embryonal Tumor">Embryonal Tumor</option>
								<option value="Medulloblastoma with Extensive Nodularity">&nbsp;&nbsp;&nbsp;&nbsp;Medulloblastoma with Extensive Nodularity</option>
								<option value="Medulloblastoma">&nbsp;&nbsp;&nbsp;&nbsp;Medulloblastoma</option>
								<option value="Encapsulated Glioma">Encapsulated Glioma</option>
								<option value="Low-Grade Glioma">&nbsp;&nbsp;&nbsp;&nbsp;Low-Grade Glioma</option>
								<option value="Dysembryoplastic Neuroepithelial Tumor">&nbsp;&nbsp;&nbsp;&nbsp;Dysembryoplastic Neuroepithelial Tumor</option>
								<option value="Endometrial Carcinoma">Endometrial Carcinoma</option>
								<option value="Uterine Endometrioid Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Uterine Endometrioid Carcinoma</option>
								<option value="Uterine Carcinosarcoma/Uterine Malignant Mixed Mullerian Tumor">&nbsp;&nbsp;&nbsp;&nbsp;Uterine Carcinosarcoma/Uterine Malignant Mixed Mullerian Tumor</option>
								<option value="Esophageal Squamous Cell Carcinoma">Esophageal Squamous Cell Carcinoma</option>
								<option value="Esophagogastric Adenocarcinoma">Esophagogastric Adenocarcinoma</option>
								<option value="Esophageal Adenocarcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Esophageal Adenocarcinoma</option>
								<option value="Stomach Adenocarcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Stomach Adenocarcinoma</option>
								<option value="Ewing Sarcoma">Ewing Sarcoma</option>
								<option value="Gallbladder Cancer">Gallbladder Cancer</option>
								<option value="Gastrointestinal Stromal Tumor">Gastrointestinal Stromal Tumor</option>
								<option value="Head and Neck Squamous Cell Carcinoma">Head and Neck Squamous Cell Carcinoma</option>
								<option value="Oral Squamous Cell Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Oral Squamous Cell Carcinoma</option>
								<option value="Oral Cavity Squamous Cell Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Oral Cavity Squamous Cell Carcinoma</option>
								<option value="Oral Tongue Squamous Cell Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Oral Tongue Squamous Cell Carcinoma</option>
								<option value="Hepatocellular Carcinoma">Hepatocellular Carcinoma</option>
								<option value="Invasive Breast Carcinoma">Invasive Breast Carcinoma</option>
								<option value="Breast Invasive Lobular Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Breast Invasive Lobular Carcinoma</option>
								<option value="Langerhans Cell Histiocytosi">Langerhans Cell Histiocytosi</option>
								<option value="Leiomyosarcoma">Leiomyosarcoma</option>
								<option value="Liposarcoma">Liposarcoma</option>
								<option value="Myxoid/Round-Cell Liposarcoma">&nbsp;&nbsp;&nbsp;&nbsp;Myxoid/Round-Cell Liposarcoma</option>
								<option value="Well-Differentiated Liposarcoma">&nbsp;&nbsp;&nbsp;&nbsp;Well-Differentiated Liposarcoma</option>
								<option value="Lung Neuroendocrine Tumor">Lung Neuroendocrine Tumor</option>
								<option value="Small Cell Lung Cancer">&nbsp;&nbsp;&nbsp;&nbsp;Small Cell Lung Cancer</option>
								<option value="Lymphoid Neoplasm">Lymphoid Neoplasm</option>
								<option value="Multiple myeloma">&nbsp;&nbsp;&nbsp;&nbsp;Multiple myeloma</option>
								<option value="Diffuse Large B-Cell Lymphoma">&nbsp;&nbsp;&nbsp;&nbsp;Diffuse Large B-Cell Lymphoma</option>
								<option value="Extranodal Marginal Zone Lymphoma of Mucosa-Associated Lymphoid Tissue">&nbsp;&nbsp;&nbsp;&nbsp;MALT lymphoma</option>
								<option value="Waldenstrom Macroglobulinemia">&nbsp;&nbsp;&nbsp;&nbsp;Waldenstrom Macroglobulinemia</option>
								<option value="Anaplastic Large Cell Lymphoma">&nbsp;&nbsp;&nbsp;&nbsp;Anaplastic Large Cell Lymphoma</option>
								<option value="Rosai-Dorfman Disease">&nbsp;&nbsp;&nbsp;&nbsp;Rosai-Dorfman Disease</option>
								<option value="Angioimmunoblastic T-Cell Lymphoma">&nbsp;&nbsp;&nbsp;&nbsp;Angioimmunoblastic T-Cell Lymphoma</option>
								<option value="Marginal Zone Lymphoma">&nbsp;&nbsp;&nbsp;&nbsp;Marginal Zone Lymphoma</option>
								<option value="Chronic Lymphocytic Leukemia/Small Lymphocytic Lymphoma">&nbsp;&nbsp;&nbsp;&nbsp;Chronic Lymphocytic Leukemia/Small Lymphocytic Lymphoma</option>
								<option value="Non-Hodgkin Lymphoma">&nbsp;&nbsp;&nbsp;&nbsp;Non-Hodgkin Lymphoma</option>
								<option value="T-Lymphoblastic Leukemia/Lymphoma">&nbsp;&nbsp;&nbsp;&nbsp;T-Lymphoblastic Leukemia/Lymphoma</option>
								<option value="Mantle Cell Lymphoma">&nbsp;&nbsp;&nbsp;&nbsp;Mantle Cell Lymphoma</option>
								<option value="Follicular Lymphoma">&nbsp;&nbsp;&nbsp;&nbsp;Follicular Lymphoma</option>
								<option value="Medullary Thyroid Cancer">Medullary Thyroid Cancer</option>
								<option value="Melanoma">Melanoma</option>
								<option value="Cutaneous Melanoma">&nbsp;&nbsp;&nbsp;&nbsp;Cutaneous Melanoma</option>
								<option value="Meningothelial Tumor">Meningothelial Tumor</option>
								<option value="Meningioma">&nbsp;&nbsp;&nbsp;&nbsp;Meningioma</option>
								<option value="Mesothelioma">Mesothelioma</option>
								<option value="Metastatic Bladder Cancer">Metastatic Bladder Cancer</option>
								<option value="Mucosal Melanoma of the Urethra">Mucosal Melanoma of the Urethra</option>
								<option value="Mucosal Melanoma of the Vulva/Vagina">Mucosal Melanoma of the Vulva/Vagina</option>
								<option value="Myeloid Neoplasm">Myeloid Neoplasm</option>
								<option value="Acute Myeloid Leukemia">&nbsp;&nbsp;&nbsp;&nbsp;Acute Myeloid Leukemia</option>
								<option value="Myeloproliferative Neoplasms">&nbsp;&nbsp;&nbsp;&nbsp;Myeloproliferative Neoplasms</option>
								<option value="Langerhans Cell Histiocytosis">&nbsp;&nbsp;&nbsp;&nbsp;Langerhans Cell Histiocytosis</option>
								<option value="Erdheim-Chester Disease">&nbsp;&nbsp;&nbsp;&nbsp;Erdheim-Chester Disease</option>
								<option value="Essential Thrombocythemia">&nbsp;&nbsp;&nbsp;&nbsp;Essential Thrombocythemia</option>
								<option value="Primary Myelofibrosis">&nbsp;&nbsp;&nbsp;&nbsp;Primary Myelofibrosis</option>
								<option value="Myelodysplastic Syndromes">&nbsp;&nbsp;&nbsp;&nbsp;Myelodysplastic Syndromes</option>
								<option value="Chronic Lymphocytic Leukemia/Small Lymphocytic Lymphoma">&nbsp;&nbsp;&nbsp;&nbsp;Chronic Lymphocytic Leukemia/Small Lymphocytic Lymphoma</option>
								<option value="T-Cell Acute Lymphoid Leukemia">&nbsp;&nbsp;&nbsp;&nbsp;T-Cell Acute Lymphoid Leukemia</option>
								<option value="Chronic Myelomonocytic Leukemia">&nbsp;&nbsp;&nbsp;&nbsp;Chronic Myelomonocytic Leukemia</option>
								<option value="Acute Lymphoid Leukemia">&nbsp;&nbsp;&nbsp;&nbsp;Acute Lymphoid Leukemia</option>
								<option value="Blastic Plasmacytoid Dendritic Cell Neoplasm">&nbsp;&nbsp;&nbsp;&nbsp;Blastic Plasmacytoid Dendritic Cell Neoplasm</option>
								<option value="Systemic Mastocytosis">&nbsp;&nbsp;&nbsp;&nbsp;Systemic Mastocytosis</option>
								<option value="Leukemia">&nbsp;&nbsp;&nbsp;&nbsp;Leukemia</option>
								<option value="Neuroblastoma">Neuroblastoma</option>
								<option value="Non-Anaplastic Thyroid Cancer">Non-Anaplastic Thyroid Cancer</option>
								<option value="Nonmuscle Invasive Bladder Cancer">Nonmuscle Invasive Bladder Cancer</option>
								<option value="Non-Seminomatous Germ Cell Tumor">Non-Seminomatous Germ Cell Tumor</option>
								<option value="Non-Small Cell Lung Cancer">Non-Small Cell Lung Cancer</option>
								<option value="Lung Adenocarcinoma">Lung Adenocarcinoma</option>
								<option value="Lung Squamous Cell Carcinoma">Lung Squamous Cell Carcinoma</option>
								<option value="Lung Adenocarcinom">Lung Adenocarcinom</option>
								<option value="Non-Small Cell Lung Cancer">Non-Small Cell Lung Cancer</option>
								<option value="Ocular Melanoma">Ocular Melanoma</option>
								<option value="Uveal Melanoma">&nbsp;&nbsp;&nbsp;&nbsp;Uveal Melanoma</option>
								<option value="Iris Melanoma">&nbsp;&nbsp;&nbsp;&nbsp;Iris Melanoma</option>
								<option value="Ovarian Cancer">Ovarian Cancer</option>
								<option value="Ovarian Epithelial Tumor">Ovarian Epithelial Tumor</option>
								<option value="Clear Cell Ovarian Cancer">&nbsp;&nbsp;&nbsp;&nbsp;Clear Cell Ovarian Cancer</option>
								<option value="Low-Grade Serous Ovarian Cancer">&nbsp;&nbsp;&nbsp;&nbsp;Low-Grade Serous Ovarian Cancer</option>
								<option value="High-Grade Serous Ovarian Cancer">&nbsp;&nbsp;&nbsp;&nbsp;High-Grade Serous Ovarian Cancer</option>
								<option value="Mucinous Ovarian Cancer">&nbsp;&nbsp;&nbsp;&nbsp;Mucinous Ovarian Cancer</option>
								<option value="Ovarian Seromucinous Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Ovarian Seromucinous Carcinoma</option>
								<option value="Pancancer">Pancancer</option>
								<option value="Pancreatic Adenocarcinoma">Pancreatic Adenocarcinoma</option>
								<option value="Paraganglioma">Paraganglioma</option>
								<option value="Pheochromocytoma">Pheochromocytoma</option>
								<option value="Poorly Differentiated Thyroid Cancer">Poorly Differentiated Thyroid Cancer</option>
								<option value="Porocarcinoma">Porocarcinoma</option>
								<option value="Prostate Adenocarcinoma">Prostate Adenocarcinoma</option>
								<option value="Renal Cell Carcinoma">Renal Cell Carcinoma</option>
								<option value="Renal Clear Cell Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Renal Clear Cell Carcinoma</option>
								<option value="Papillary Renal Cell Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Papillary Renal Cell Carcinoma</option>
								<option value="Chromophobe Renal Cell Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Chromophobe Renal Cell Carcinoma</option>
								<option value="Clear Cell Renal Cell Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Clear Cell Renal Cell Carcinoma</option>
								<option value="Renal Mucinous Tubular Spindle Cell Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Renal Mucinous Tubular Spindle Cell Carcinoma</option>
								<option value="Salivary Carcinoma">Salivary Carcinoma</option>
								<option value="Salivary Duct Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Salivary Duct Carcinoma</option>
								<option value="Mucoepidermoid Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Mucoepidermoid Carcinoma</option>
								<option value="Sarcoma">Sarcoma</option>
								<option value="Sebaceous Gland Hyperplasia">Sebaceous Gland Hyperplasia</option>
								<option value="Sellar Tumor">Sellar Tumor</option>
								<option value="Craniopharyngioma">&nbsp;&nbsp;&nbsp;&nbsp;Craniopharyngioma</option>
								<option value="Pituitary Carcinoma">&nbsp;&nbsp;&nbsp;&nbsp;Pituitary Carcinoma</option>
								<option value="Pituitary Adenoma">&nbsp;&nbsp;&nbsp;&nbsp;Pituitary Adenoma</option>
								<option value="Tenosynovial Giant Cell Tumor Diffuse Type">Tenosynovial Giant Cell Tumor Diffuse Type</option>
								<option value="Thymic Epithelial Tumor">Thymic Epithelial Tumor</option>
								<option value="Thymoma">&nbsp;&nbsp;&nbsp;&nbsp;Thymoma</option>
								<option value="Tubular Adenoma of the Colon">Tubular Adenoma of the Colon</option>
								<option value="Urinary Bladder Cancer">Urinary Bladder Cancer</option>
								<option value="Uterine Sarcoma/Mesenchymal">Uterine Sarcoma/Mesenchymal</option>
								<option value="Uterine Smooth Muscle Tumor">&nbsp;&nbsp;&nbsp;&nbsp;Uterine Smooth Muscle Tumor</option>
								<option value="Uterine Leiomyoma">&nbsp;&nbsp;&nbsp;&nbsp;Uterine Leiomyoma</option>
								<option value="Well-Differentiated Thyroid Cancer">Well-Differentiated Thyroid Cancer</option>
								<option value="Papillary Thyroid Cancer">&nbsp;&nbsp;&nbsp;&nbsp;Papillary Thyroid Cancer</option>
								<option value="Follicular Thyroid Cancer">&nbsp;&nbsp;&nbsp;&nbsp;Follicular Thyroid Cancer</option>
								<option value="Wilms' Tumor">Wilms' Tumor</option>
                          </select>
                          <script>$('#diseases2').select2();</script>
						 
                        </div>
                      </div>   
                      <div class="ln_solid" style="margin-top:20px;"></div>
                      <div class="form-group" style="margin-top:20px;">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-info" type="button" onclick="$('#genes2').val('RB1,MDM2,NF1,CDKN2A');document.getElementById('diseases2').options.selectedIndex = 26;$('#diseases2').select2();">Demo</button>
						  <button class="btn btn-primary" type="button" onclick="$reset2()">Reset</button>		
                          <button type="button" class="btn btn-success" onclick="$AdvInnerSearch()">Submit</button>
                        </div>
                      </div>
                    </form>
                  </div>
                </div> 
            	</div>
            	<div class="col-md-6 col-sm-6 col-xs-6">
            		<div class="x_panel">
                  <div class="x_title">
                  	<h2><i class="fa fa-bookmark-o"></i> Notes</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                     <br/>
                          <p style="font-size:16px;"><b>Search Internal Relations Module</b> is a function to search mutually exclusive relationships within the input or pre-defined gene set in the specific cancer type <a href="Help.jsp#Internal"><i class="fa fa-key"></i></a>.</p>
			           	  <p style="font-size:16px;"><b>Gene set:</b> Users can input multiple interesting genes <span style="color:rgb(144,11,9);">(must be more than two genes)</span> with HGNC gene symbol.The gene set should be separated by commas.</p>
                          <p style="font-size:16px;"><b>Defined Gene Sets:</b> Users can conveniently select a predefined gene sets.</p>
                          <p style="font-size:16px;"><b>Diseases:</b> Users can select an interesting cancer type.</p>	
                  </div>
                </div> 
            	</div>
            </div>             
              
              <!-- 不存在数据时展示 -->
      <div id="noResult" style="display:none;">
           <div id="uploadReturn" class="alert alert-warning alert-dismissible fade in" role="alert" >
	                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
	                    </button>
	                    <strong>Sorry</strong> no data.
	                  </div>
      </div>
              
              <!-- 表格及网络展示 -->
              <div id="AdvResult" style="display:none;">
                  <div class="row">
                     <div class="col-md-12 col-sm-12 col-xs-12">
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
		                  
		                    <div id="ContainerDataTable"></div>
		                  </div>
	                    </div>  </div>
                  </div>
                  <div class="row">
                  <div  class="col-md-12 col-sm-12 col-xs-12">	                
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
	              <%-- <div id="browseDisplay" class="col-md-12 col-sm-12 col-xs-12">
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
		                  
		                    <div id="ContainerDataTable"></div>
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
	              </div> --%>
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
    <!-- Custom Theme Scripts -->
    <script src="../js/custom.min.js"></script>
    <!-- qtip2 -->
    <script src="../js/jquery-qtip2/jquery.qtip.min.js"></script>

    <!-- DataTable -->
    <script src="../js/Bootstrap-DataTables-1.10.16/datatables.min.js"></script>
    <script src="../js/Bootstrap-DataTables-1.10.16/DataTables-1.10.16/js/dataTables.bootstrap.min.js"></script>
    <script src="../js/Bootstrap-DataTables-1.10.16/Buttons-1.5.1/js/datatables.buttons.min.js"></script>
    <script src="../js/Bootstrap-DataTables-1.10.16/Buttons-1.5.1/js/buttons.bootstrap.min.js"></script>
    <script src="../js/Bootstrap-DataTables-1.10.16/Buttons-1.5.1/js/buttons.colVis.min.js"></script>
    <script src="../js/Bootstrap-DataTables-1.10.16/Buttons-1.5.1/js/buttons.flash.min.js"></script>
    <script src="../js/Bootstrap-DataTables-1.10.16/Buttons-1.5.1/js/buttons.html5.min.js"></script>
    <script src="../js/Bootstrap-DataTables-1.10.16/Buttons-1.5.1/js/buttons.print.min.js"></script>
    <script src="../js/Bootstrap-DataTables-1.10.16/JSZip-2.5.0/jszip.min.js"></script>
    <script src="../js/Bootstrap-DataTables-1.10.16/pdfmake-0.1.32/pdfmake.min.js"></script>
    <script src="../js/Bootstrap-DataTables-1.10.16/pdfmake-0.1.32/vfs_fonts.js"></script>
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
 <script>
 $("#genes1").focus(function(){
	     $("#genes1").attr("placeholder","");
	 });
 $("#genes1").blur(function(){
	 $("#genes1").attr("placeholder","MTOR,RB1,TP53,PTEN,EGFR");
	 });
 $("#genes1").keyup(function(){
 	var genesets = $("#genes1").val();
 	var genes = genesets.split(",");
 	if(genes.length > 10){
 		$("#genes1").val("");
 		alert("For searching convinience the number of genes should be less than 10");
 	}
 });
 $("#genes2").focus(function(){
	$("#genes2").attr("placeholder","");
});
 $("#genes2").blur(function(){
	$("#genes2").attr("placeholder","MTOR,RB1,TP53,PTEN,EGFR");
});

	$('#genesets2').change(function(){
		var pregeneset = $("#genesets2").find("option:selected").val(); //选择select被选择的value
		$("#genes2").val(pregeneset);
	});
 </script>

  

  </body>
</html>