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
    <!-- jquery-ui -->
	<link rel="stylesheet" href="../css/jquery-ui-1.10.0.custom.css">
    <!-- Font Awesome -->
    <link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../css/nprogress.css" rel="stylesheet">
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
    <!-- qtip2 -->
    <link rel="stylesheet" type="text/css" href="../js/jquery-qtip2/jquery.qtip.min.css">
     <!-- jQuery -->
    <script src="../js/jquery.min.js"></script>
    <!-- jquery UI -->
		<script src="../js/jQueryUI/jquery-ui.min.js"></script>
    <!-- Bootstrap -->
    <script src="../js/bootstrap.min.js"></script>
    <!-- NProgress -->
<%--     <script src="../js/nprogress.js"></script> --%>
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
	  <style>
		  .ui-autocomplete {
		    max-height: 120px;
		    overflow-y: auto;
		    /* 防止水平滚动条 */
		    overflow-x: hidden;
		  }
		  /* IE 6 不支持 max-height
		   * 我们使用 height 代替，但是这会强制菜单总是显示为那个高度
		   */
		  * html .ui-autocomplete {
		    height: 120px;
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
<!--         top navigation -->
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
        <div class="right_col" role="main">
          <div class="">
<!--           <div class="row"> -->
<!--             	<div class="col-md-12 col-sm-12 col-xs-12"> -->
<!--             		<div class="x_panel"> -->
<!-- 	                  <div class="x_title"> -->
<!-- 	                    <h2><i class="fa fa-table"></i> QuickSearch</h2> -->
<!-- 	                    <ul class="nav navbar-right panel_toolbox"> -->
<!-- 	                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a> -->
<!-- 	                      </li> -->
<!-- 	                    </ul> -->
<!-- 	                    <div class="clearfix"></div> -->
<!-- 	                  </div> -->
<!--                   <div class="x_content"> -->
						
<!--                   </div> -->
<!--             	</div> -->
<!--             </div> -->
<!--          </div>  -->
            <div class="row">
            	<div class="col-md-12 col-sm-12 col-xs-12">
            		<div class="x_panel">
	                  <div class="x_title">
	                    <h2><i class="fa fa-search"></i> Quick Search</h2>
	                    <ul class="nav navbar-right panel_toolbox">
	                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
	                      </li>
	                    </ul>
	                    <div class="clearfix"></div>
	                  </div>
	                  <div class="x_content">
							<form id="quick_search" method="post" action="Memain!QuickSearch">
								<div class="input-group input-group-lg">
									<input id="autoComplete" type="text" class="form-control" autocomplete="off" name="param" placeholder="You are interested in <s:property value="param"/>" data-toggle="tooltip" data-placement="bottom" title="You can search for gene symbol or disease name"/>
									<span class="input-group-btn">
										<button class="btn btn-info btn-flat" type="submit">Search<i class="fa fa-search"></i></button>
									</span>
								</div>
								<div class="form-group">
									<div style="font-size:16px; margin-top:10px;">
										<b>Examples:</b>
										<a href="Memain!QuickSearch?param=BRCA1">BRCA1</a>&nbsp;OR&nbsp;<a href="Memain!QuickSearch?param=Ovarian Cancer">Ovarian Cancer</a>
<%-- 										<span style="margin-left:26px;font-size:16px"><a href="Memain!QuickSearch?param=Ovarian Cancer">Ovarian Cancer</a>&nbsp;OR&nbsp;<a href="Memain!QuickSearch?param=Endometrial Carcinoma">Endometrial Carcinoma</a></span> --%>
									</div>	
								</div>
							</form>
	                  </div>
            	</div>
            </div>
         </div> 
            <s:if test="%{#resultTable.size > 0}">
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
						<table id="Testdatatable" class="table table-striped table-bordered table-hover" style="width:100%;">
				          	<thead>
				              <tr>              
				                <th>Tissue Origin</th>
				                <th>Cancer Type</th>
				                <th>Subtype</th>
				                <th>Gene A</th>
				                <th>Aberrance TypeA</th>
				                <th>Gene B</th>
				                <th>Aberrance TypeB</th>
				                <th>Source</th>
				                <th>Details</th>
				              </tr>
				            </thead>
				            <tbody>
					            <s:iterator value="#resultTable" id="id" status="st">
					            	<tr>
					               	    <td><s:property value="#id.getTissueorigin()"/></td>
					               	    <td><s:property value="#id.getCancertype()"/></td>
					               	    <td><s:property value="#id.getSubtype()"/></td>
					               	    <td><s:property value="#id.getGenename1()"/></td>
					               	    <td><s:property value="#id.getAberrancetype1()"/></td>				                    	    
					               	    <td><s:property value="#id.getGenename2()"/></td>
					               	    <td><s:property value="#id.getAberrancetype2()"/></td> 				               	          	    
					               	    <td><s:property value="#id.getEvidence()"/></td>
					                    <td><a href="Memain!DetailSearch?id=<s:property value="#id.getMainid()"/>" target='_blank' style='cursor:pointer;'><i class='fa fa-external-link'></i> Details</a></td>
					               </tr>
					            </s:iterator>  
				            </tbody>
                       </table>
                  </div>
            	</div>
            </div>
         </div> 
            <div class="row">
            	<div class="col-md-12 col-sm-12 col-xs-12">
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
      			    <div style="margin-top: 20px;font-size:15px">
							<div style="float:left;width: 75%" id="network">
								<div id="cytoscapeweb" style="width:100%;min-width: 700px; height: 540px;"></div>
							</div>
							<div style="float:left;width:25%;" id="network_sider">
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
								<ol class="styled" style="font-size: 15px;width:30px;">
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
								<p><B><i class="fa fa-eye"></i> Bird' eye</B></p>
								<div id="containerNavigator">
									<div id="navigator" style="width:350px;height:150px;margin-top:30px;position:relative;overflow:hidden;border:1px solid #000;z-index:99999;"></div>
								</div>
							</div>
						</div>
                  </div>
            	</div>
            </div>
         </div> 
            </s:if>
            <s:else>
               <div id="noResult">
           			<div id="uploadReturn" class="alert alert-warning alert-dismissible fade in" role="alert">
	                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
	                    </button>
	                    <strong>Sorry</strong> no data for <s:property value="param"/>.
	                  </div>
      			</div>
            </s:else>
            
            
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
    <script type="text/javascript">
        if(<%=(String)request.getAttribute("Edges")%> != ""){
        	$("#Testdatatable").DataTable({
    		    dom: '<"top"Bf>rt<"bottom"lp><"clear">',  //B代表button，f代表filter input，l代表length changing input control p代表pagination control
    			buttons: [
    				  'copy', 'csv', 'excel', 'pdf', 'print'
    		    ],
    		});
    	    var nodes = $changeNodes(<%=(String)request.getAttribute("inputNodes")%>,<%=(String)request.getAttribute("Nodes")%>,"star","#F5A45D");
    	    $networkVisualization(nodes,<%=(String)request.getAttribute("Edges")%>);
        } 
    </script>
    <script>
		    var xmlGeneInfo = ""; 
			var xmlCancerInfo = "";
			$.ajax({
		        url: "../xml/geneSymbol.xml",
		        dataType: 'xml',
		        timeout: 2000,
		        async:false,
		        error: function()
		        {
		        	//alert() æ¹æ³ç¨äºæ¾ç¤ºå¸¦æä¸æ¡æå®æ¶æ¯åä¸ä¸ª OK æé®çè­¦åæ¡
		            alert("error load xml");
		        },
		        success: function(xml){
		        	//å¨xml/geneSymbol.xmlææ¡£ä¸­å¯»æ¾<geneSymbol> </geneSymbol>ä¸­ææ¬åå®¹ï¼ 
		        	xmlGeneInfo = $(xml).find("geneSymbol").text();
		        }
		    });
			$.ajax({
		        url: "../xml/cancer.xml",
		        dataType: 'xml',
		        timeout: 2000,
		        async:false,
		        error: function()
		        {
		        	//alert() æ¹æ³ç¨äºæ¾ç¤ºå¸¦æä¸æ¡æå®æ¶æ¯åä¸ä¸ª OK æé®çè­¦åæ¡
		            alert("error load xml");
		        },
		        success: function(xml){
		        	//å¨xml/geneSymbol.xmlææ¡£ä¸­å¯»æ¾<geneSymbol> </geneSymbol>ä¸­ææ¬åå®¹ï¼ 
		        	xmlCancerInfo = $(xml).find("cancer").text();
		        }
		    });
			var resultArr1 = xmlGeneInfo.split(","); 
			var resultArr2 = xmlCancerInfo.split(",");
			var resultArr = resultArr1.concat(resultArr2);
			//ID query æ¯<form>è¡¨ååå®¹ï¼
			$( "#autoComplete" ).autocomplete({
				max:15, 
				minLength:2,
				scrollHeight: 200,
				matchContains: true,
				delay:0,
				source: resultArr,
			});
    </script>
  </body>
</html>