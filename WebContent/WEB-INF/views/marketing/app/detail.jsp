<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
   <title>云市场</title>
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
            <h3><a href="list">应用市场</a></h3>
            <div class="container-fluid">
               <div class="row">
                  <div class="col-lg-12">
                     <div class="panel panel-default">
                        <div class="panel-heading">
                        </div>
                        <div class="panel-body">
                           <div class="row">
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <article>
                                    <header class="Stack-badge-header">
                                       <div class="stack-icon">
                                          <div class="stack-badge text-center">
                                                <img style="width:110px;height:117px" src="${template.links.icon}">
                                          </div>
                                       </div>
                                       <div class="stack-headings" style="text-align:center">
                                          <h1>
                                             <span itemprop="name">${template.name}</span>
                                          </h1>
                                       </div>
                                    </header>
                                    <span itemprop="description">
                                       <p><font size="4">${template.description}</font></p>
                                       <div class="c-isv-extra-information">
                                          <p>
                                            <font size="4">${template.readme}</font>
                                          </p>
                                       </div>
                                    </span>
                                 </article>
                                 <div class="text-center">
                                    <button type="button" class="btn btn-labeled btn-success" href="javascript:void(0);" id="aa_shownum" >
                                       <span class="btn-label"><i class="fa fa-download"></i></span>租用
                                    </button>
                                 </div>
                              </div>
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