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
    <link href="../css/nprogress.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="../css/custom.min.css" rel="stylesheet">
    
    <link href="../css/font-awesome-4.0.3/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <style>
	    .basicContainer{ 
	    	text-align: justify; 
	    } 
    	.basicInformation{
/*     	     width:80%; */
/*     	     margin:auto; table居中*/ 
             margin-left: 150px;
    	     font-size:16px;
    	}
    	.basicInformation tr td{
    		padding:7px 17px 7px 17px;
    	}
    	.paperCard{
           border-style: solid;
           border-width: 1px;
           border-color:rgb(238,232,225);
           margin-top:20px;
           text-align: justify; 
        }
    	.paperInformation{
    	    margin-left: 150px;
    		margin-top:-10px;
    		/* margin-left:190px; */
    		font-size:16px;
    	}
    	.paperInformation tr td{
    		padding:7px 17px 7px 17px;
    	}
    	.linkedOut{
    		text-decoration: underline;
    		/*font-weight:bold;
    		  color:black;*/
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
        <div class="right_col" role="main">
          <div class="">
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
              	<div class="x_panel">
                  <div class="x_title">
                    <h2><i class="fa fa-table"></i> Basic Information</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                     <div class="basicContainer">
                     	<table class="basicInformation"> 
            	          <tbody>
               		           <tr>
               		              <td style="text-align:right;"><B>Tissue Origin:</B></td>
               		              <td><s:property value="#memainTable.get(0).getTissueorigin()"/></td>
               		              <td style="text-align:right;"><B>Cancer Type:</B></td>
					      		  <td><s:property value="#memainTable.get(0).getCancertype()"/></td>
					      		</tr>
					      		<tr>
					      		   <td style="text-align:right;"><B>Subtype:</B></td>
					      		   <td><s:property value="#memainTable.get(0).getSubtype()"/></td>
					      		   <td style="text-align:right;"><B>Method:</B></td>
			               		   <td><s:property value="#memainTable.get(0).getEvidence()"/></td>
					      		</tr>
					      		<tr>
					      		   <td style="text-align:right;"><B>GeneA Symble:</B></td>
					      		   <td><s:property value="#memainTable.get(0).getGenename1()"/></td>
					      		   <td style="text-align:right;"><B>GeneB Symble:</B></td>
					      		   <td><s:property value="#memainTable.get(0).getGenename2()"/></td>
					      		</tr>
					      		<tr>
					      		   <td style="text-align:right;"><B>GeneA Entrez ID:</B></td>
					      		   <td><s:if test="%{#memainTable.get(0).getGeneid1() != 'NA'}"><a target="_blank" href="https://www.ncbi.nlm.nih.gov/gene/?term=<s:property value="#memainTable.get(0).getGeneid1()"/>"><span class="linkedOut"><s:property value="#memainTable.get(0).getGeneid1()"/></span></a></s:if><s:else><s:property value="#memainTable.get(0).getGeneid1()"/></s:else></td>
					      		    <td style="text-align:right;"><B>GeneB Entrez ID:</B></td>
			               		   <td><s:if test="%{#memainTable.get(0).getGeneid2() != 'NA'}"><a target="_blank" href="https://www.ncbi.nlm.nih.gov/gene/?term=<s:property value="#memainTable.get(0).getGeneid2()"/>"><span class="linkedOut"><s:property value="#memainTable.get(0).getGeneid2()"/></span></a></s:if><s:else><s:property value="#memainTable.get(0).getGeneid2()"/></s:else></td>
					      		</tr>
					      		<tr>
					      		   <td style="text-align:right;"><B>GeneA Ensemble ID:</B></td>
					      		   <td><s:if test="%{#memainTable.get(0).getEnsembleid1() != 'NA'}"><a target="_blank" href='http://asia.ensembl.org/Homo_sapiens/Gene/Summary?db=core;g=<s:property value="#memainTable.get(0).getEnsembleid1()"/>' style="pointer:cursor"><span class="linkedOut"><s:property value="#memainTable.get(0).getEnsembleid1()"/></span></a></s:if><s:else><s:property value="#memainTable.get(0).getEnsembleid1()"/></s:else></td>
					      		   <td style="text-align:right;"><B>GeneB EnsembleID:</B></td>
			               		   <td><s:if test="%{#memainTable.get(0).getEnsembleid2() != 'NA'}"><a target="_blank" href='http://asia.ensembl.org/Homo_sapiens/Gene/Summary?db=core;g=<s:property value="#memainTable.get(0).getEnsembleid2()"/>' style="pointer:cursor"><span class="linkedOut"><s:property value="#memainTable.get(0).getEnsembleid2()"/></span></a></s:if><s:else><s:property value="#memainTable.get(0).getEnsembleid2()"/></s:else></td>
					      		</tr>
					      		<tr>
					      		   <td style="text-align:right;"><B>Aberrance  Type of Gene A:</B></td>
					      		   <td><s:property value="#memainTable.get(0).getAberrancetype1()"/></td>
					      		   <td style="text-align:right;"><B>Aberrance Type of Gene B:</B></td>
			               		   <td><s:property value="#memainTable.get(0).getAberrancetype2()"/></td>
					      		</tr>
		            	</tbody>       
		               </table>
                     </div>
                  </div>
            	</div>
              </div>
            </div>
            <s:if test="%{#mesubTable.size > 0}">
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
              	<div class="x_panel">
                  <div class="x_title">
                    <h2><i class="fa fa-file-powerpoint-o"></i> Paper  Information</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content" id="paperCardContainer">
<!--                       <div class="paperCard"> -->
<!--                          <h2 style="margin-top:0px;margin-left:8px;"><i class="fa fa-tag"></i> Evidence</h2> -->
<!--                           <table class="paperInformation"> -->
<!-- 			            	<tbody> -->
<!-- 			               		<tr> -->
<!-- 			               		   <td><B>GeneA Aberrance Site</B></td> -->
<%-- 			               		   <td><s:property value="#mesubTable.get(0).getAberrancesite1()"/></td> --%>
<!-- 			               		</tr> -->
<!-- 			               		<tr> -->
<!-- 			               		   <td><B>GeneB Aberrance Site</B></td> -->
<%-- 			               		   <td><s:property value="#mesubTable.get(0).getAberrancesite2()"/></td> --%>
<!-- 			               		</tr> -->
<!-- 			               		<tr> -->
<!-- 			               		   <td><B>Description</B></td> -->
<%-- 			               		   <td><s:property value="#mesubTable.get(0).getDescription()"/></td> --%>
<!-- 			               		</tr> -->
<!-- 			               		<tr> -->
<!-- 			               		   <td><B>PMID</B></td> -->
<%-- 			               		   <td><a target="_blank" href='https://www.ncbi.nlm.nih.gov/pubmed/<s:property value="#mesubTable.get(0).getPmid()"/>' style="pointer:cursor;"><span class="linkedOut"><s:property value="#mesubTable.get(0).getPmid()"/></span></a></td> --%>
<!-- 			               		</tr> -->
<!-- 			            	</tbody>    -->
<!-- 			            </table> -->
<!--                       </div>   -->
			            
                  </div>
                   
            	</div>
              </div>
            </div>
            </s:if>
<%--             <s:if test="%{#memainTable.get(0).getPlotimage() != ' '}">        --%>
	         <div id="plotME" class="row" style="display:none">
              <div class="col-md-12 col-sm-12 col-xs-12">
              	<div class="x_panel">
                  <div class="x_title">
                    <h2><i class="fa fa-line-chart"></i> Mutual Exclusivity Plot</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
			            <div>
	         	            <img src='../<s:property value="#memainTable.get(0).getPlotimage()"/>' width="1500px" height="300px"/>
	                    </div>
                  </div>
            	</div>
              </div>
             </div>
<%--             </s:if> --%>
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
    <!-- jQuery -->
    <script src="../js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../js/bootstrap.min.js"></script>
    <!-- NProgress -->
    <script src="../js/nprogress.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="../js/custom.min.js"></script>
    <script>
       var $createCard = function(x,i){
       	$("#paperCardContainer").append('<div class="paperCard"><h2 style="margin-top:3px;margin-left:8px;"><i class="fa fa-tag"></i> Evidence'+i+'</h2><table class="paperInformation"><tbody><tr><td style="text-align:right;"><B>GeneA Aberrance Site:</B></td><td>'+x.aberrancesite1+'</td></tr><tr><td style="text-align:right;"><B>GeneB Aberrance Site:</B></td><td>'+x.aberrancesite2+'</td></tr><tr><td style="text-align:right;"><B>Description:</B></td><td>'+x.description+'</td></tr><tr><td style="text-align:right;"><B>PMID:</B></td><td><a target="_blank" href="https://www.ncbi.nlm.nih.gov/pubmed/'+x.pmid+'"style="pointer:cursor;"><span class="linkedOut">'+x.pmid+'</span></a></td></tr></tbody></table></div>');
       }
       var mesubMatrix = <%=request.getAttribute("mesubMatrix")%>;
       for(var i = 0;i<mesubMatrix.length;i++){
      		$createCard(mesubMatrix[i],i+1);
       }
    </script>
    <script>
        var plot = '<s:property value="#memainTable.get(0).getPlotimage()"/>';
        if(plot != ' '){
        	$("#plotME").css("display","block");
        }
    	
    </script>
  </body>
</html>