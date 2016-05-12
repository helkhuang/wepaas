
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="<%=basePath%>/assets/vendor/jquery/dist/jquery.js"></script>
</head>
<body>
  <!--
      功能：容器主机添加对话框
      作者：Edwin Xiang
      日期：2016-04-17
   -->
   <div id="dlg_host_add" tabindex="-1" role="dialog" class="modal fade ">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" data-dismiss="modal" class="close">
                  <span aria-hidden="true">&times;</span>
               </button>
               <h4 class="modal-title">添加主机</h4>
            </div>
            <div class="modal-body">
               <form id="dlg_tjzj_form" role="form">
                  <div class="form-group">
                     <label>步骤一.安装linux操作系统并安装最新版本的<a href="http://get.daocloud.io/#install-docker">docker</a></label>
                  </div>
                  <div class="form-group">
                     <label>步骤二.确认UDP 端口 500 and 4500已经被正确打开并能双向通信</label>
                  </div>

                  <div class="form-group">
                     <label>步骤三.添加标签</label>
                  </div>

                  <div class="form-group">
                     <div class="col-sm-10">
                        <a id="dlg_tjzj_add" class="btn btn-labeled btn-success"><span class="btn-label"><i class="fa fa-plus"></i></span>添加</a>
                        <a id="dlg_tjzj_remove" class="btn btn-labeled btn-danger"><span class="btn-label"><i class="fa fa-times"></i></span>删除</a>
                     </div>
                  </div>

                  <table id="dlg_tjzj_table" class="table table-striped table-hover">
                     <thead>
                     <tr>
                        <th>key</th>
                        <th>value</th>
                     </tr>
                     </thead>
                     <tbody>
                     </tbody>
                  </table>

                  <div class="form-group">
                     <label>步骤四.拷贝以下字符串并登陆安装主机执行安装</label>
                     <div class="copy-pre">
              			<pre id="registration-command">
sudo docker run  <div id="label-text"></div>  -d --privileged -v /var/run/docker.sock:/var/run/docker.sock -v  /var/lib/rancher:/var/lib/rancher <div id="image-text"></div>  <div id="registrationUrl-text"></div>
              			</pre>
              <div class="ember-view copy-button-container inline-block" id="ember6280">
              <div class="copy-button-container ember-view inline-block" role="tooltip" id="ember6281">  
              

				</div></div>
              </div>
                  </div>

                  <div class="form-group">
                     <label>步骤五.关闭并等待主机添加</label>
                  </div>
               </form>
            </div>
            <div class="modal-footer">
               <button type="button" style='margin:auto;' data-dismiss="modal" class="btn btn-primary">关闭</button>
            </div>
         </div>
      </div>
   </div>
   <script>
		   $(document).ready(function() {
			 //command
			   $.ajax({
				   url:'registrationtokens',
				   dataType:'json',
				   type:'post',
				   data:{'accountId':'1a5'},
				   success:function(result){
					   $("#image-text").html(result.data[0].image);
					   $("#registrationUrl-text").html(result.data[0].registrationUrl);
				   }
			   });
		   });
   </script>
</body>
</html>