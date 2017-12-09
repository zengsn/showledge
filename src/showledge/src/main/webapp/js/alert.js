$(document).ready(function() {
	/*$("#signin-btn").click(function(event) {
		var password = $("#inputPassword1").val(); //用户输入的密码
		var checkNum = $("#inputCheckNum").val(); //用户输入的验证码
		if (password!=123) {
			$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('密码错误');
		}
		else if (checkNum!=1234) {
			$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('验证码错误');			
		}
		else {
			$('.alert').removeClass('alert-danger');
			$('.alert').addClass('alert-success');
			$('.alert').text('登录成功');
		}
		$('.alert').slideDown();
		var Timer = setTimeout(function(){
		    $('.alert').slideUp();
		}, 2000);
	});*/

	/*$("#signup-btn").click(function(event) {
		var name = $("#inputUserName").val(); //用户注册的用户名
		var checkNum2 = $("#inputCheckNum2").val(); //用户输入的验证码
		var email = $("#inputEmail2").val();  //用户注册的邮箱
		var password2 = $("#inputPassword2").val();  //用户注册的密码
		var password3 = $("#inputPassword3").val();  //用户确认的密码
		if (email=="moo@126.com") {
			$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('邮箱已被注册');	
		}	
		else if (name==123) {
			$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('用户名已被注册');			
		}
		else if (name=="") {
			$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('用户名不能为空');			
		}
		else if (password2=="") {
			$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('密码不能为空');			
		}
		else if (password2!=password3) {
			$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('密码不一致');			
		}				
		else if (checkNum2!=1234) {
			$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('验证码错误');			
		} 
		else {
			$('.alert').removeClass('alert-danger');
			$('.alert').addClass('alert-success');
			$('.alert').text('注册成功');
		}
		$('.alert').slideDown();
		var Timer = setTimeout(function(){
		    $('.alert').slideUp();
		}, 2000);
	});	*/
	
	
	/*发布笔记*/
	  $("#submit").click(function(event) {
		  var cate = $("#category-pick").val();
		  var title = $("#title").val();
		  
		  //var E = window.wangEditor;
	       // var editor1 = new E('#div1','#div2');  // 两个参数也可以传入 elem 对象，class 选择器   	        
		  var content = editor1.txt.html(); 
		  
	   	if (cate == "") {
	   		$('.alert').removeClass('alert-success');
				$('.alert').addClass('alert-danger');
				$('.alert').text('请选择笔记分类');	
	   	} else if(title == ""){
	   		$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('请填写标题');
	   	}else if($("#title").val() == ""){
	   		
	   	}else {
	   		$('.alert').removeClass('alert-danger');
				$('.alert').addClass('alert-success');
				$('.alert').text('保存成功');
	   	}
	   	
		$('.alert').slideDown();
		/*var Timer = setTimeout(function(){
		    $('.alert').slideUp();
		}, 2000);    */
		  
		//alert($("#category-pick").find("option:selected").attr("name"));
		  $.post("writer/addNote.do",{title:title,content:content,type:$("#category-pick").find("option:selected").attr("name")},function(result){
			  if(result.success == true){
				  $('.alert').text('保存成功');
				  var Timer = setTimeout(function(){
					    $('.alert').slideUp();
					    window.location.href="user.do"; 
					}, 1000);  
			  }else{
				  $('.alert').text('发生错误,请重试');
			  }
		  });
		  
	  });

	  
});









