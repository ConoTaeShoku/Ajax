<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> welcome~ ^_^ </title>
<script src="resources/jquery-3.1.1.min.js"></script>
<script>
$(function(){
	$("#regist").on('click', function(){
		var name = $("#name").val();
		var text = $("#text").val();
		if (name.length<1 || text.length==0) {
			alert('빠뜨리지 말고 입력~');
			return;
		}
		$.ajax({
			type:"post"
			, url:"insert"
			,success:function(req){
				alert(req);
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

<div id="result">

</div>

</body>
</html>