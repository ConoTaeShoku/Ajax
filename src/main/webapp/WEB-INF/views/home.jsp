<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Home</title>
<script src="resources/jquery-3.1.1.min.js"></script>
<script>
$(function(){
	$("#ajax1").on("click", function(){
		var myData = {
			custid: $('#custid').val()
			, password: $('#password').val()
			, text: $('#text').val()
		};	
		$.ajax({
			method:"get"
			, url:"ajaxtest"
			, data:myData //앞에는 띄어쓰기 안됨
			, success: function(resp){ //200번 request를 받을 때 처리하는 callback 함수
				$('#fromServer').html('from server : '+resp);
			}
			, error: function(){ //그 이외 request
				alert('error');
			} 
		});
	});
	
	$("#ajax2").on("click", function(){
		$.ajax({
			method:"get"
			, url:"ajaxtest2"
			, success: function(resp) {
				var custid = resp.custid;
				var password = resp.password;
				var text = resp.text;
				var temp = '';
				temp += "<b>"+custid+"</b><br />";
				temp += "<b>"+password+"</b><br />";
				temp += "<b>"+text+"</b><br />";
				$('#fromServer2').html(temp);
			}
		});
	});
	
	$("#ajax3").on("click", function(){
		$.ajax({
			method:"get"
			, url:"ajaxtest3"
			, success: function(resp) {
				var temp = '';
				$(resp).each(function( index ) {
					var custid = resp[index].custid;
					var password = resp[index].password;
					var text = resp[index].text;
					temp += "<b>"+custid+" </b>";
					temp += "<b>"+password+" </b>";
					temp += "<b>"+text+" </b><br />";
				});
				$('#fromServer3').html(temp);
			}
		});
	});
});
</script>
</head>
<body>
<h1>Ajax 공부를 시작해요!</h1>
<div id="input">
	<table>
	<tr>
		<th>custid</th>
		<td><input type="text" name="custid" id="custid"></td>
	</tr>
	<tr>
		<th>password</th>
		<td><input type="password" name="password" id="password"></td>
	</tr>
	<tr>
	<th>text</th>
	<td><input type="text" name="text" id="text"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="button" value="Ajax1" id="ajax1"></td>
	</tr>
	</table>
</div>
<div id="fromServer">
</div>

<h1>오늘은 Ajax를 공부한지 이틀째 되는날!</h1>
<div>
	<h2>result2</h2>
	<div id="fromServer2">
	</div>
	<input type="button" value="Ajax2" id="ajax2"><br />
	<h2>result3</h2>
	<div id="fromServer3">
	</div>
	<input type="button" value="Ajax3" id="ajax3"><br />
</div>

</body>
</html>
