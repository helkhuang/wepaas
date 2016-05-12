<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Template Name: wepaas -->
<!--[if IE 8]><html class="ie8" lang="en"><![endif]-->
<!--[if IE 9]><html class="ie9" lang="en"><![endif]-->
<!--[if !IE]><!-->
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>eitCloud</title>
</head>
<body>
 <div class="aside-inner">
            <nav data-sidebar-anyclick-close="" class="sidebar">
               <ul class="nav">
                  <li class="nav-heading ">
                     <span></span>
                  </li>
                  <li class=" ">
                     <a href="#" onclick="alert('菜单');return false;">
                        <em class="icon-bulb"></em>
                        <span >创建向导</span>
                     </a>
                     <ul></ul>
                  </li>
                  
                  
                  <li class=" ">
                     <a href="<%=basePath%>/cluster/list">
                        <em class="icon-bulb"></em>
                        <span >容器集群</span>
                     </a>
                     <ul></ul>
                  </li>
                  
                  <li class=" ">
                     <a href="<%=basePath%>/host/list">
                        <em class="icon-bulb"></em>
                        <span >容器主机</span>
                     </a>
                     <ul></ul>
                  </li>
                  
                  <li class=" ">
                     <a href="<%=basePath%>/volume/list">
                        <em class="icon-bulb"></em>
                        <span >容器数据卷</span>
                     </a>
                     <ul></ul>
                  </li>
                  
                  <li class=" ">
                     <a href="#registry" data-toggle="collapse">
                        <em class="icon-layers"></em>
                        <span >容器仓库</span>
                     </a>
                     <ul id="registry" class="nav sidebar-subnav collapse">
                        <li class="sidebar-subnav-header">容器仓库</li>
                        <li class=" "><a href="<%=basePath%>/registry/list" ><span>仓库列表</span></a></li>
                        <!--  <li class=" "><a href="<%=basePath%>/image/list" ><span>镜像列表</span></a></li>-->
                        <li class=" "><a href="<%=basePath%>/image/build/list"><span>构建列表</span></a></li>
                     </ul>
                  </li>
                  
                  <li class=" ">
                     <a href="<%=basePath%>/application/own/list">
                        <em class="icon-bulb"></em>
                        <span >我的应用</span>
                     </a>
                     <ul></ul>
                  </li>
                  
                  <li class=" ">
                     <a href="<%=basePath%>/marketing/app/list">
                        <em class="icon-basket"></em>
                        <span >云市场</span>
                     </a>
                     <ul></ul>
                  </li>
               </ul>
            </nav>
         </div>
</body>
</html>