

$(function(){
	//点击添加的时候，显示添加的对话框
	$("#addUser").click(function(){
		$("#userForm")[0].reset(); //清空表单
		$("#editUser").modal("toggle");
	});
	
	//点击对话框的保存按钮，提交表单数据
	$("#save").click(function(){
		//校验省略
		
		$("#userForm").submit();//提交表单
	});
	
	$("#enter").click(function(){//点击确认要删除的时候触发的方法
		var id = $("#id").val();
		//发送请求给后台服务器，并且携带id
//		$.ajax({
//			   type: "POST",
//			   url: "/account/del",
//			   async:false,
//			   data: {"id":id},
//			   dataType: "json",
//			   success: function(msg){
//				   console.info(msg);
//				   debugger;
//			     alert(msg);
//			   }
//			});
		
		
		$.get("/account/del?id="+id, function(data){
				if(data=="success"){
					 $("#tips").modal("toggle");
				}else{
					alert("系统繁忙，请稍后重试！");
				}
			 
			});
		
	});
	
});


//定义用户删除的事件方法
function del(id){
	$("#id").val(id);
	$("#ask").modal("toggle");
}

//点击修改的事件方法
function edit(id){
	//发送请求获取用户的数据
	$.get("/account/edit?id="+id, function(data){
		//把数据回显给用户看
		// javascript或者jquery dom操作
		$("#editId").val(data.id);
		$("#userForm [name='name']").val(data.name);
		$("#userForm [name='phone']").val(data.phone);
		$("#userForm [name='email']").val(data.email);
		$("#userForm [name='qq']").val(data.qq);
		$("#userForm [name='weixin']").val(data.weixin);
		$("#userForm [name='account']").val(data.account);
		
		$("#editUser").modal("toggle");
	});
	
}
