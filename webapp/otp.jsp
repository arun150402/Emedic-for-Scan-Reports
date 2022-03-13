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
function fun(){
	var xx=<%=(String)request.getSession(false).getAttribute("otp")%>;
	<% HttpSession h=request.getSession(false);
	System.out.println(h.getMaxInactiveInterval()+"seconds");
	System.out.println(h.getAttribute("otp"));%>
	var yy=document.getElementById("otp").value;
	if(xx==null){
		alert("OTP Session expires");
		return false;
	}
	if(xx==yy){
		alert("Valid OTP");
		return true;
	}
	else{
		alert("Invalid OTP");
		return false;
	}
}
</script>
<h1>Enter OTP:</h1>
<form action="ChangePassword.jsp" method="post" onsubmit="return fun()"><input type="text" name="otp" id="otp">  <input type="submit" value="OK"></form>
</body>
</html>