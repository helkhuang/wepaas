
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div id="sys_dlg" tabindex="-1" role="dialog" class="modal fade ">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" data-dismiss="modal" class="close">
                  <span aria-hidden="true">&times;</span>
               </button>
               <h4 class="modal-title">添加镜像仓库</h4>
            </div>
            <div class="modal-body">
               <form id="sys_dlg_form" role="form">
                  <div class="form-group">
                     <label>地址</label>
                     <input id="sys_dlg_form_1" name="serverAddress" type="text" placeholder="请输入地址" class="form-control">
                  </div>
                  <div class="form-group">
                     <label>邮件</label>
                     <input id="sys_dlg_form_2" name="email" type="text" placeholder="请输入邮件" class="form-control">
                  </div>
                  <div class="form-group">
                     <label>用户名</label>
                     <input id="sys_dlg_form_3" name="publicValue" type="text" placeholder="请输入用户名" class="form-control">
                  </div>

                  <div class="form-group">
                     <label>密码</label>
                     <input id="sys_dlg_form_4" name="secretValue" type="password" placeholder="请输入密码" class="form-control">
                  </div>
                  <input id="sys_dlg_form_id" name="id" type="hidden" class="form-control">
               </form>
            </div>
            <div class="modal-footer">
               <button type="button" data-dismiss="modal" class="btn btn-default">关闭</button>
               <button type="button" data-dismiss="modal" id="sys_dlg_submit" class="btn btn-primary">保存</button>
            </div>
         </div>
      </div>
   </div>
</body>
</html>