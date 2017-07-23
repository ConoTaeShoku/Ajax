<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> welcome~ ^_^ </title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	$("#regist").on('click', function(){
		var name = $("#name").val();
		var text = $("#text").val();
		var myData = { name: name, text: text };
		if (name.length<1 || text.length==0) {
			alert('enter text!');
			return;
		}
		$.ajax({
			type:"post"
			, url:"insert"
			, data: myData
			, error : function(){
                alert('error!');
            }
			, success:function(req){
				alert(req);
			}
		});
	});
	 
	$("#renew").on('click', function(){
		$.ajax({
			type : "GET"
            , url : "list"
            , dataType : "text"
            , error : function(){
                alert('error!');
            }
			, success : function(data){
				
				//여러개의 데이타가 있을경우
				var obj2 = [{ name: "홍길동", age: "20" },{ name: "이순신", age: "30" }];
				$.each(obj2,function(key,value) {
					alert('key:'+key+', name:'+value.name+',age:'+value.age);
				});


				
				var obj = jQuery.parseJSON(data);
				alert( obj.num === "1" );
				//$("#result").html(arr) ;				
            }
		});
	});
});
</script>
</head>
<body>
<h1>~~안녕하세요~~</h1>
<div>
	이름 : <input type="text" id="name" name="name" /> <br />
	댓글 : <input type="text" id="text" name="text" /> <br />
	<input type="button" id="regist" value="등록" />
</div>
<h1>~~댓글들~~</h1>
<input type="button" id="renew" value="새로고침" />
<div id="result">
</div>
</body>
</html>