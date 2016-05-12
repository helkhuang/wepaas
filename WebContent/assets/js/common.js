function table_operation(commandId,table,url,callback){
	$('#'+commandId).on('click',function(){
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
              $.ajax({
            	  url:url,
            	  data:{ids: ids.join(',')},
            	  dataType:'json',
            	  type:'post',
            	  error:function(XMLHttpRequest, textStatus, errorThrown){
            		  if(callback){
            			  callback(textStatus,errorThrown,table);
            			  table.ajax.reload(null, false ); // 刷新表格数据，分页信息不会重置
            		  }else{
            			  table.ajax.reload(null, false ); // 刷新表格数据，分页信息不会重置
            		  }
            	  },
            	  success:function(result){
            		  if(callback){
            			  callback(result,table);
            			  table.ajax.reload(null, false ); // 刷新表格数据，分页信息不会重置
            		  }else{
            			  table.ajax.reload(null, false ); // 刷新表格数据，分页信息不会重置
            		  }
            	  }
              });
           }
        }
     });
}


