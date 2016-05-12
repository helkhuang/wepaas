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
   <title>存储卷管理</title>
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
     <jsp:include page="../common/header.jsp"></jsp:include>
      <aside class="aside">
          <jsp:include page="../common/left_menu.jsp"></jsp:include>
      </aside>
      <section>
         <div class="content-wrapper">
            <h3>存储卷管理</h3>
            <div class="container-fluid">
             <div class="row">
                  <div class="col-lg-12">
                     <div class="panel panel-default">
                        <div class="panel-heading">存储卷列表</div>
                        <div class="panel-body">
                           <a href="javascript:void(0);" id="jiqun_add"  class="btn btn-labeled btn-info"><span class="btn-label">添加</span><i class="fa fa-plus"></i></a>
                           
                            <div class="btn-group">
								   <button type="button" class="btn btn-primary dropdown-toggle" 
								      data-toggle="dropdown">
								      操作 <span class="caret"></span>
								   </button>
								   <ul class="dropdown-menu" role="menu">
								      <li><a href="javascript:void(0);" id="volume_activate">激活</a></li>
								      <li><a href="javascript:void(0);" id="volume_deactivate">禁用</a></li>
								   </ul>
                        </div>
                        <div class="panel-body">
                           <div class="table-responsive">
                              <table id="sys_datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                 <thead>
                                 <tr>
                                    <th>选择</th>
                                    <th>编号</th>
                                    <th>名称</th>
                                    <th>描述</th>
                                    <th>路径</th>
                                    <th>挂载点</th>
                                    <th>状态</th>
                                    <th>创建时间</th>
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
       <jsp:include page="../common/footer.jsp"></jsp:include>
   </div>
   <input type="hidden" id="poolId"/>
   <jsp:include page="form.jsp"></jsp:include>

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
   <script src="<%=basePath%>/assets/vendor/jqdatatables/extensions/Select/js/dataTables.select.js"></script>
   <script src="<%=basePath%>/assets/vendor/jqdatatables/media/js/dataTables.bootstrap.js"></script>
   <script src="<%=basePath%>/assets/vendor/jquery-validation/dist/jquery.validate.js"></script>
   <script src="<%=basePath%>/assets/vendor/jquery.steps/build/jquery.steps.js"></script>

   <script src="<%=basePath%>/assets/js/app.js"></script>
     <script src="<%=basePath%>/assets/js/common.js"></script>

   <script>
   $(document).ready(function() {
       var table = $('#sys_datatable').DataTable( {
          "language": {"url": "vendor/jqdatatables/chs.json"},
          "lengthMenu":[[5,10,25,50,-1],[5,10,25,50,"All"]],
          "processing": true,
          "serverSide": true,
          "ajax": {"url": "data", "type": "POST"},
          rowId: 'id',
          "initComplete": function(settings, json) {
        	    $("#poolId").val(json['poolId']);
           },
          "columns": [
				null,
             { "data": "id" },
             { "data": "name" },
             { "data": "description" },
             { "data": "uri" },
             { "data": "last_name" },
             { "data": "state" },
             { "data": "created" }
          ],
          select:{style:'multi'},
          columnDefs: [
             { "width": "40px", "targets": 2 },
             { "width": "140px", "targets": 3 },
             { "width": "240px", "targets": 4 },
             {className:'select-checkbox',"render": function ( data, type, row ) {return "";},targets:0}
          ]
       } );
       $('#jiqun_add').on('click',function(){
          $('#sys_dlg_form_1').val("");
          $('#sys_dlg_form_2').val("");
          $("#addVolume_dlg").modal('show');
       });
     //激活
       table_operation('volume_activate',table,'activate',null);
     //禁用
       table_operation('volume_deactivate',table,'deactivate',null);
       $('#sys_dlg_submit').on('click',function(){
           var formBody = $('#sys_dlg_form');
           $.ajax({
         	  url:'add',
         	  data:formBody.serialize(),
         	  dataType:'json',
         	  type:'post',
         	  error:function(XMLHttpRequest, textStatus, errorThrown){
         		  table.ajax.reload(null, false ); // 刷新表格数据，分页信息不会重置
         	  },
         	  success:function(result){
         		  table.ajax.reload(null, false ); // 刷新表格数据，分页信息不会重置
         	  }
           });
        });
    });
   </script>
   <script src="<%=basePath%>/assets/vendor/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
</body>
</html>