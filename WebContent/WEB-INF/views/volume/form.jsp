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
 <div id="addVolume_dlg" tabindex="-1" role="dialog" class="modal fade ">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" data-dismiss="modal" class="close">
                  <span aria-hidden="true">&times;</span>
               </button>
               <h4 class="modal-title">添加存储</h4>
            </div>
            <div class="modal-body">
               <form id="sys_dlg_form" role="form">
                  <div class="form-group">
                     <label>名称</label>
                     <input id="sys_dlg_form_1" name="name" type="text" placeholder="输入数据卷名称" class="form-control">
                  </div>
                  <div class="form-group">
                     <label>描述</label>
                     <input id="sys_dlg_form_2" name="description" type="text" placeholder="输入数据卷描述" class="form-control">
                  </div>
                  <input type="hidden" name="driver" value="convoy-gluster"/>
                  <div class="form-group">
                     <label>驱动属性</label>
                     <div class="ember-view">
                     <a href="javascript:void(0);" onclick="addPropertiesRow('propertiesTable')"
                                 class="btn btn-labeled btn-info">
                                 <span class="btn-label"><i class="fa fa-plus"></i>
                                 </span>添加属性</a>
						  <table id="propertiesTable" 
						         class="table fixed no-lines no-top-padding tight small">
						    <tr class="text-muted hidden-sm">
						      <th>键</th>
						      <th width="30">&nbsp;</th>
						      <th>值</th>
						      <th width="30">&nbsp;</th>
						    </tr>
						      <tr>
						        <td class="valign-top" data-title="Key">
						          <input type="text" name="key"
						                class="form-control input-sm key ember-view ember-text-field">
						        </td>
						
						        <td class="valign-top text-center">
						          <p class="form-control-static input-sm">=</p>
						        </td>
						
						        <td class="valign-top" data-title="Value">
						            <input type="text" name="value"
						                class="form-control input-sm key ember-view ember-text-field">
						        </td>
						
						        <td class="valign-top text-right">
						          <a href="javascript:void(0);" onclick="removePropertiesRow(this)"
                                 		class="btn btn-labeled btn-info">
                                 <span class="btn-label"><i class="fa fa-minus"></i>
                                 </span></a>
						        </td>
						      </tr>
						  </table>
						</div>
                  </div>
               </form>
            </div>
            <div class="modal-footer">
               <button type="button" data-dismiss="modal" class="btn btn-default">关闭</button>
               <button type="button" data-dismiss="modal" id="sys_dlg_submit" class="btn btn-primary">保存</button>
            </div>
         </div>
      </div>
   </div>
   <script>
      function addPropertiesRow(tableId){
    	  var appendHtml = '<tr><td class="valign-top" data-title="Key"><input name="key" placeholder="Key" type="text" class="form-control input-sm key ember-view ember-text-field"></td>';
    	  var stHtml = '<td class="valign-top text-center"><p class="form-control-static input-sm">=</p></td><td class="valign-top" data-title="Value"><input placeholder="Value" type="text" name="value" class="form-control input-sm key ember-view ember-text-field"></td>';
          var smHtml = '<td class="valign-top text-right"><a href="javascript:void(0);" onclick="removePropertiesRow(this)" class="btn btn-labeled btn-info"><span class="btn-label"><i class="fa fa-minus"></i></span></a></td>';
          $("#"+tableId).append(appendHtml+stHtml+smHtml);
      }
      
      function removePropertiesRow(obj){
    	  $(obj).parent().parent().remove();  
      }
   </script>
</body>
</html>