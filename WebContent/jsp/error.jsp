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
                  	<h2><i class="fa fa-bug"></i> Error</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                  <br/>
                  <div class="alert alert-danger alert-dismissible fade in" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                    </button>
                    <strong><s:property value="exception.message"/></strong>
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