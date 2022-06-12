<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  errorPage="error.jsp"%>

<%@page import="java.io.*, com.itextpdf.text.*, com.itextpdf.text.pdf.*" %>

<%@page import="java.sql.*"%>
<%@page import= "java.util.Date"%>
<%@page import= "java.time.Month"%>
<%@page import= "java.time.LocalDate"%>
<%@page import= "java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat "%>
<%@page import="java.text.*"%>

 <%

 Calendar cal = Calendar.getInstance();
	Calendar cal1 = Calendar.getInstance();
	//String m =new SimpleDateFormat("MMMMM").format(cal.getTime())+"-"+new SimpleDateFormat("yyyy").format(cal.getTime()); 
	
	String m4 =new SimpleDateFormat("dd").format(cal1.getTime())+"-"+new SimpleDateFormat("MMM").format(cal1.getTime())+"-"+new SimpleDateFormat("yy").format(cal1.getTime());
	String m5 =new SimpleDateFormat("MMMM").format(cal1.getTime())+"/"+new SimpleDateFormat("yyyy").format(cal1.getTime());

 %>

<!DOCTYPE html>
<html lang="en">

<head>
      <title>Cash Oil</title>

  <!-- Favicons -->
  <link href="assets/images/cash.jpg" rel="icon">
    <!-- HTML5 Shim and Respond.js IE10 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 10]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="Mega Able Bootstrap admin template made using Bootstrap 4 and it has huge amount of ready made feature, UI components, pages which completely fulfills any dashboard needs." />
    <meta name="keywords" content="flat ui, admin Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="codedthemes" />
    <!-- Favicon icon -->
   
    <!-- Google font-->     <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap/css/bootstrap.min.css">
    <!-- waves.css -->
    <link rel="stylesheet" href="assets/pages/waves/css/waves.min.css" type="text/css" media="all">
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" type="text/css" href="assets/icon/font-awesome/css/font-awesome.min.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="assets/css/jquery.mCustomScrollbar.css">
    
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<!-- Bootstrap theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>

 <!-- /////////////////////        Data Table css /////////////////////    -->  
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap4.min.css"/>
    
</head>

<body>

<% 
String branch1 = (String)session.getAttribute("branch");
     if(request.getParameter("save")!=null)
    {
    	String month = m5;
    	String branch = branch1;
        String date = request.getParameter("date");
        String sold = request.getParameter("sold").replaceAll(",", "");
        String rate = request.getParameter("rate");
        
        try{
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
        pst = con.prepareStatement("insert into lubeSale(month,branch,date,litresSold,rate)values(?,?,?,?,?)");
        pst.setString(1, month);
        pst.setString(2, branch);
        pst.setString(3, date);
        pst.setString(4, sold);
        pst.setString(5, rate);
        pst.executeUpdate();  
         
        out.println("<script>var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');</script>");
        }catch(Exception e){
        	out.println("<script>alertify.error('Error'); </script>");
        }
    }
   %>
   
   
   <% 
    
     if(request.getParameter("update")!=null)
    {
    	
        String date = request.getParameter("date");
        String ltr = request.getParameter("ltr").replaceAll(",", "");
        String rate = request.getParameter("rate");
        String id = (String)session.getAttribute("id");
        
        System.out.println(ltr);
        try{
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
        pst = con.prepareStatement("update lubeSale set date=?,litresSold=?,rate=? where id=?");
        
        pst.setString(1, date);
        pst.setString(2, ltr);
        pst.setString(3, rate);
        pst.setString(4, id);
        pst.executeUpdate();  
         System.out.println("updated........");
        out.println("<script>var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');</script>");
        }catch(Exception e){
        	out.println("<script>alertify.error('Error'); </script>");
        }
    }
   %>

<%
  	try{
	Class.forName("com.mysql.jdbc.Driver"); 

	String b=null;
	String p=null;
	
        response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
	    String branch = (String)session.getAttribute("branch");
	    String pass = (String)session.getAttribute("pass");
	
        Connection con;
     
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
        Statement statement = con.createStatement();
	ResultSet resultSet = statement.executeQuery("select * from login where branch='"+branch+"' and '"+pass+"'");
	
	while(resultSet.next()){
		b=resultSet.getString("branch");
		p=resultSet.getString("password");
	}
	
         
        if(!pass.equals(p) || !branch.equals(b) || pass.equals(null) || pass.equals("")){
              response.sendRedirect("index.jsp");   
        }
  	}catch(Exception e){
  		 response.sendRedirect("index.jsp"); 
  		 
  	}
        %>

<!-- Pre-loader start -->
<div class="theme-loader">
    <div class="loader-track">
        <div class="preloader-wrapper">
            <div class="spinner-layer spinner-blue">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
            <div class="spinner-layer spinner-red">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
            
            <div class="spinner-layer spinner-yellow">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
            
            <div class="spinner-layer spinner-green">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Pre-loader end -->
<div id="pcoded" class="pcoded">
    <div class="pcoded-overlay-box"></div>
    <div class="pcoded-container navbar-wrapper">
          <nav class="navbar header-navbar pcoded-header">
              <div class="navbar-wrapper">
                  <div class="navbar-logo">
                      <a class="mobile-menu waves-effect waves-light" id="mobile-collapse" href="#!">
                          <i class="ti-menu"></i>
                      </a>
                      <div class="mobile-search waves-effect waves-light">
                          <div class="header-search">
                              <div class="main-search morphsearch-search">
                                  <div class="input-group">
                                      <span class="input-group-addon search-close"><i class="ti-close"></i></span>
                                      <input type="text" class="form-control" placeholder="Enter Keyword">
                                      <span class="input-group-addon search-btn"><i class="ti-search"></i></span>
                                  </div>
                              </div>
                          </div>
                      </div>
                     
                  </div>
                
                  <div class="navbar-container container-fluid">
                      <ul class="nav-left">
                          <li>
                              <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                          </li>
                          <li class="header-search">
                              <div class="main-search morphsearch-search">
                                  <div class="input-group">
                                      <span class="input-group-addon search-close"><i class="ti-close"></i></span>
                                      <input type="text" class="form-control">
                                      <span class="input-group-addon search-btn"><i class="ti-search"></i></span>
                                  </div>
                              </div>
                          </li>
                          <li>
                              <a href="#!" onclick="javascript:toggleFullScreen()" class="waves-effect waves-light">
                                  <i class="ti-fullscreen"></i>
                              </a>
                          </li>
                      </ul>
                      <ul class="nav-right">
                          <li class="header-notification">
                              <a href="#!" class="waves-effect waves-light">
                                  <i class="ti-bell"></i>
                                  <span class="badge bg-c-red"></span>
                              </a>
                              <ul class="show-notification">
                                  <li>
                                      <h6>Notifications</h6>
                                      <label class="label label-danger">New</label>
                                  </li>
                                  <li class="waves-effect waves-light">
                                      <div class="media">
                                          <img class="d-flex align-self-center img-radius" src="assets/images/avatar-2.jpg" alt="Generic placeholder image">
                                          <div class="media-body">
                                              <h5 class="notification-user">John Doe</h5>
                                              <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                              <span class="notification-time">30 minutes ago</span>
                                          </div>
                                      </div>
                                  </li>
                                  <li class="waves-effect waves-light">
                                      <div class="media">
                                          <img class="d-flex align-self-center img-radius" src="assets/images/avatar-4.jpg" alt="Generic placeholder image">
                                          <div class="media-body">
                                              <h5 class="notification-user">Joseph William</h5>
                                              <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                              <span class="notification-time">30 minutes ago</span>
                                          </div>
                                      </div>
                                  </li>
                                  <li class="waves-effect waves-light">
                                      <div class="media">
                                          <img class="d-flex align-self-center img-radius" src="assets/images/avatar-3.jpg" alt="Generic placeholder image">
                                          <div class="media-body">
                                              <h5 class="notification-user">Sara Soudein</h5>
                                              <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                              <span class="notification-time">30 minutes ago</span>
                                          </div>
                                      </div>
                                  </li>
                              </ul>
                          </li>
                          <li class="user-profile header-notification">
                              <a href="#!" class="waves-effect waves-light">
                                  <i class="fa-solid fa-user-tie" style="font-size:18px;"></i>
                                  <span style="font-size:12px;">Welcome <% String name = (String)session.getAttribute("name"); out.println(name);%></span>
                                  <i class="ti-angle-down"></i>
                              </a>
                              <ul class="show-notification profile-notification">
                                  <li class="waves-effect waves-light">
                                      <a href="javascript:void(0)">
                                          <i class="ti-settings"></i> Settings
                                      </a>
                                  </li>
                                  
                                  <li class="waves-effect waves-light">
                                      <a href="posts.jsp">
                                          <i class="ti-email"></i>Posts From Head Office
                                      </a>
                                  </li>
                                  <!-- ///////////   ---------------   ////////////////-->
                                  <li class="waves-effect waves-light">
                                      <a data-toggle="modal" data-target="#resetModal">
                                          <i class="ti-reload"></i> Reset Account
                                      </a>
                                  </li>
                                 <li class="waves-effect waves-light">
                                      <a href="logOut">
                                          <i class="ti-share-alt"></i> Logout
                                      </a>
                                  </li>
                              </ul>
                          </li>
                      </ul>
                  </div>
              </div>
          </nav>
    
        <div class="pcoded-main-container">
            <div class="pcoded-wrapper">
                 <nav class="pcoded-navbar">
                      <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
                      <div class="pcoded-inner-navbar main-menu">
                          <div class="">
                              <div class="main-menu-header">
                                  <img class="img-80 img-radius" src="assets/images/cash.jpg" alt="User-Profile-Image">
                                  <div class="user-details">
                                      <span id="more-details">CASH OIL<i class="fa fa-caret-down"></i></span>
                                  </div>
                              </div>
        
                              <div class="main-menu-content">
                                 <ul>
                                      <li class="more-details">
                                          <a href="superAdmin.jsp"><i class="ti-user"></i>Admin Page</a>
                                          
                                      </li>
                                  </ul>
                              </div>
                          </div>
                          <div class="p-15 p-b-0">
                              
                          </div>
                          
                          
                          
                          
                          <div class="pcoded-navigation-label" data-i18n="nav.category.navigation"></div>
                          <ul class="pcoded-item pcoded-left-item">
                              <li class="active">
                                  <a href="dashBoard1.jsp" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                                      <span class="pcoded-mtext" data-i18n="nav.dash.main">Dashboard</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                              </li>
                              <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa-solid fa-ruler-vertical"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Dippings</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="supply.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Product Supply</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="OpenStock.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">invoices</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                                       <li class=" ">
                                          <a href="pump.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Pump Readings</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="ClosingStock.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Closing Stock</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                
                                  </ul>
                              </li>
                          </ul>
                          <div class="pcoded-navigation-label" data-i18n="nav.category.forms"></div>
                          <ul class="pcoded-item pcoded-left-item">
                                                            <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa-solid fa-oil-can"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Lube Bay</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="lubeStock.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Stock</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="lubeSale.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Add Sale</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="lubeBay.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                   
                
                                  </ul>
                              </li>
                                                            <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa-solid fa-car-crash"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Washing Bay</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="washingBay.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Data</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="washingBankAnalysis.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Bank Deposit Analysis</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="washingBayIncomeAnalysis.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Income Analysis</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="washingBayReport.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                  
                                     
                                 
                
                                  </ul>
                              </li>
        
                          </ul>
        
                          <div class="pcoded-navigation-label" data-i18n="nav.category.forms"></div>
                          <ul class="pcoded-item pcoded-left-item">
                                                            <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa fa-tasks"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Credits</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="credit.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Credit</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                                         <li class=" ">
                                          <a href="creditRepayment.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Credit Repayments</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                                      <li class=" ">
                                          <a href="creditReport.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                    
                                   
                                  </ul>
                              </li>
                                <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa  fa-sort-amount-asc"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Utility</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="utility.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Utility</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="UtilityReport.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                               
                                    
                
                                  </ul>
                              </li>
                                 <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa-solid fa-screwdriver-wrench"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Maintenance</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="maintenance.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Data</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="maintenaceReport.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                     
                                
                
                                  </ul>
                              </li>
        
                          </ul>
        
                          <div class="pcoded-navigation-label" data-i18n="nav.category.other"></div>
                          <ul class="pcoded-item pcoded-left-item">
                                                          <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class=" fa fa-bar-chart-o"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Statutory</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="statutory.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Statutory</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="statutoryReport.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                                   
                
                                  </ul>
                              </li>
                              
                              
                                                            <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa-solid fa-money-bill-1"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Master Load</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="masterLoad.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Master Load Allowance</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="masterLoadReport.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                     
                                    
                                     
                
                                  </ul>
                              </li>
                              
                              
                               <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa fa-book"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Daily Sales</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="sales.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Daily Sales</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                     
                                      <li class=" ">
                                          <a href="fall.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Win Fall/Short Fall</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                                       <li class=" ">
                                          <a href="gains.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Cumulative Gain/Loss</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                                       <li class=" ">
                                          <a href="Reco.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Reconciliation Of Cash Deposit</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                                       <li class=" ">
                                          <a href="rChanges.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Closing Stock As at Rate Change</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                  </ul>
                              </li>
                              
                                <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa-solid fa-money-check-dollar"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Payroll</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="employee.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Employee</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="payRoll.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Add Payroll</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                                      <li class=" ">
                                          <a href="payReport.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Payroll Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                   
                                   
                
                                  </ul>
                              </li>
                              
                                                            <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa fa-file"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Summary</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="summary.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">View Summary</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                    
                                     
                                 
                
                                  </ul>
                              </li>
                              
                                   <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa-solid fa-dollar-sign"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Employee Allowance</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="addAllowance.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Allowance</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="allowanceReport.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Allowance Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                
                                  </ul>
                              </li>
                              
                                <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-hand-open"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Requests</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="request.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Make Request</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                  </ul>
                              </li>
                              
                                                            <li class="pcoded-hasmenu">
                                      <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-server"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Bank Lodgements</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="bankLogement.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">View Bank Lodgement</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>

                                  </ul>
                              </li>
                          </ul>
                      </div>
                  </nav>
                <div class="pcoded-content">
                    <!-- Page-header start -->
              
                    <!-- Page-header end -->
                    <div class="pcoded-inner-content">
                        <div class="main-body">
                            <div class="page-wrapper">
                                <div class="page-body">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h5>LUBE SALES DATA</h5> <% String disable = "true"; %>
                                                      <div class="btn-group " role="group" data-toggle="tooltip" data-placement="top">
								                        <input type="button" class="btn btn-primary btn-sm waves-effect waves-light" title="select month" value="Month" id="month" onclick="manage(this)">
								                        <input type="button" class="btn btn-primary btn-sm waves-effect waves-light" title="select period" value="Period" id="period" onclick="manage1(this)">
								                        <input type="button" class="btn btn-primary btn-sm waves-effect waves-light" title="select branch" value="Branch" id="branch" onclick="manage2(this)">
								                    </div>
								                    
								                    <script type="text/javascript">
								                	function manage(txt) {
								                        var bt = document.getElementById('month');
								                        var txt = '<%= disable%>'
								                        if (txt == 'true') {
								                            bt.disabled = false;
								                            $('#monthlyModal').modal('show');
								                        }
								                        else {
								                            bt.disabled = true;
								                            alert("You are not the admin");
								                            
								                        }
								                    }   
								                	
								                	function manage1(txt) {
								                        var bt = document.getElementById('period');
								                        var txt = '<%= disable%>'
								                        if (txt == 'true') {
								                            bt.disabled = false;
								                            $('#periodModal').modal('show');
								                        }
								                        else {
								                            bt.disabled = true;
								                            alert("You are not the admin");
								                            
								                        }
								                    }  
								                	
								                	
								                	function manage2(txt) {
								                        var bt = document.getElementById('branch');
								                        var txt = '<%= disable%>'
								                        if (txt == 'true') {
								                            bt.disabled = false;
								                            $('#branchModal').modal('show');
								                        }
								                        else {
								                            bt.disabled = true;
								                            alert("You are not the admin");
								                            
								                        }
								                    }  
								                    </script>
								                              <!-- //////////////////////////////////////////////////  Monthly Modals      ////////////////////////////-->  
                                               <!-- Button trigger modal -->
													
													
													<!-- Modal -->
													<div class="modal fade" id="monthlyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLongTitle">Select Month and Branch</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													        <form action="summary.jsp">
													        
													           <div class="form-group row  container justify-content-center">
                                                                            <div class="col-sm-6">
                                                                              <label>Select Month</label>
                                                                                <input type="Month" class="form-control" required>
                                                                            </div>
                                                                            
                                                                            <div class="col-sm-6">
                                                                              <label>Select Branch</label>
                                                                            <select name="select" class="form-control">
                                                                            <option value="opt1">Select One Value Only</option>
                                                                            <option value="opt2">Type 2</option>
                                                                            <option value="opt3">Type 3</option>
                                                                            <option value="opt4">Type 4</option>
                                                                            <option value="opt5">Type 5</option>
                                                                            <option value="opt6">Type 6</option>
                                                                            <option value="opt7">Type 7</option>
                                                                            <option value="opt8">Type 8</option>
                                                                        </select>
                                                                            </div>
                                                                        </div>
													        
													         <div class="modal-footer">
													        
													        <button type="submit" class="btn btn-primary">Submit</button>
													        <button type="reset" class="btn btn-secondary">Reset</button>
													        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
													        
													      </div>
													        </form>
													      </div>
													     
													      
													    </div>
													  </div>
													</div>   
													
													  <!-- //////////////////////////////////////////////////  Monthly Modals      ////////////////////////////-->  
                                               <!-- Button trigger modal -->
																										 <!-- //////////////////////////////////////////////////  Monthly Modals      ////////////////////////////-->  
                                               <!-- Button trigger modal -->
													
													
													<!-- Modal -->
													<div class="modal fade" id="resetModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLongTitle">Account Reset Form</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													        <form action="resetPass" method="post">
													        
													           <div class="form-group row  container justify-content-center">
                                                                            <div class="col-sm-6">
                                                                              <label>Enter User Name</label>
                                                                                <input type="text" class="form-control" name="uName" required>
                                                                            </div>
                                                                            
                                                                          
                                                                            
                                                                              <div class="col-sm-6">
                                                                              <label>Enter Old Password</label>
                                                                                <input type="text" class="form-control" name="oldPass" required>
                                                                            </div>
                                                                            
                                                                              <div class="col-sm-6">
                                                                              <label>Enter New Password</label>
                                                                                <input type="text" class="form-control" name="newPass" required>
                                                                            </div>
                                                                            
                                                                              <div class="col-sm-6">
                                                                              <label>Repeat Password</label>
                                                                                <input type="text" class="form-control" name="repeatPass" required>
                                                                            </div>
                                                                        </div>
													        
													         <div class="modal-footer">
													        
													        <button type="submit" class="btn btn-primary">Submit</button>
													        <button type="reset" class="btn btn-secondary">Reset</button>
													        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
													        
													      </div>
													        </form>
													      </div>
													     
													      
													    </div>
													  </div>
													</div>
													
													 <!-- //////////////////////////////////////////////////  Monthly Modals      ////////////////////////////-->
													
													<!-- Modal -->
													<div class="modal fade" id="periodModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLongTitle">Select Dates and Branch</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													        <form action="summary.jsp">
													        
													           <div class="form-group row  container justify-content-center">
                                                                            <div class="col-sm-6">
                                                                              <label>Select Date From</label>
                                                                                <input type="date" class="form-control" required>
                                                                            </div>
                                                                            
                                                                            <div class="col-sm-6">
                                                                              <label>Select Date To</label>
                                                                                <input type="date" class="form-control" required>
                                                                            </div>
                                                                        </div>
                                                                        
                                                                         <div class="form-group row  container justify-content-center">
                                                                            <div class="col-sm-8">
                                                                            
                                                                            <select name="select" class="form-control">
                                                                            <option value="opt1">Select One Value Only</option>
                                                                            <option value="opt2">Type 2</option>
                                                                            <option value="opt3">Type 3</option>
                                                                            <option value="opt4">Type 4</option>
                                                                            <option value="opt5">Type 5</option>
                                                                            <option value="opt6">Type 6</option>
                                                                            <option value="opt7">Type 7</option>
                                                                            <option value="opt8">Type 8</option>
                                                                        </select>
                                                                            </div>
                                                                            
                                                                            
                                                                        </div>
													        
													         <div class="modal-footer">
													        
													        <button type="submit" class="btn btn-primary">Submit</button>
													        <button type="reset" class="btn btn-secondary">Reset</button>
													        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
													        
													      </div>
													        </form>
													      </div>
													     
													      
													    </div>
													  </div>
													</div> 
													
													  <!-- //////////////////////////////////////////////////  Monthly Modals      ////////////////////////////-->  
                                               <!-- Button trigger modal -->
													
													
													<!-- Modal -->
													<div class="modal fade" id="branchModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLongTitle">Select Branch</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													        <form action="summary.jsp">
													        
													           <div class="form-group row  container justify-content-center">
                                                                            <div class="col-sm-8">
                                                                            <label>Select Branch</label>
                                                                            <select name="select" class="form-control">
                                                                            <option value="opt1">Select One Value Only</option>
                                                                            <option value="opt2">Type 2</option>
                                                                            <option value="opt3">Type 3</option>
                                                                            <option value="opt4">Type 4</option>
                                                                            <option value="opt5">Type 5</option>
                                                                            <option value="opt6">Type 6</option>
                                                                            <option value="opt7">Type 7</option>
                                                                            <option value="opt8">Type 8</option>
                                                                        </select>
                                                                            </div>
                                                                        </div>
													        
													         <div class="modal-footer">
													        
													        <button type="submit" class="btn btn-primary">Submit</button>
													        <button type="reset" class="btn btn-secondary">Reset</button>
													        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
													        
													      </div>
													        </form>
													      </div>
													     
													      
													    </div>
													  </div>
													</div> 
                                                    <span>  </span>
                                                    <div class="card-header-right">
                                                        <ul class="list-unstyled card-option">
                                                            <li><i class="fa fa-chevron-left"></i></li>
                                                            <li><i class="fa fa-window-maximize full-card"></i></li>
                                                            <li><i class="fa fa-minus minimize-card"></i></li>
                                                            <li><i class="fa fa-refresh reload-card"></i></li>
                                                            <li><i class="fa fa-times close-card"></i></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="card-block">
                                                    
                                                    
                                                    <form action="#" method="post">
                                                                        <div class="form-group row  container justify-content-center" >
                                                                            <div class="col-sm-3">
                                                                            <label>Select Date</label>
                                                                                <input type="Date" class="form-control" name="date" required>
                                                                            </div>
                                                                            <div class="col-sm-3">
                                                                            <label>Litres Sold</label>
                                                                                <input type="text" class="form-control"
                                                                              name="sold" required >
                                                                            </div>
                                                                            
                                                                             <div class="col-sm-3">
                                                                            <label>Rate</label>
                                                                                <input type="text" class="form-control"
                                                                              name="rate" required >
                                                                            </div>
                                                                        </div>
                                                                    
                                                                 
                                                                        
                                                                          <div align="center">
                                                    <br>
                                              
                                                     <button class="btn waves-effect waves-light btn-success btn-outline-success" type="submit" name="save"><i class="fa-regular fa-floppy-disk"></i>Save</button>
                                                     <button class="btn waves-effect waves-light btn-danger btn-outline-danger" type="reset"><i class="fa-solid fa-ban"></i>Cancel</button>
                                                    </div>
                                                                      
                                                                    </form>
                                                  
                                                    
                                                    <br>
                                                    
                                                     <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                    <table class="table table-hover table table-sm" id="testData">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Date</th>
                                                                <th>Branch</th>
                                                                <th>Litres Sold</th>
                                                                <th>Rate</th>
                                                                <th>Total Amount</th>
                                                                <th>ltr Remaining</th>
                                                                <th>Actions</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        <%
                                                        
                                                        Connection con;
                                                        Statement st;
                                                        Statement st1;
                                                        ResultSet rs;
                                                        ResultSet rs1;
                                                        
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
                                                        String sql = "select * from lubeSale where branch='"+branch1+"'";
                                                        String sql1 ="SELECT  sum(litresRecieved) from lubeStock where branch='"+branch1+"'";
                                                        if(branch1.equals("main Branch")){
                                                        	sql = "select * from lubeSale";
                                                        	sql1 ="SELECT  sum(litresRecieved) from lubeStock";
                                                        }
                                                        
                                                        
                                                        double te=0;
                                                        double lr=0;
                                                        double lt=0;
                                                        int i =0;
                                                        st = con.createStatement();
                                                        st1 = con.createStatement();
                                                        rs=st.executeQuery(sql);
                                                        rs1=st1.executeQuery(sql1);
                                                        
                                                        while(rs.next()){
                                                        %>
                                                            <tr>
                                                                <th scope="row"><%out.println(i+=1); %></th>
                                                                <td scope="row"><%out.println(rs.getString("date")); %></td>
                                                                <td scope="row"><%out.println(rs.getString("branch")); %></td>
                                                                <td scope="row"><%out.println(rs.getString("litresSold")); %></td>
                                                                <td scope="row"><%out.println(rs.getString("rate")); %></td>
                                                                <td scope="row"><%
                                                                
                                                                double lts = rs.getDouble("litresSold");
                                                                double rate = rs.getDouble("rate");
                                                               
                                                                out.println(lts*rate);
                                                                
                                                                %></td>
                                                                <td>
                                                                <%
                                                                   if(rs1.next()){
                                                                	   te=rs1.getDouble(1);
                                                                	   
                                                                   }
                                                               
                                                                lr+=lts;
                                                                out.println(te-lr);
                                                                
                                                                %>
                                                                </td>
                                                                 <td>
                                                                <button onclick="search(<%=rs.getString(1)%>)" title="Update" data-toggle="modal" data-target="#updateModal"><i class="ti-pencil-alt" style="color:orange; cursor:pointer; padding:5px;"></i></button>
											                    <button onclick="testDelete(<%=rs.getString(1)%>)" title="Delete"><i class="ti-trash" style="color:red; cursor:pointer; padding:5px;"></i></button>
                                                                </td>
                                                                
                                                            </tr>
                                                          <%} %>
                                                           
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                                    
                                                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
                                                      <script>
												$(document).ready( function () {
												    $('#testData').DataTable();
												} );
												
												
												</script>
                                                    
                                                    
                                                       <!-- //////////////////////////////////////////////////  Monthly Modals      ////////////////////////////-->
													<!-- Modal -->
													<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLongTitle">Update Lube Sale</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													      
													        <form action="#" method="post">
                                                                        <div class="form-group row  container justify-content-center" >
                                                                            <div class="col-sm-6">
                                                                            <label>Date</label>
                                                                                <input type="Date" class="form-control" required name="date" id="date">
                                                                            </div>
                                                                            <div class="col-sm-6">
                                                                            <label>Liters Sold</label>
                                                                                <input type="text" class="form-control"
                                                                                name="ltr" id="ltr" required>
                                                                            </div>
                                                                            <div class="col-sm-6">
                                                                            <label>Rate</label>
                                                                                <input type="text" class="form-control" name="rate" id="rate" required>
                                                                            </div>
                                                                            
                                                                           
                                                                        </div>
                                                                      
                                                                    
                                                                      
                                                                         <div align="center">
                                                    <br>
                                                    
                                                     <button type="submit" name="update" class="btn waves-effect waves-light btn-success btn-outline-success"><i class="fa-regular fa-floppy-disk"></i>Update</button>
                                                     <button class="btn waves-effect waves-light btn-danger btn-outline-danger" type="reset"><i class="fa-solid fa-ban"></i>Cancel</button>
                                                    </div>
                                                                      
                                                                    </form>
													      </div>
													     
													      
													    </div>
													  </div>
													</div> 
													
													  <!-- //////////////////////////////////////////////////  Monthly Modals      ////////////////////////////-->  
																	    
																	     <script>
																	          function search(id){
																	        	  
																	        	
																	        	  
																	        	  $.ajax({
																	        		  
																	        		  type:"POST",
																	        		  url:"updatelube.jsp",
																	        		  data:{"myid" :id,"option":'sale'},
																	        		  
																	        		  success:function(msg){
																	        			  var obj = JSON.parse(msg);
																	        			  $("#date").val(obj[0].date);
																	        			  $("#ltr").val(obj[0].litresSold);
																	        			  $("#rate").val(obj[0].rate);
																	        			
																	        			
																	        			 
																	        		  },
																	        		  error(err){
																	        			  alert("error")
																	        		  }
																	        		  
																	        		  
																	        	  })
																	        	  
																	          }
																	          
																	          
																	    </script>
																	    
																	    
																	     <script>
			                                            
																	              function testDelete(id){
																	            	  alert(id);
																	            	  var doit = confirm("Do you want to delete data");
																	            	      if(doit){
																	            	    	 
																	            	    	  deletes(id);
																	            	      }else
																	            	    	  alert("Cancelled");
																	              }

																	    	    	  
																	              function deletes(id){
																	        	  $.ajax({
																	        		  type:"POST",
																	        		  url:"updatelube.jsp",
																	        		  data:{"myid" :id,"option":'deleteL'},
																	        		  
																	        		  success:function(msg){
																	        			  var obj = JSON.parse(msg);
																	        			 
																	        			  var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
																	        			  var millisecondsToWait = 700;
																	        			  setTimeout(function() {
																	        				  location.href="lubeSale.jsp";
																	        			  }, millisecondsToWait);
																	        			  
																	        		  },
																	        		  error(err){
																	        			  alertify.error('Error');
																	        		  }
																	        		  
																	        		  
																	        	  })
																	        	  
																	          }
																	          
																	          
																	    </script>
                                                    
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="styleSelector">
                
                </div>
            </div>
        </div>
    </div>
</div>



<!-- Warning Section Ends -->
<!-- Required Jquery -->
    <script type="text/javascript" src="assets/js/jquery/jquery.min.js"></script>     <script type="text/javascript" src="assets/js/jquery-ui/jquery-ui.min.js "></script>     <script type="text/javascript" src="assets/js/popper.js/popper.min.js"></script>     <script type="text/javascript" src="assets/js/bootstrap/js/bootstrap.min.js "></script>
<!-- waves js -->
<script src="assets/pages/waves/js/waves.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="assets/js/jquery-slimscroll/jquery.slimscroll.js "></script>
<!-- modernizr js -->
    <script type="text/javascript" src="assets/js/SmoothScroll.js"></script>     <script src="assets/js/jquery.mCustomScrollbar.concat.min.js "></script>
<script src="assets/js/pcoded.min.js"></script>
<script src="assets/js/vertical-layout.min.js "></script>
<script src="assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- Custom js -->
<script type="text/javascript" src="assets/js/script.js"></script>
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

<!--          ////////    Data table Js ///////////////////// -->

<script src=https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js></script>
<script src=https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js></script>
<script src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.9/js/responsive.bootstrap4.min.js"></script>

</body>

</html>