<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script>
	function al(){
		alert("Password Changed Successfully");
		return true;
	}
</script>
<form action="Changepass" method="post" onsubmit="return al()">
    New Password:<input type="password" id="p" name="p"><br><br>
    Re-Enter New Password:<input type="password" id="pw" name="pw"><br><br>
    <input type="submit">
</form>
</body>
</html>