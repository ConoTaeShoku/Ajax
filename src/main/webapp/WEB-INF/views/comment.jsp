<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> welcome~ ^_^ </title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function deleteComment(num){
	var myData = { num: num };
	$.ajax({
		type:"get"
		, url:"delete"
		, data: myData
		, dataType : "text"
		, error : function(){
            alert('error!');
        }
		, success:function(req){
			alert(req);
			renewComments();
		}
	});
}

function renewComments(){
	$.ajax({
		type : "get"
        , url : "list"
        , dataType : "text"
        , error : function(){ alert('error!'); }
		, success : function(data){
			var cList = 'success!<br>';
			var obj = $.parseJSON(data);
			$.each(obj, function(key, value) {
				cList += 'num:' + value.num + ', name: ' + value.name + ', text:' + value.text;
				cList += '&nbsp&nbsp<input type="button" onClick="deleteComment(' + value.num + ')" value="num은' + value.num + '"><br>';
			});
			$("#result").html(cList) ;	
		}
	});
}

$(function(){
	renewComments();
	
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
				$("#name").val('');
				$("#text").val('');
				alert(req);
				renewComments();
			}
		});
	});
	 
	$("#renew").on('click', function(){ renewComments(); });
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