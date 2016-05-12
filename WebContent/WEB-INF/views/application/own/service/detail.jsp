<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%> 
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
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <meta name="description" content="SEO描述信息">
   <meta name="keywords" content=SEO关键字>
   <title>服务</title>
   <link rel="stylesheet" href="<%=basePath%>/assets/vendor/fontawesome/css/font-awesome.min.css">
   <link rel="stylesheet" href="<%=basePath%>/assets/vendor/simple-line-icons/css/simple-line-icons.css">
   <link rel="stylesheet" href="<%=basePath%>/assets/vendor/animate.css/animate.min.css">
   <link rel="stylesheet" href="<%=basePath%>/assets/vendor/whirl/dist/whirl.css">
   <link rel="stylesheet" href="<%=basePath%>/assets/vendor/bootstrap-tagsinput/dist/bootstrap-tagsinput.css">
   <link rel="stylesheet" href="<%=basePath%>/assets/vendor/weather-icons/css/weather-icons.min.css">
   <link rel="stylesheet" href="<%=basePath%>/assets/vendor/bootstrap-3.3.5-dist/css/bootstrap.css">
   <link rel="stylesheet" href="css/bootstrap.css" id="bscss">
   <!--<link rel="stylesheet" type="text/css" href="<%=basePath%>/assets/vendor/jqdatatables/media/css/jquery.dataTables.css">-->
   <link rel="stylesheet" type="text/css" href="<%=basePath%>/assets/vendor/jqdatatables/media/css/dataTables.bootstrap.css">
   <link rel="stylesheet" type="text/css" href="<%=basePath%>/assets/vendor/jqdatatables/extensions/Select/css/select.bootstrap.css">
   <link rel="stylesheet" href="<%=basePath%>/assets/css/app.css" id="maincss">
</head>

<body>
   <div class="wrapper">
     <jsp:include page="../../../common/header.jsp"></jsp:include>
      <aside class="aside">
          <jsp:include page="../../../common/left_menu.jsp"></jsp:include>
      </aside>
      <section>
          <div class="content-wrapper">
            <h3>服务</h3>
            <div class="container-fluid">
               <div class="panel panel-default">
                  <div class="panel-heading">
                     <div class="row">
                     <div class="col-sm-4">
                        <h4>服务</h4>
                     </div>
                     <div class="col-sm-8"  style="text-align: right">
                        <button type="button" class="mb-sm btn btn-warning">重启</button>
                        <button type="button" class="mb-sm btn btn-primary">挂起</button>
                        <button type="button" class="mb-sm btn btn-success">放弃</button>
                     </div>
                     </div>
                  </div>
                  <div class="panel-body">
                     <form class="form-horizontal">
                        <div class="form-group">
                           <label class="col-sm-2 control-label">类型</label>
                           <div class="col-sm-2">
                              <div class="row">
                                 <div class="control-label" style="text-align: left">Service</div>
                              </div>
                           </div>

                           <label class="col-sm-2 control-label">FQDN</label>
                           <div class="col-sm-2">
                              <div class="row">
                                 <div class="control-label" style="text-align: left">${service.fqdn}</div>
                              </div>
                           </div>

                           <label class="col-sm-2 control-label">Scale</label>
                           <div class="col-sm-2">
                              <div class="row">
                                 <div class="control-label" style="text-align: left"><input id="ember3391" min="1" type="number" style="width: 60px; height: 20px; padding: 0 2px; display: inline-block;" class="form-control">次数</div>
                              </div>
                           </div>
                        </div>
                        <div class="form-group">
                           <label class="col-sm-2 control-label">镜像</label>
                           <div class="col-sm-2">
                              <div class="row">
                                 <div class="control-label" style="text-align: left">${service.instances[0].imageUuid}</div>
                              </div>
                           </div>
                           <label class="col-sm-2 control-label">Entrypoint</label>
                           <div class="col-sm-2">
                              <div class="row">
                                 <div class="control-label" style="text-align: left">${service.instances[0].entryPoint}</div>
                              </div>
                           </div>

                           <label class="col-sm-2 control-label">Command</label>
                           <div class="col-sm-2">
                              <div class="row">
                                 <div class="control-label" style="text-align: left">${service.instances[0].command}</div>
                              </div>
                           </div>
                        </div>
                     </form>
                  </div>
               </div>
               <div class="panel panel-default">
                  <div class="panel-body">
                     <div role="tabpanel">
                        <!-- Nav tabs-->
                        <ul role="tablist" class="nav nav-tabs">
                           <li role="presentation" class="active"><a href="#command" role="tab" data-toggle="tab">端口</a></li>
                           <li role="presentation"><a href="#volumes" role="tab" data-toggle="tab">容器</a></li>
                           <li role="presentation"><a href="#net" role="tab" data-toggle="tab">标签</a></li>
                           <li role="presentation"><a href="#security" role="tab" data-toggle="tab">链接</a></li>
                        </ul>
                        <!-- Tab panes-->
                        <div class="tab-content">
                           <div id="command" role="tabpanel" class="tab-pane active">
                              <div class="panel-body">
                                 <form class="form-horizontal">
                                    <div class="form-group">
                                       <div class="panel-body">
                                          <div class="table-responsive">
                                             <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                                <thead>
                                                <tr>
                                                   <th>状态</th>
                                                   <th>名称</th>
                                                   <th>IP地址</th>
                                                   <th>主机</th>
                                                   <th>镜像</th>
                                                </tr>
                                                </thead>
                                             </table>
                                          </div>
                                       </div>
                                    </div>
                                 </form>
                              </div>
                           </div>
                           <div id="volumes" role="tabpanel" class="tab-pane">
                              <div class="panel-body">
                                 <form class="form-horizontal">
                                    <div class="form-group">
                                       <label class="col-sm-2 control-label">命令1</label>
                                       <div class="col-sm-8">
                                          <div class="row">
                                             <input type="text" placeholder="命令" class="form-control">
                                          </div>
                                       </div>
                                    </div>
                                    <div class="form-group">
                                       <label class="col-sm-2 control-label">终端点</label>
                                       <div class="col-sm-3">
                                          <div class="row">
                                             <input type="text" placeholder="终端点" class="form-control">
                                          </div>
                                       </div>
                                       <label class="col-sm-2 control-label">用户</label>
                                       <div class="col-sm-3">
                                          <div class="row">
                                             <input type="text" placeholder="用户" class="form-control">
                                          </div>
                                       </div>
                                    </div>
                                    <div class="form-group">
                                       <label class="col-sm-2 control-label">控制台</label>
                                       <div class="col-sm-8">
                                          <div class="row">
                                             <div class="radio"><label><input id="optionsRadios1" type="radio" name="optionsRadios" value="option1" checked="">Interactive & TTY</label></div>
                                             <div class="radio"><label><input id="optionsRadios2" type="radio" name="optionsRadios" value="option1" checked="">Interactive(-i)</label></div>
                                             <div class="radio"><label><input id="optionsRadios3" type="radio" name="optionsRadios" value="option1" checked="">TTY</label></div>
                                             <div class="radio"><label>
                                                <input id="optionsRadios4" type="radio" name="optionsRadios" value="option1" checked="">
                                                选择主动选择
                                                <input id="ember3391" min="1" type="number" style="width: 60px; height: 20px; padding: 0 2px; display: inline-block;" class="form-control">次数
                                                </label></div>
                                          </div>
                                       </div>
                                    </div>
                                 </form>
                              </div>
                           </div>
                           <div id="net" role="tabpanel" class="tab-pane">
                              <div class="panel-body">
                                 <form class="form-horizontal">
                                    <div class="form-group">
                                       <label class="col-sm-2 control-label">命令2</label>
                                       <div class="col-sm-8">
                                          <div class="row">
                                             <input type="text" placeholder="命令" class="form-control">
                                          </div>
                                       </div>
                                    </div>
                                    <div class="form-group">
                                       <label class="col-sm-2 control-label">终端点</label>
                                       <div class="col-sm-3">
                                          <div class="row">
                                             <input type="text" placeholder="终端点" class="form-control">
                                          </div>
                                       </div>
                                       <label class="col-sm-2 control-label">用户</label>
                                       <div class="col-sm-3">
                                          <div class="row">
                                             <input type="text" placeholder="用户" class="form-control">
                                          </div>
                                       </div>
                                    </div>
                                    <div class="form-group">
                                       <label class="col-sm-2 control-label">控制台</label>
                                       <div class="col-sm-8">
                                          <div class="row">
                                             <div class="radio"><label><input id="optionsRadios1" type="radio" name="optionsRadios" value="option1" checked="">Interactive & TTY</label></div>
                                             <div class="radio"><label><input id="optionsRadios2" type="radio" name="optionsRadios" value="option1" checked="">Interactive(-i)</label></div>
                                             <div class="radio"><label><input id="optionsRadios3" type="radio" name="optionsRadios" value="option1" checked="">TTY</label></div>
                                             <div class="radio"><label><input id="optionsRadios4" type="radio" name="optionsRadios" value="option1" checked="">选择主动选择<input id="ember3391" min="1" type="number" style="width: 60px; height: 20px; padding: 0 2px; display: inline-block;" class="form-control">次数</span></label></div>
                                          </div>
                                       </div>
                                    </div>
                                 </form>
                              </div>
                           </div>
                           <div id="security" role="tabpanel" class="tab-pane">
                              <div class="panel-body">
                                 <form class="form-horizontal">
                                    <div class="form-group">
                                       <label class="col-sm-2 control-label">命令3</label>
                                       <div class="col-sm-8">
                                          <div class="row">
                                             <input type="text" placeholder="命令" class="form-control">
                                          </div>
                                       </div>
                                    </div>
                                    <div class="form-group">
                                       <label class="col-sm-2 control-label">终端点</label>
                                       <div class="col-sm-3">
                                          <div class="row">
                                             <input type="text" placeholder="终端点" class="form-control">
                                          </div>
                                       </div>
                                       <label class="col-sm-2 control-label">用户</label>
                                       <div class="col-sm-3">
                                          <div class="row">
                                             <input type="text" placeholder="用户" class="form-control">
                                          </div>
                                       </div>
                                    </div>
                                    <div class="form-group">
                                       <label class="col-sm-2 control-label">控制台</label>
                                       <div class="col-sm-8">
                                          <div class="row">
                                             <div class="radio"><label><input id="optionsRadios1" type="radio" name="optionsRadios" value="option1" checked="">Interactive & TTY</label></div>
                                             <div class="radio"><label><input id="optionsRadios2" type="radio" name="optionsRadios" value="option1" checked="">Interactive(-i)</label></div>
                                             <div class="radio"><label><input id="optionsRadios3" type="radio" name="optionsRadios" value="option1" checked="">TTY</label></div>
                                             <div class="radio"><label><input id="optionsRadios4" type="radio" name="optionsRadios" value="option1" checked="">选择主动选择<input id="ember3391" min="1" type="number" style="width: 60px; height: 20px; padding: 0 2px; display: inline-block;" class="form-control">次数</span></label></div>
                                          </div>
                                       </div>
                                    </div>
                                 </form>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
       <jsp:include page="../../../common/footer.jsp"></jsp:include>
   </div>
   

   <script src="<%=basePath%>/assets/vendor/modernizr/modernizr.js"></script>
   <script src="<%=basePath%>/assets/vendor/jquery/dist/jquery.js"></script>
   <script src="<%=basePath%>/assets/vendor/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
   <script src="<%=basePath%>/assets/vendor/jQuery-Storage-API/jquery.storageapi.js"></script>
   <script src="<%=basePath%>/assets/vendor/jquery.easing/js/jquery.easing.js"></script>
   <script src="<%=basePath%>/assets/vendor/animo.js/animo.js"></script>
   <script src="<%=basePath%>/assets/vendor/slimScroll/jquery.slimscroll.min.js"></script>
   <script src="<%=basePath%>/assets/vendor/screenfull/dist/screenfull.js"></script>
   <script src="<%=basePath%>/assets/vendor/jquery-localize-i18n/dist/jquery.localize.js"></script>
   <script src="<%=basePath%>/assets/vendor/jqdatatables/media/js/jquery.dataTables.js"></script>
   <script src="<%=basePath%>/assets/vendor/jqdatatables/extensions/select/js/dataTables.select.js"></script>
   <script src="<%=basePath%>/assets/vendor/jqdatatables/media/js/dataTables.bootstrap.js"></script>
   <script src="<%=basePath%>/assets/vendor/jquery-validation/dist/jquery.validate.js"></script>
   <script src="<%=basePath%>/assets/vendor/jquery.steps/build/jquery.steps.js"></script>

   <script src="<%=basePath%>/js/app.js"></script>

   <script>
   $(document).ready(function() {
       var table = $('#sys_datatable').DataTable( {
          "language": {"url": "vendor/jqdatatables/chs.json"},
          "lengthMenu":[[5,10,25,50,-1],[5,10,25,50,"All"]],
          "processing": true,
          "serverSide": true,
          "ajax": {"url": "vendor/jqdatatables/examples/server_side/scripts/post.php", "type": "POST"},
          rowId: 'id',
          "columns": [
             null,
             null,
             { "data": "first_name" },
             { "data": "last_name" },
             { "data": "position" },
             { "data": "position" }
          ],
          columnDefs: [
             { "width": "40px", "targets": 1 },
             {className:'select-checkbox',"render": function ( data, type, row ) {return "";},targets:0},
             {"render": function ( data, type, row ) {return "<font color='red'>"+data+"</font>";}, "targets": 2},
          ],
          select:{style:'multi'},
       } );
       table.on('draw', function () {
          table.column(1).nodes().each( function (cell, i) {
             cell.innerHTML = table.page.info().page * table.page.len()+i+1;
          } );
       } ).draw();
       $('#jiqun_add').on('click',function(){
          $('#sys_dlg_form_1').val("");
          $('#sys_dlg_form_2').val("");
          $("#addjiqun_dlg").modal('show');
       });
       $('#sys_update').on('click',function(){
          //先加载
          var tableids = table.rows({selected:true}).ids();
          if(tableids.length!=1)
          {
             alert("您已多选或者少选，仅能对一条数据进行操作");
          }
          else {
             $.post('__CONTROLLER__/index4edit?id=' + tableids[0], null, function (rep, status) {
                if ('' != rep) {
//                      alert(rep);
                   var data = JSON.parse(rep);
//                      alert(data);
                   $('#sys_dlg_form_category').val(data.category);
                   $('#sys_dlg_form_name').val(data.name);
                   $('#sys_dlg_form_id').val(data.id);
                   $("#sys_dlg").modal('show');
                }
             });
          }
       });
       $('#sys_del').on('click',function(){
          var tableids = table.rows({selected:true}).ids();
          if(tableids.length==0)
          {
             alert("您尚未选择数据");
          }
          else
          {
             if(confirm('确认删除'+tableids.length+'条数据?'))
             {
                var ids = [];
                $.each(tableids, function() {
                   ids.push(this);
                });
                $.post('__CONTROLLER__/index4del', {ids: ids.join(',')}, function(rep, status) {
                   if(''==rep) {
//                          alert("操作成功");
                      table.draw();
                   }
                   else {
                      alert('删除失败'+"可能是因为数据存在关联无法删除<br>错误详情："+rep);
                   }
                });
             }
          }
       });
       $('#sys_refresh').on('click',function(){
          table.draw();
       });
       $('#sys_dlg_submit').on('click',function(){
          var formBody = $('#sys_dlg_form');
          $.post('__CONTROLLER__/index4submit', formBody.serialize(),
                  function(rep, status) {
                     table.draw();
                  }
          );
       });
    });
   </script>
   <script src="<%=basePath%>/assets/vendor/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
</body>
</html>