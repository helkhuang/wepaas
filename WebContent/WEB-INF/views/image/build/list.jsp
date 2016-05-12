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
   <title>构建管理</title>
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
            <h3>构建列表</h3>
            <div class="container-fluid">
             <div class="row">
                  <div class="col-lg-12">
                     <div class="panel panel-default">
                        <div class="panel-heading">构建列表</div>
                        <div class="panel-body">
                           <a href="new" id="jiqun_add"  class="btn btn-labeled btn-info"><span class="btn-label"><i class="fa fa-plus"></i></span>创建</a>
                           <a href="javascript:void(0);" id="sys_del"  class="btn btn-labeled btn-danger"><span class="btn-label"><i class="fa fa-trash"></i></span>删除</a>
                           <a href="javascript:void(0);" id="sys_refresh"  class="btn btn-labeled btn-success"><span class="btn-label"><i class="fa fa-refresh"></i></span>刷新</a>
                        </div>
                        <div class="panel-body">
                           <div class="table-responsive">
                              <table id="sys_datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                 <thead>
                                 <tr>
                                    <th>选择</th>
                                    <th>序号</th>
                                    <th>项目名称</th>
                                    <th>状态</th>
                                    <th>镜像名称</th>
                                    <th>最近创建时间</th>
                                    <th>最新版本</th>
                                 </tr>
                                 </thead>
                              </table>
                           </div>
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