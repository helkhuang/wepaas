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
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <meta name="description" content="SEO描述信息">
   <meta name="keywords" content=SEO关键字>
   <title>集群管理</title>
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
     <jsp:include page="../../common/header.jsp"></jsp:include>
      <aside class="aside">
          <jsp:include page="../../common/left_menu.jsp"></jsp:include>
      </aside>
      <section>
          <div class="content-wrapper">
            <h3>应用构建</h3>
            <div class="container-fluid">
               <div class="row">
                  <div class="col-lg-12">
                     <div class="panel panel-default">
                        <div class="panel-heading">应用构建</div>
                        <div class="panel-body">
                           <form method="get" action="/" class="form-horizontal">
                              <fieldset>
                                 <div class="form-group">
                                    <label class="col-sm-2 control-label">应用名称</label>
                                    <div class="col-sm-10">
                                       <input type="text" class="form-control form-control-rounded">
                                    </div>
                                 </div>
                              </fieldset>
                              <fieldset>
                                 <div class="form-group">
                                    <label class="col-sm-2 control-label">代码地址</label>
                                    <div class="col-sm-10">
                                       <input type="text" class="form-control form-control-rounded">
                                    </div>
                                 </div>
                              </fieldset>
                              <fieldset>
                                 <div class="form-group">
                                    <label class="col-sm-2 control-label">镜像名称</label>
                                    <div class="col-sm-10">
                                       <input type="text" class="form-control form-control-rounded">
                                    </div>
                                 </div>
                              </fieldset>
                              <fieldset>
                                 <div class="form-group">
                                    <label class="col-sm-2 control-label">分之名称</label>
                                    <div class="col-sm-10">
                                       <input type="text" class="form-control form-control-rounded">
                                    </div>
                                 </div>
                              </fieldset>
                              <fieldset>
                                 <div class="form-group">
                                    <label class="col-sm-2 control-label">项目说明</label>
                                    <div class="col-sm-10">
                                       <textarea class="form-control" rows="3"></textarea>
                                    </div>
                                 </div>
                              </fieldset>
                              <fieldset>
                                 <div class="form-group">
                                    <label class="col-sm-2 control-label">自动构建</label>
                                    <div class="col-sm-10">
                                       <div class="radio"><label><input id="optionsRadios1" type="radio" name="optionsRadios" value="option1" checked="">是</label></div>
                                       <div class="radio"><label><input id="optionsRadios2" type="radio" name="optionsRadios" value="option2">否</label></div>
                                    </div>
                                 </div>
                              </fieldset>


                              <fieldset>
                                 <div class="form-group">
                                    <label class="col-sm-2 control-label">自动构建时间</label>
                                    <div class="col-sm-10">
                                       <select name="account" class="form-control m-b">
                                          <option>5分钟</option>
                                          <option>10分钟</option>
                                          <option>20分钟</option>
                                       </select>
                                    </div>
                                 </div>
                              </fieldset>

                              <fieldset>
                                 <div class="form-group">
                                    <label class="col-sm-2 control-label">触发规则</label>
                                    <div class="col-sm-10">
                                       <label class="checkbox-inline c-checkbox">
                                          <input id="inlineCheckbox10" type="checkbox" value="option1">
                                          <span class="fa fa-check"></span>Tag更新</label>
                                       <label class="checkbox-inline c-checkbox">
                                          <input id="inlineCheckbox20" type="checkbox" value="option2">
                                          <span class="fa fa-check"></span>代码分支更新</label>
                                    </div>
                                 </div>
                              </fieldset>
                              <div class="text-center">
                                 <button type="button" class="btn btn-labeled btn-success" href="javascript:void(0);" id="aa_shownum" ><span class="btn-label"><i class="fa fa-download"></i></span>创建</button>
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
       <jsp:include page="../../common/footer.jsp"></jsp:include>
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
              { "data": "position" },
              { "data": "office" }
           ],
           columnDefs: [
              { "width": "40px", "targets": 0 },
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
        $('#sys_add').on('click',function(){
           $('#sys_dlg_form_category').val("分类1");
           $('#sys_dlg_form_name').val("");
           $('#sys_dlg_form_id').val("");
           $("#sys_dlg").modal('show');
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
//                       alert(rep);
                    var data = JSON.parse(rep);
//                       alert(data);
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
//                           alert("操作成功");
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
//                   alert("操作成功");
                      table.draw();
                   }
           );
        });
    });
   </script>
   <script src="<%=basePath%>/assets/vendor/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
</body>
</html>