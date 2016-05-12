<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <header class="topnavbar-wrapper">
         <nav role="navigation" class="navbar topnavbar">
            <div class="navbar-header">
               <a href="#/" class="navbar-brand">
                  <div class="brand-logo">
                     <img src="<%=basePath%>/assets/img/logo.png" alt="App Logo" class="img-responsive">
                  </div>
                  <div class="brand-logo-collapsed">
                     <img src="<%=basePath%>/assets/img/logo-single.png" alt="App Logo" class="img-responsive">
                  </div>
               </a>
            </div>
            <div class="nav-wrapper">
               <ul class="nav navbar-nav navbar-right">
                  <li class="visible-lg">
                     <a href="#" data-toggle-fullscreen="">
                        <em class="fa fa-expand"></em>
                     </a>
                  </li>
                  <li class="dropdown dropdown-list">
                     <a href="#" data-toggle="dropdown">
                        <em class="icon-bell"></em>
                        <div class="label label-danger">16</div>
                     </a>
                     <ul class="dropdown-menu animated flipInX">
                        <li>
                           <div class="list-group">
                              <a href="#" onclick="alert('通知');return false;" class="list-group-item">
                                 <div class="media-box">
                                    <div class="pull-left">
                                       <em class="fa fa-server fa-2x text-info"></em>
                                    </div>
                                    <div class="media-box-body clearfix">
                                       <p class="m0">云主机通知</p>
                                       <p class="m0 text-muted">
                                          <small>1条</small>
                                       </p>
                                    </div>
                                 </div>
                              </a>
                              <a href="#" onclick="alert('通知');return false;" class="list-group-item">
                                 <div class="media-box">
                                    <div class="pull-left">
                                       <em class="fa fa-cube fa-2x text-warning"></em>
                                    </div>
                                    <div class="media-box-body clearfix">
                                       <p class="m0">容器通知</p>
                                       <p class="m0 text-muted">
                                          <small>4条</small>
                                       </p>
                                    </div>
                                 </div>
                              </a>
                              <a href="#" onclick="alert('通知');return false;" class="list-group-item">
                                 <div class="media-box">
                                    <div class="pull-left">
                                       <em class="fa fa-sitemap fa-2x text-success"></em>
                                    </div>
                                    <div class="media-box-body clearfix">
                                       <p class="m0">应用通知</p>
                                       <p class="m0 text-muted">
                                          <small>11条</small>
                                       </p>
                                    </div>
                                 </div>
                              </a>
                              <a href="#" onclick="alert('通知');return false;" class="list-group-item">
                                 <small>通知总计</small>
                                 <span class="label label-danger pull-right">16</span>
                              </a>
                           </div>
                        </li>
                     </ul>
                  </li>
                  <li>
                     <a href="#" data-toggle-state="offsidebar-open" data-no-persist="true">
                        <em class="icon-user">&nbsp;张三(系统管理员)</em>
                     </a>
                  </li>
               </ul>
            </div>
         </nav>
      </header>
</body>
</html>