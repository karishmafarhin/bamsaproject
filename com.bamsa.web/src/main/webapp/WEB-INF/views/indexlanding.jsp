<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Welcome To BAMSA</title>
    <meta name="description" content="">

    <!-- CSS FILES -->
    <link rel="stylesheet" href='<c:url value="/static/css/landingcss/bootstrap.min.css"/>' />
    <link rel="stylesheet" href='<c:url value="/static/css/landingcss/style.css"/>' />
    <link rel="stylesheet" href='<c:url value="/static/css/landingcss/fractionslider.css"/>' />
    <link rel="stylesheet" href='<c:url value="/static/css/landingcss/style-fraction.css"/>' />
    <link rel="stylesheet" type="text/css" href='<c:url value="/static/css/landingcss/style.css"/>' media="screen" data-name="skins">
       <link rel="stylesheet"
	href='<c:url value="/static/font-awesome/css/font-awesome.min.css"/>' />
        <link rel="stylesheet" href='<c:url value="/static/fonts/fontawesome-webfont.eot"/>' />
        <link rel="stylesheet" href='<c:url value="/static/fonts/fontawesome-webfont.woff"/>' />
        <link rel="stylesheet" href='<c:url value="/static/fonts/fontawesome-webfont.woff2"/>' />
    



    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!--Start Header-->
<header id="header">
    <div id="top-bar">
        <div class="container">
            <div class="row">
                <div class="col-sm-7 hidden-xs top-info">
                    <span><i class="fa fa-phone"></i>Phone: 7893615246</span>
                    <span><i class="fa fa-envelope"></i>Email: info@prodesigntek.com</span>
                </div>
                 <div class="col-sm-offset-5">
                    <span><i class="fa fa-sign-in" aria-hidden="true" style="margin-left: 389px;"></i>&nbsp;<a href="login" style="color:white">Login/SignIn</a></span>
                    
                </div>
            </div>
        </div>
    </div>
    <!-- LOGO bar -->
    <div id="logo-bar" class="clearfix">
        <!-- Container -->
        <div class="container">
            <div class="row">
                <!-- Logo / Mobile Menu -->
                <div class="col-xs-12">
                    <div id="logo">
                        <h1><img src="<c:url value="static/img/images/logo.png"/>"  /></h1>
                    </div>
                </div>
            </div>
        </div>
        <!-- Container / End -->
    </div>
    <!--LOGO bar / End-->

    <!-- Navigation
================================================== -->

        <!--  <div class="container">-->
        <div class="row">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="navbar-collapse collapse">
                
                    </li>

                </ul>
            </div>
        </div><!--/.row -->
        <!--</div>--><!--/.container -->
    </div>
</header>
<!--End Header-->

<!--start wrapper-->
<section class="wrapper">
    <div class="slider-wrapper">
        <div class="slider">
            <div class="fs_loader"></div>
            <div class="slide">

                <img src="<c:url value="static/img/images/base.jpg"/>" width="1920" height="auto" data-in="fade" data-out="fade" />

                <img src="<c:url value="static/img/images/slider-boy.png"/>" width="500" height="auto" data-position="60,1200" data-in="bottomLeft" data-out="fade" style="width:auto; height:auto" data-delay="500">

                <p class="slide-heading" data-position="130,380" data-in="top"  data-out="left" data-ease-in="easeOutBounce" data-delay="700">BAMSA</p>

                <p class="sub-line" data-position="230,380" data-in="right" data-out="left" data-delay="1500"><b>Business Automation Monitoring System Application </b></p>

                <a href="#!"	class="btn btn-default btn-lg" data-position="330,380" data-in="bottom" data-out="bottom" data-delay="2000">Download Now</a>
            </div>

            <div class="slide">
                <img src="<c:url value="static/img/images/base_2.jpg"/>" width="1920" height="auto" data-in="fade" data-out="fade" />

                <p class="slide-heading" data-position="130,380" data-in="right"  data-out="left" data-ease-in="jswing">KRI,KPI & KPA </p>

                <p class="sub-line" data-position="225,380" data-in="right" data-out="left"  data-delay="1500"><b>TRACK-MONITOR-CONTROL ORGANIZATION IN 360???</b></p>

                <img src="<c:url value="static/img/images/slider-girl.png"/>" width="400" height="auto" data-position="50,1200" data-in="left" data-out="fade" style="width:auto; height:auto" data-delay="500">

                <p	class="sub-line" data-position="320,380" data-in="bottom" data-out="bottom" data-delay="2000"><b>Workflow Automation</b></p>
            </div>

            <div class="slide">
                <img src="<c:url value="static/img/images/base_3.jpg"/>"  width="1920" height="auto" data-in="fade" data-out="fade" />

                <p class="slide-heading" data-position="130,370" data-in="top" data-out="top" data-ease-in="easeOutBounce" data-delay="1500">Responsive Design</p>

                <p class="sub-line" data-position="230,370" data-in="right" data-out="left" data-delay="2500"><b>Accessible from any where and any device</b></p>

                <img src="<c:url value="static/img/images/laptop.PNG"/>" width="456" height="272" data-position="115,1180" data-in="bottom" data-out="bottom" data-delay="400">

                <img src="<c:url value="static/img/images/mack.PNG"/>" width="357" height="313" data-position="90,1040" data-in="top" data-out="bottom" data-delay="200">

                <img src="<c:url value="static/img/images/ipad.PNG"/>" width="120" height="170" data-position="230,1030" data-in="left" data-out="left" data-delay="300">

                <img src="<c:url value="static/img/images/smartphone.PNG"/>" width="70" height="140" data-position="270,1320" data-in="right" data-out="right" data-delay="300">

                <p	class="btn btn-default btn-lg" data-position="320,370" data-in="bottom"  data-out="bottom" data-delay="3500"><b>Integrates with all Departments for Performance review</b></p>
            </div>
        </div>
    </div>
    <!--End Slider-->

    <!--start info service-->
    <section class="info_service">
        <div class="container">
            <div class="row sub_content">
                <div class="rs_box">
                    <div class="col-sm-5 col-md-4 col-lg-4">

                        <div class="serviceBox_1">
                            <div class="icon_service">
                    <i class="fa fa-hand-o-right"></i>
                              <h3>Align your business units &amp;processes</h3>
                            </div>
                           
                        </div>
                    </div>

                        <div class="col-sm-5 col-md-6 col-lg-5">
                        <div class="serviceBox_1">
                            <div class="icon_service">
                    <i class="fa fa-hand-o-right"></i>
                                <h3>Communicate strategy across your organization</h3>
                            </div>
                            
                        </div>
                    </div>

                      <div class="col-sm-2 col-md-2 col-lg-3">
                        <div class="serviceBox_1">
                    <div class="icon_service" style="margin-right: -15px;">
                    <i class="fa fa-hand-o-right"></i>
                                <h3>Act to drive performance</h3>
                            </div>
                            
                        </div>
                    </div>

                </div>
            </div>
            <div class="row sub_content">
                <div class="rs_box">
                     <div class="col-sm-4 col-md-3 col-lg-4">
                        <div class="serviceBox_1">
                            <div class="icon_service">
                    <i class="fa fa-hand-o-right"></i>
                                <h3>Workflow Automation</h3>
                            </div>
                           
                        </div>
                    </div>

                    <div class="col-sm-5 col-md-6 col-lg-5">
                        <div class="serviceBox_1">
                            <div class="icon_service">
                    <i class="fa fa-hand-o-right"></i>
                                <h3>Translate strategy into a measurable framework</h3>
                            </div>
                            
                        </div>
                    </div>

                     <div class="col-sm-3 col-md-3 col-lg-3">
                        <div class="serviceBox_1">
                            <div class="icon_service">
                    <i class="fa fa-hand-o-right"></i>
                                <h3>Track Assets of firm</h3>
                            </div>
                            
                        </div>
                    </div>

                </div>
            </div>


                </div>
            </div>
        </div>
    </section>
    <!--end info service-->

    
    
<!--end footer-->

<section class="footer_bottom">
    <div class="container pull-center">
        <div class="row ">
            <div class="col-lg-9">
                <p class="copyright"><center style="margin-left: 278px;">?? Copyright 2017 Prodesign | Powered by  <a href="http://www.prodesigntek.com/" style="color: black;"><b>Prodesign Technologies</b></a></center></a></p>
            </div>

           
                
                    
                        
                       
        </div>
    </div>
</section>
<script src='<c:url value="/static/js/landingjs/jquery-1.10.2.min.js"/>'></script>
<script src='<c:url value="/static/js/landingjs/bootstrap.min.js"/>'></script>
<script src='<c:url value="/static/js/landingjs/jquery.easing.1.3.js"/>'></script>
<script src='<c:url value="/static/js/landingjs/retina-1.1.0.min.js"/>'></script>
<script src='<c:url value="/static/js/landingjs/jquery.cookie.js"/>'></script>
<script src='<c:url value="/static/js/landingjs/jquery.fractionslider.js"/>'></script>
<script src='<c:url value="/static/js/landingjs/jquery.jcarousel.js"/>'></script>
<script src='<c:url value="/static/js/landingjs/jflickrfeed.js"/>'></script>
<script src='<c:url value="/static/js/landingjs/jquery.magnific-popup.min.js"/>'></script>
<script src='<c:url value="/static/js/landingjs/jquery.isotope.min.js"/>'></script>
<script src='<c:url value="/static/js/landingjs/swipe.js"/>'></script>
<script src='<c:url value="/static/js/landingjs/main.js"/>'></script>



<script>
    $(window).load(function(){
        $('.slider').fractionSlider({
            'fullWidth': 			true,
            'controls': 			true,
            'responsive': 			true,
            'dimensions': 			"1920,450",
            'timeout' :             5000,
            'increase': 			true,
            'pauseOnHover': 		true,
            'slideEndAnimation': 	false,
            'autoChange':           true
        });
    });
</script>
</body>
</html>