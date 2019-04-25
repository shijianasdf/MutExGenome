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
    <style>
    	.help{
    		font-size:16px;
    	}
    	.content{
    		font-size:16px;
    		margin-bottom:20px;
    		border: 1px solid rgb(238,232,225);
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
              <div class="col-md-12 col-sm-12 col-xs-12">
                  <div class="x_panel">
                  <div class="x_title">
                  	<h2><i class="fa fa-book"></i> Help</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
<!--                   <br/> -->
                    <div class="content">
                       <div>
                       	<B style="margin:5px 5px 5px 5px;">Help Tutorial</B>
                        <form style="margin:15px 15px 15px 35px;">
                        	<ul>
	                        	<li><a href="#Overview">Overview of MutExGenome</a></li>
	                        	<li><a href="#Homepage">Home page help</a></li>
	                        	<li><a href="#Quick">Quick search help</a></li>
	                        	<li><a href="#Browse">Browse help</a></li>
	                        	<li><a href="#Search">Search help</a>
	                        		<ul>
	                        			<li><a href="#External">Search External Relations</a></li>
	                        			<li><a href="#Internal">Search Internal Relations</a></li>
	                        		</ul>
	                        	</li>
	                        	<li><a href="#Datatable">MutExGenome data table</a></li>
	                        	<li><a href="#Details">MutExGenome details</a></li>
	                        	<li><a href="#Download">Download help</a></li>
	                        	<li><a href="#Submit">Submit Help</a></li>
                        	</ul>
                        </form> 
                       </div>              	
                    </div>
                    <div class="help">
	                     <div id="Overview" style="margin-top:10px;border:1px solid rgb(238,232,225);">
	                     	<B style="margin:5px 5px 5px 5px;">Overview of MutExGenome</B><br/>
		                     <p style="margin:15px 15px 15px 15px;">
		                     	MutExGenome is a resource that comprehensive curated mutually exclusive alterations in cancer genome and integrated Fisher’s statistically inferred from The Cancer Genome Atlas. Currently, MutExGenome documents 75,714 mutually exclusive relationships involving 140 human cancers of 27 tissue origins. MutExGenome provides a user-friendly interface for conveniently browsing pan-cancer map of oncogenic dependencies, and mutually exclusive network of genetic alterations, searching and downloading the mutually exclusive genomic events in various cancers. In addition, MutExGenome provides a submission function that allows researchers to submit novel mutually exclusive associations that are not documented. 
								<br/>The detailed usage of the database is as followings:
		                     </p>
	                     </div>
						 <div id="Homepage" style="margin-top:10px;border:1px solid rgb(238,232,225);">
						 	<B style="margin:5px 5px 5px 5px;">Home page help</B>
		                     <p style="margin:15px 15px 15px 15px;">
		                     	The home page contains two schematic diagrams to help users understand our database. The left figure is a conceptual graph illustrating the mutually exclusive genomic relationships across patients. The right figure in the home page shows a human body, some common cancers are marked as abbreviations to facilitate the user to quickly browse mutually exclusive pairs in the marked cancer type. For example, after clicking the 'OV' link, the search engine will run and return the results containing a table showing all related mutually exclusive events and corresponding mutually exclusive network associated with ovarian cancer(as figure below shows).
		                     </p>
		                     <div style="width:1500px;margin:1px auto;"><img src="../images/helpImages/1.png" style="width:1500px"/></div>
		                     <div style="width:1500px;margin:1px auto;"><img src="../images/helpImages/2.png" style="width:1500px"/></div>
		                     <div style="width:1500px;margin:1px auto;"><img src="../images/helpImages/3.png" style="width:1500px"/></div>
						 </div>
	                     
	                     <div id="Quick" style="margin-top:10px;border:1px solid rgb(238,232,225);">
	                     	<B style="margin:5px 5px 5px 5px;">Quick search help</B>
		                     <p style="margin:15px 15px 15px 15px;">
		                     	On the home page, users also can search mutually exclusive events by inputting the gene symbol or cancer name of interest. In this page, only one term could be used, for combined search, please go to “Search” module. For example, after inputting BRCA1, the search engine will run and return the results containing a table showing all mutually exclusive partners associated with BRCA1 and corresponding mutually exclusive network (as figure below shows).
		                     </p>
		                     <div style="width:1500px;margin:1px auto;"><img src="../images/helpImages/4.png" style="width:1500px"/></div>
		                     <div style="width:1500px;margin:1px auto;"><img src="../images/helpImages/5.png" style="width:1500px"/></div>
		                     <div style="width:1500px;margin:1px auto;"><img src="../images/helpImages/6.png" style="width:1500px"/></div>
	                     </div>
	                     
	                     <div id="Browse" style="margin-top:10px;border:1px solid rgb(238,232,225);">
	                     	<B style="margin:5px 5px 5px 5px;">Browse help</B>
		                     <p style="margin:15px 15px 15px 15px;">
		                     	The browse page is built based on standardized classification scheme of cancer (according to Oncotree database) and different hierarchical classification of aberrant events. To browse the mutually exclusive entries related a particular cancer types (for Papillary Thyroid Cancer), please click 'Cancers'(1 in figure below), then choose the tissue origin 'Thyroid' and corresponding cancer type 'Papillary Thyroid Cancer' (2, 3 in figure below). The related mutually exclusive entries will show on table format on the top panel, as well as mutually exclusive network on the bottom panel. Similarly, the users can browse all entries associated with an interested somatic event (Genes, Chromosomal Events OR Structural Variation Events) in a similar way.
		                     </p>
		                      <div style="width:1500px;margin:1px auto;"><img src="../images/helpImages/7.png" style="width:1500px"/></div>
	                     </div>
                     	<div id="Search" style="margin-top:10px;border:1px solid rgb(238,232,225);">
	                     	<B style="margin:5px 5px 5px 5px;">Search help</B>
		                     <p style="margin:15px 15px 15px 15px;">
		                        <B ><span id="External">Search External Relations</span></B><br/>
		                     	"Search External Relations" module allows users to search the associated mutually exclusive partners with inputted genes in specific cancer. For example, user can input a gene or gene set but must be less than ten genes, and select a cancer name to query related mutually exclusive partners with inputted genes in specific cancer type. We used bladder urothelial carcinoma as example to search NFE2L2, PIK3CA and ERCC2 mutually exclusive partners. After putting gene symbol separated by commas, choosing bladder urothelial carcinoma from the drop-down menu, and clicking Submit, the system will return all mutually exclusive events associated with gene NFE2L2, PIK3CA and ERCC2, respectively, in bladder urothelial carcinoma.
		                     </p>
		                     <div style="width:1500px;margin:1px auto;"><img src="../images/helpImages/8.png" style="width:1500px"/></div>
		                     <div style="width:1500px;margin:1px auto;"><img src="../images/helpImages/9.png" style="width:1500px"/></div>
		                     <p style="margin:15px 15px 15px 15px;">
		                        <B ><span id="Internal">Search Internal Relations</span></B><br/>
		                     "Search Internal Relations" module is a function to search mutually exclusive relationships within the inputted or pre-defined gene set in the specific cancer type. Users can input multiple genes but no less than two genes, and select a cancer name to query related mutually exclusive relationships in MutExGenome. Users can also use our predefined gene sets to search mutually exclusive relationships in a particular cancer. Here, we take glioblastoma multiforme as an example to search mutually exclusive relationships in predefined Wnt pathway gene set. First, choose the predefined ‘Wnt pathway’ in the 'Defined Gene Sets' box (1 in figure below), and input glioblastoma multiforme in the 'Diseases' search box (2 in figure below), and then click search button (3 in figure below). After finishing 4 steps above, the system will return a table showing relationships with each other and corresponding mutually exclusive network. 
		                     </p>
		                     <div style="width:1500px;margin:1px auto;"><img src="../images/helpImages/10.png" style="width:1500px"/></div>
		                     <div style="width:1500px;margin:1px auto;"><img src="../images/helpImages/11.png" style="width:1500px"/></div>
	                     </div>
	                     <div id="Datatable" style="margin-top:10px;border:1px solid rgb(238,232,225);">
	                     	<B style="margin:5px 5px 5px 5px;">MutExGenome data table</B>
	                     	<p style="margin:15px 15px 15px 15px;">
	                     		MutExGenome results are organized in a data table, with a mutually exclusive relationship record on each line containing “Tissue Origin”, “Cancer Type”, “Subtype”, “Gene Symbol”, “Aberrance Type”, “Method” and “Details”. Users can click on the different download formats button to download the data table, and the “Details” button to view detailed information of the specific entry.
	                     	</p>
	                     	<div style="width:1500px;margin:1px auto;"><img src="../images/helpImages/12.png"/></div>
	                     </div>
	                     <div id="Details" style="margin-top:10px;border:1px solid rgb(238,232,225);">
	                     	<B style="margin:5px 5px 5px 5px;">MutExGenome details</B>
	                     	<p style="margin:15px 15px 15px 15px;">Users can obtain detailed information on each mutually exclusive entry by clicking on the “Details” button of the data table, which opens a page containing comprehensive information of the single record and provides links to external annotation web sites, as well as mutually exclusive heat map if possible.</p>
	                     	<div style="width:1500px;margin:1px auto;"><img src="../images/helpImages/13.png" style="width:1500px;"/></div>
	                     </div>
	                     <div id="Download" style="margin-top:10px;border:1px solid rgb(238,232,225);">
	                     	<B style="margin:5px 5px 5px 5px;">Download help</B>
	                     	<p style="margin:15px 15px 15px 15px;">To download data in the MutExGenome, select the menu 'Download'. MutExGenome provides downloadable file in TEXT format. The users can download all data in MutExGenome, including three files about mutually exclusive events from manually curated, method extracted and Fisher’s predicted, respectively.</p>
	                     </div>
	                     <div id="Submit" style="margin-top:10px;border:1px solid rgb(238,232,225);">
	                     	<B style="margin:5px 5px 5px 5px;">Submit Help</B>
	                     	<p style="margin:15px 15px 15px 15px;">MutExGenome offers a submission page that enables other researchers to submit novel mutually exclusive association data. Once approved by the submission review committee, the submitted record will be included in the MutExGenome database and made available to the public in the update release.</p>
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