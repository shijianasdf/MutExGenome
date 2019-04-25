<!DOCTYPE html>
<html lang="en">
  <head>
    <meta  name="keywords" content="Driver mutations,driver mutations,Mutual exclusivity,biological database, bioinformatics">
	<meta  name="description" content="Search and download the information for the Mutual exclusivity. MutExGenome is a database of Mutual Exclusive mutations in mutiple species.">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <link rel="shortcut icon" href="images/favicon.png"> 
    <title>MutExGenome</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- jquery-ui -->
	<link rel="stylesheet" href="css/jquery-ui-1.10.0.custom.css">
    <!-- Font Awesome -->
    <link href="css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
<!--     <link href="css/nprogress.css" rel="stylesheet"> -->
    <!-- Custom Theme Style -->
    <link href="css/custom.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js"></script>
    <!-- jquery UI -->
	<script src="js/jQueryUI/jquery-ui.min.js"></script>
    <!-- NProgress -->
<!--     <script src="js/nprogress.js"></script> -->
    
    <style>
  .ui-autocomplete {
    max-height: 100px;
    overflow-y: auto;
    /* 闃叉姘村钩婊氬姩鏉� */
    overflow-x: hidden;
  }
  /* IE 6 涓嶆敮鎸� max-height
   * 鎴戜滑浣跨敤 height 浠ｆ浛锛屼絾鏄繖浼氬己鍒惰彍鍗曟�绘槸鏄剧ず涓洪偅涓珮搴�
   */
  * html .ui-autocomplete {
    height: 100px;
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
        <!-- /top navigation -->
        <!-- page content -->
        <div class="right_col" role="main">
          <div class="" >
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2 style="font-size:20px;"><i class="fa fa-info-circle"></i> Welcome to MutExGenome (Mutual Exclusive Alterations in Cancer Genome)<small></small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                  <div class="row">
                  	<div class="col-md-9 col-sm-9 col-xs-9">
                   <img src="images/mainPage/workflow.png" style="display:block;width:95%;margin-left:10px;margin-top:5px;height:500px;"/>
					<br />
                  </div>
                  	<div class="col-md-3 col-sm-3 col-xs-3" style="position:relative;">
<!--                  <h4><i class="fa fa-bar-chart-o"></i> Statistics</h4> -->
						  <img src="images/mainPage/tissue.png" style="margin-top:5px;width:300px;height:500px;"/>
						  	<span style="position: absolute; top: -2%; left: -10%; color:gray;cursor: default;"><a style="color:rgb(144,11,9);cursor: default;font-size:17px;">Quick Browse</a></span>
							<span style="position: absolute; top: 3.0%; left: 16%;"><a style="color:#7E3F98;" target="_blank" href="jsp/Memain!QuickSearch?param=Uveal Melanoma">UM</a></span>
							<span style="position: absolute; top: 2.8%; left:65%;"><a style="color:#57B87B;" target="_blank" href="jsp/Memain!QuickSearch?param=Glioblastoma">GBM</a></span>
<!-- 							<span style="position: absolute; top: 45px; left: 43px;"><a target="_blank" href="jsp/Memain!AdvancedSearch?diseases=Uveal Melanoma&genes=">UM</a></span> -->
							<span style="position: absolute; top: 68px; left: 40px;"><a style="color:#78502D;" target="_blank" href="jsp/Memain!QuickSearch?param=Head and Neck Squamous Cell Carcinoma">HNSC</a></span>
<!-- 							<span style="position: absolute; top: 67px; left: 28px;"><a target="_blank" href="jsp/Memain!QuickSearch?param=Lymphoid Neoplasm">LNM</a></span>	 -->
				            <span style="position: absolute; top: 196px; left:293px;"><a style="color:#EA767A;" target="_blank" href="jsp/Memain!QuickSearch?param=Stomach Adenocarcinoma">STAD</a></span>
			                  <span style="position: absolute; top: 138px; left: 23px;"><a style="color:#E7CE80;" target="_blank" href="jsp/Memain!QuickSearch?param=Lung Adenocarcinoma">LUAD</a></span>
<!-- 			                  <span style="position: absolute; top: 120px; left: 5px;"><a target="_blank" href="jsp/Memain!AdvancedSearch?diseases=Lung Squamous Cell Carcinoma&genes=">LUSC</a></span> -->
			                  <span style="position: absolute; top: 142px; left: 287px;"><a style="color:#F14EAF;" target="_blank" href="jsp/Memain!QuickSearch?param=Invasive Breast Carcinoma">BRCA</a></span>
			                  <span style="position: absolute; top: 416px; left: 11px;"><a style="color:#BF1C2C;" target="_blank" href="jsp/Memain!QuickSearch?param=Non-Seminomatous Germ Cell Tumor">NSGCT</a></span>
			                  <span style="position: absolute; top: 267px; left:9px;"><a style="color:#EE3D34;" target="_blank" href="jsp/Memain!QuickSearch?param=Renal Clear Cell Carcinoma">KIRC</a></span>
<!-- 			                  <span style="position: absolute; top: 380px; left: -26px;"><a target="_blank" href="jsp/Memain!AdvancedSearch?diseases=Prostate Adenocarcinoma&genes=">PRAD</a></span> -->
			                  <span style="position: absolute; top: 454px; left:290px;"><a style="color:#9FCB62;" target="_blank" href="jsp/Memain!QuickSearch?param=Melanoma">MEL</a></span>
<!-- 			                  <span style="position: absolute; top: 222px; left: -14px;"><a target="_blank" href="jsp/Memain!AdvancedSearch?diseases=Pancreatic Adenocarcinoma&genes=">PAAD</a></span> -->
			                  <span style="position: absolute; top: 412px; left:292px;"><a style="color:#F7B161;" target="_blank" href="jsp/Memain!QuickSearch?param=Cervical Squamous Cell Carcinoma">CESC</a></span>
			                  <span style="position: absolute; top: 195px; left: 20px;"><a style="color:#C4ADCD;" target="_blank" href="jsp/Memain!QuickSearch?param=Hepatocellular Carcinoma">HCC</a></span>
			                  <span style="position: absolute; top: 110px; left:280px;"><a style="color:#BB8C7F;" target="_blank" href="jsp/Memain!QuickSearch?param=Thymic Epithelial Tumor">TET</a></span>
<!-- 			                  <span style="position: absolute; top: 288px; left:298px;"><a target="_blank" href="jsp/Memain!AdvancedSearch?diseases=Endometrial Carcinoma&genes=">UCEC</a></span> -->
			                  <span style="position: absolute; top: 376px; left:3px;"><a style="color:#4AA0CC;" target="_blank" href="jsp/Memain!QuickSearch?param=Bladder Urothelial Carcinoma">BLCA</a></span>
			                  <span style="position: absolute; top: 456px; left: 46px;"><a style="color:#B7422F;"target="_blank" href="jsp/Memain!QuickSearch?param=Acute Myeloid Leukemia">AML</a></span>
			                  <span style="position: absolute; top: 303px; left: 305px;"><a style="color:#B9539F;" target="_blank" href="jsp/Memain!QuickSearch?param=Ovarian Cancer">OV</a></span>
			                  <span style="position: absolute; top: 265px; left: 298px;"><a style="color:#70D0F1;" target="_blank" href="jsp/Memain!QuickSearch?param=Colorectal Adenocarcinoma">COAD&READ</a></span>
			                  <span style="position: absolute; top: 70px; left: 265px;"><a style="color:#FAED2D;" target="_blank" href="jsp/Memain!QuickSearch?param=Well-Differentiated Thyroid Cancer&genes=">WDTC</a></span>
			                 
                  </div>
                  </div>
                  <hr style="color:rgb(0,160,90)"/>
                     <div class="row">
                     	<div class="col-md-8 col-sm-8 col-xs-8">
                     	  <div style="margin-right:20px;">
                     	  	<p style="margin-left:5px;padding-left:0px;font-size:16px;line-height:160%;">
									<B>Overview of MutExGenome</B><br/>
Mutual exclusivity, one of the most important evolutionary dependency patterns in cancer, refers to the phenomenon that genetic alteration of a group of functional relevant genes does not tend to occur in the same sample. MutExGenome is a comprehensive resource that focused on mutual exclusivity from oncogenic alterations across human cancers. The current release of MutExGenome documents <b><span style="color:rgb(144,11,9);">75,618</span></b> mutual exclusive relationships involving <b><span style="color:rgb(144,11,9);">141</span></b> human cancers of <b><span style="color:rgb(144,11,9);">27</span></b> tissue origins, in which <b><span style="color:rgb(144,11,9);">1,535</span></b> were collected by manually curating over <b><span style="color:rgb(144,11,9);">3,000</span></b> published articles, <b><span style="color:rgb(144,11,9);">9,763</span></b>  were extracted from diverse computational methods, and <b><span style="color:rgb(144,11,9);">64,619</span></b> were calculated from more than <b><span style="color:rgb(144,11,9);">8,000</span></b> tumors in <b><span style="color:rgb(144,11,9);">21</span></b> different cancer types profiled by The Cancer Genome Atlas.<br/>										
                     	    </p>
                     	  </div>
                     	</div>
                     	<div class="col-md-4 col-sm-4 col-xs-4">
                     	    
                     	    <span style="margin-left:10px;"><a style="color:rgb(144,11,9);font-size:17px;">Quick Search</a></span>
                     	    <form action="jsp/Memain!QuickSearch" method="post" data-parsley-validate class="form-horizontal form-label-left" style="font-size:14px;margin-top:10px;">
                     	    	<div class="form-group">
			                        <div class="col-md-12 col-sm-12 col-xs-12">
			                          <div class="input-group">
				                          <input id="autoComplete" name="param" data-toggle="popover" data-placement="left" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus." placeholder="TP53 or Ovarian Cancer"  value="TP53"  class="form-control"/> 
				                          <span class="input-group-btn">
	                                              <button type="submit" class="btn btn-primary">Go!</button>
	                                      </span>
			                          </div>
			                          <div class="form-group">
									<div style="font-size:12px;">
										<b>Examples:</b>
										<a href="jsp/Memain!QuickSearch?param=BRCA1">BRCA1</a>&nbsp;OR&nbsp;<a href="jsp/Memain!QuickSearch?param=Ovarian Cancer">Ovarian Cancer</a>
									</div>	
								</div>
			                        </div>
			                     </div>
                     	    </form>	
                     	    <div style="margin-left:10px;">
                     	    	 <B>Contacts</B><br/>
		                     	    <p>
										For questions, problems, comments on the database, please send a mail to <a><span style="color:red;">xiaoyun@ems.hrbmu.edu.cn</span></a>
									</p>
                     	    </div>
                     	   		
<!-- 					 		<div style="width:370px; margin:0 auto;"> -->
<!-- 			                  <script type="text/javascript" src="//ra.revolvermaps.com/0/0/7.js?i=023iw84dfj8&amp;m=6&amp;c=ff0000&amp;cr1=ffffff&amp;sx=0" async="async"></script> -->
<!-- 					 		</div> -->
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
<!-- Custom Theme Scripts -->
    <script src="js/custom.min.js"></script>
    <script>
	    var xmlGeneInfo = ""; 
		var xmlCancerInfo = "";
		$.ajax({
	        url: "xml/geneSymbol.xml",
	        dataType: 'xml',
	        timeout: 2000,
	        async:false,
	        error: function()
	        {
	        	//alert() 忙聳鹿忙鲁聲莽聰篓盲潞聨忙聵戮莽陇潞氓赂娄忙聹聣盲赂聙忙聺隆忙聦聡氓庐職忙露聢忙聛炉氓聮聦盲赂聙盲赂陋 OK 忙聦聣茅聮庐莽職聞猫颅娄氓聭聤忙隆聠
	            alert("error load xml");
	        },
	        success: function(xml){
	        	//氓聹篓xml/geneSymbol.xml忙聳聡忙隆拢盲赂颅氓炉禄忙聣戮<geneSymbol> </geneSymbol>盲赂颅忙聳聡忙聹卢氓聠聟氓庐鹿茂录聸 
	        	xmlGeneInfo = $(xml).find("geneSymbol").text();
	        }
	    });
		$.ajax({
	        url: "xml/cancer.xml",
	        dataType: 'xml',
	        timeout: 2000,
	        async:false,
	        error: function()
	        {
	        	//alert() 忙聳鹿忙鲁聲莽聰篓盲潞聨忙聵戮莽陇潞氓赂娄忙聹聣盲赂聙忙聺隆忙聦聡氓庐職忙露聢忙聛炉氓聮聦盲赂聙盲赂陋 OK 忙聦聣茅聮庐莽職聞猫颅娄氓聭聤忙隆聠
	            alert("error load xml");
	        },
	        success: function(xml){
	        	//氓聹篓xml/geneSymbol.xml忙聳聡忙隆拢盲赂颅氓炉禄忙聣戮<geneSymbol> </geneSymbol>盲赂颅忙聳聡忙聹卢氓聠聟氓庐鹿茂录聸 
	        	xmlCancerInfo = $(xml).find("cancer").text();
	        }
	    });
		var resultArr1 = xmlGeneInfo.split(","); 
		var resultArr2 = xmlCancerInfo.split(",");
		var resultArr = resultArr1.concat(resultArr2);
		//ID query 忙聵炉<form>猫隆篓氓聧聲氓聠聟氓庐鹿茂录聸
		$( "#autoComplete" ).autocomplete({
			max:15, 
			minLength:2,
			scrollHeight: 50,
			matchContains: true,
			delay:0,
			source: resultArr,
		});
		$("#autoComplete").focus(function(){
			$("#autoComplete").val("");
			$("#autoComplete").attr("placeholder","");
		});
		$("#autoComplete").blur(function(){
			var input = $("#autoComplete").val();
			if(input != ""){
				$("#autoComplete").val(input);
			}else{
				$("#autoComplete").val("TP53");
			}
			$("#autoComplete").attr("placeholder","TP53 or Ovarian Cancer");
		});
    </script>
  </body>
</html>