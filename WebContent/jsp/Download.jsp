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
    <link rel="stylesheet" href="../css/loading.css" type="text/css" media="screen" />
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
              <div class="col-md-12 col-sm-12 col-xs-12">
                  <div class="x_panel">
                  <div class="x_title">
                  	<h2><i class="fa fa-download"></i> Download</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                  <br/>
                  <table style="font-size:16px;"class="table table-bordered table-hover col-lg-9">
							<thead><tr><th>Title</th><th>Description</th><th>Files</th></tr></thead>
							<tbody><tr>
								<td style="width:300px;text-align:left;">Manually curated mutually exclusive relationships from published articles</td>
								<td>
								By manually curating over 3,000 published articles, we collected 1,535 mutually exclusive genomic events involving 124 human cancers of 24 tissue origins. <br/>
								The file is in TEXT format containing "Tissue Origin","Cancer Type","Subtype","Gene Name","Aberrance Type","Aberrance Site","Description","Evidence" and "PubMed ID".	
								</td>
								<td><a href="/MutExGenome/download/Textming_download_MEdata.txt" class="btn btn-primary"><i class="fa fa-download"></i> Download</a></td>
							</tr>
							<tr>
								<td rowspan="2" style="width:300px;height:50px;vertical-align:center !important;">Manually extracted mutually exclusive relationships from computational methods</td>
								<td>We extracted 9,763 mutually exclusive relationships involving 40 human cancers of 23 tissue origins from 23 previous released computational methods.<br/>
								    The data format is the same as manually curated mutually exclusive data.								    
								</td>
								<td><a href="/MutExGenome/download/Algorithm_download_MEdata.txt" class="btn btn-primary"><i class="fa fa-download"></i> Download</a></td>
							</tr>
							<tr>
<!-- 								<td>Fisher’s calculated mutual exclusive data</td> -->
								<td>Using Fisher‘s exact test, we calculated more than 64,619 mutually exclusive pairs from more than 8,000 tumors in 21 different cancer types profiled by The Cancer Genome Atlas.<br/>
								    The file is in TEXT format containing  "Tissue origin","Cancer Type","Subtype","Gene Name","Variation Type" and “Evidence”.							    
								</td>
								<td><a href="/MutExGenome/download/TCGA_download_MEdata.txt" class="btn btn-primary"><i class="fa fa-download"></i> Download</a></td>
							</tr>
							</tbody>
						</table>
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

    <!-- jQuery -->
    <script src="../js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../js/bootstrap.min.js"></script>
    <!-- NProgress -->
    <script src="../js/nprogress.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="../js/custom.min.js"></script>
 
  </body>
</html>