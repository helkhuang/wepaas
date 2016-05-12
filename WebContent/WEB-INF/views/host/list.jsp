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
   <title>主机管理</title>
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
            <h3>主机管理</h3>
            <div class="container-fluid">
             <div class="row">
                  <div class="col-lg-12">
                     <div class="panel panel-default">
                        <div class="panel-heading">主机列表</div>
                        <div class="panel-body">
                           <a href="javascript:void(0);" id="host_add"  class="btn btn-labeled btn-info"><span class="btn-label"><i class="fa fa-plus"></i></span>添加</a>
                        </div>
                        <div class="panel-body">
                           <div class="table-responsive">
                              <table id="sys_datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                 <thead>
                                 <tr>
                                    <th>编号</th>
                                    <th>主机地址</th>
                                    <th>主机名</th>
                                    <th>容器版本</th>
                                    <th>操作系统</th>
                                    <th>CPU</th>
                                    <th>内存</th>
                                    <th>硬盘</th>
                                    <th>标签</th>
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
   
   <script src="<%=basePath%>/assets/vendor/Flot/jquery.flot.js"></script>
   <script src="<%=basePath%>/assets/vendor/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
   <script src="<%=basePath%>/assets/vendor/Flot/jquery.flot.resize.js"></script>
   <script src="<%=basePath%>/assets/vendor/Flot/jquery.flot.pie.js"></script>
   <script src="<%=basePath%>/assets/vendor/Flot/jquery.flot.time.js"></script>
   <script src="<%=basePath%>/assets/vendor/Flot/jquery.flot.categories.js"></script>
   <script src="<%=basePath%>/assets/vendor/flot-spline/js/jquery.flot.spline.min.js"></script>
   <script src="<%=basePath%>/assets/js/demo/demo-flot.js"></script>

   <script src="<%=basePath%>/js/app.js"></script>

   <script>
   $(document).ready(function() {
       var table = $('#sys_datatable').DataTable( {
    	   "processing": true,
           "paging": false,
           "searching": false,
           "serverSide": true,
           "ordering": false,
           "ajax": {"url": "data", "type": "GET"},
          rowId: 'id',
          "columns": [
             { "data": "id"}, 
             { "data": "publicEndpoints" },
             { "data": "hostname"},
             { "data": "labels"},
             { "data": "info" },
             { "data": "info" },
             { "data": "info"},
             { "data": "info" },
             { "data": "labels" },
             { "data": "state" },
             { "data": "created" }
          ],
          columnDefs: [
				{ "width": "80px","render": function (data, type, row ) {return '<a href="info?hostId='+data+"\">"+data+"</a>"},"targets": 0},
			 { "width": "80px","targets": 1},
             { "width": "80px","render": function (data, type, row ) {return data},"targets": 2},
             { "width": "80px", "render": function (data, type, row ) {return data[0]['ipAddress'];},"targets": 1 },
             { "width": "200px", "render": function ( data, type, row ) {return data['io.rancher.host.docker_version'];},"targets": 3 },
             { "width": "100px", "render": function ( data, type, row ) {return data['osInfo']['operatingSystem'];},"targets": 4 },
             { "width": "80px", "render": function ( data, type, row ) {return data['cpuInfo']['count']+'x'+data['cpuInfo']['mhz']/1000+'GHz';},"targets":5 },
             { "width": "80px", "render": function ( data, type, row ) {
            	                  var d = data['memoryInfo']['memTotal']/1000;
			            	      return d.toFixed(2)+'Gib';},
			            	      "targets": 6
            	      },
            { "width": "80px", "render": function ( data, type, row ) {
    	                  //var d = data['diskInfo']['mountPoints']/1000;
    	                  var diskMountPoints = data['diskInfo']['mountPoints'];
    	                  var diskTotals =0;
    	                  for (var key in diskMountPoints) {  
    	                	  var total = diskMountPoints[key]['total']/1000;
    	                	  diskTotals = diskTotals + total;
    	    	          } 
    	                  	return diskTotals.toFixed(1)+'GiB';
	            	      },
	            	      "targets": 7
    	      },
    	      {"width": "80px", "render": function ( data, type, row ) {
    	    	  var showString = "";
    	    	  for (var key in data) {  
    	               showString = "<p>"+key+"="+data[key]+"</p>";
    	          }  
    	    	  return showString;
        	 	},"targets": 8
      		  }
          ]
       } );
       $('#host_add').on('click',function(){
    	   $("#dlg_host_add").modal('show');
       });
       
       $('#sys_datatable tbody').on( 'click', 'td', function () {
    	    var hostId = table.row( this ).data()['id'];
    	    window.location.href="info";
    	} );
       
       $('#registry_update').on('click',function(){
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
       $('#registry_del').on('click',function(){
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
       
       
     //定义表格对象, 20160416, Edwin Xiang
       var dlg_tjzj_table = $('#dlg_tjzj_table').DataTable( {
          "language": {"url": "vendor/jqdatatables/chs.json"},
          "paging":false,
          "ordering":false,
          "info":false,
          "searching":false,
          select:{style:'os'}
       } );

       $('#dlg_tjzj_add').on('click',function() {
          var t1='<input id="dlg_tjzj_bq" name="tjzj_key" type="text" class="form-control">';
          var t2='<input id="dlg_tjzj_bq" name="tjzj_value" type="text" class="form-control">';
          dlg_tjzj_table.row.add([
             t1,t2
          ]).draw(false);
       });

       $('#dlg_tjzj_remove').on('click',function(){
          dlg_tjzj_table.row('.selected').remove().draw(false);
       });
       
       
       $('#registry_refresh').on('click',function(){
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