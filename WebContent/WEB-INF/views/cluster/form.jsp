
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div id="addjiqun_dlg" tabindex="-1" role="dialog" class="modal fade ">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" data-dismiss="modal" class="close">
                  <span aria-hidden="true">&times;</span>
               </button>
               <h4 class="modal-title">添加集群</h4>
            </div>
            <div class="modal-body">
               <form id="sys_dlg_form" role="form">
                  <div class="form-group">
                     <label>名称</label>
                     <input id="sys_dlg_form_1" name="name" type="text" 
                                placeholder="输入集群名称" class="form-control">
                  </div>
                  <div class="form-group">
                     <label>描述</label>
                     <input id="sys_dlg_form_2" name="description" type="text" 
                                 placeholder="输入集群描述" class="form-control">
                  </div>
                  <div class="form-group">
                     <label>引擎类型</label>
                     <select id="engineer_type" name="orchestration" class="form-control">
                         <option value="cattle">Cattle</option>
                         <option value="kubernetes">Kubernetes</option>
                         <option value="swarm">Swarm</option>
                     </select>
                  </div>
               </form>
            </div>
            <div class="modal-footer">
               <button type="button" data-dismiss="modal" 
                            class="btn btn-default">关闭</button>
               <button type="button" data-dismiss="modal" id="sys_dlg_submit" 
                            class="btn btn-primary">保存</button>
            </div>
         </div>
      </div>
   </div>
</body>
</html>