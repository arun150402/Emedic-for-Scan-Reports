
<%@page import="java.io.FileInputStream ,java.sql.* ,java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
 <%!  
  	String a[]=new String[9];
 ArrayList<String> pic=new ArrayList<>();
%> 
<%
	HttpSession ses=request.getSession(true);
	a[0]=(String)ses.getAttribute("aad");
	try{  
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3306/mini_db","root","himysql");   
		Statement stmt=con.createStatement();  
		ResultSet rs=stmt.executeQuery("select * from mini_db.usersdetails where aadharnum="+'"'+a[0]+'"');  
		rs.next();
		
		int j=1;
		for(int i=1;i<=10;i++){
			if(i!=5&&i!=8)
			a[j++]=rs.getString(i);
		}
		//while(rs2.next()){
			//pic.add(rs2.getString("img"));
		//}
		a[8]="images/"+a[8];
		
		con.close();  
		}
	catch(Exception e){ System.out.println(e+" Ada lusu");
		
		}
	try{
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3306/mini_db","root","himysql");   
		Statement stmt=con.createStatement();  
		ResultSet rs2=stmt.executeQuery("select img from mini_db.reportimg where aadharnum="+'"'+a[0]+'"');  
		;
		while(rs2.next()){
			pic.add(rs2.getString("img"));
		}
		//System.out.println(pic);
	}
	catch(Exception ddd){
		
	}
	Collections.reverse(pic);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ViewDetails</title>
<link rel="icon" href="images/tit.jpg" type="image/x-icon">
<style type="text/css">
body {
	background-image: url("images/viewback.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}

.h1{
color: white;
margin-left: 38%;
margin-right: 40%;
font-size: 40px;
font-weight: bold;

}
.clr{

color: white;

 width: 40%;

}
hr{
	width: 100%;
}
/*.row:after {
	content: "";
	display: table;
	clear: both;
}
.coloum{
	color: white;
	margin-left: 3%;
	width: 50%;
	display:inline-block;
}*/

.coloum{

	display:inline;
	font-size:large;
	float: left;
 	 width: 50%;
 	color: white;
 	margin-left: 3%;	
}
.row:after {
  content: "";
  display: table;
  clear: both;
}
.btn{
padding: 13px;
background-color: black;
color: white;
border-radius: 15px 30px;
}
.btsn:hover {
	background-color: white;
	color: black; 
}
.btn:active{
	box-shadow: 0 5px #666;
    transform: translateY(4px);
}

.summa{
	margin-left: 10%;
	display: inline;
}

</style>

</head>
<body>

<script type="text/javascript">
function check() {
var txt;
return confirm("Are you want to delete the photo ?");
}
</script>

<div class="h1">
<p>VIEW DETAILS!!!</p>
</div>
<hr>

<div class="row">
 	<div class="coloum">
 		
<h3>Name: <%=a[1]+" "+ a[2] %></h3>
<h3>Aadhaar: <%= a[0] %></h3>
<h3>Father's Name: <%=a[3]%></h3>
<h3>Mother's Name: <%= a[4] %></h3>
<h3>Email: <%= a[5] %></h3>
<h3>Mobile Number: <%= a[6]%></h3>
<h3>Address: <%=a[7] %></h3>

 	
 	</div>
 	<div class="col" style="margin-right: 10%">
 	<br><br>
    <img alt="No Profile Picture" src="<%=a[8] %>" width="30%" height="280px">
  </div>
  <hr>
  </div>
  <%
  String f="<img src="+'"'+"reportpics/";
  String b="";
  b=b+'"'+" width="+'"'+"30%"+'"'+" height="+'"'+"50%"+'"'+" style=\"margin-left: ";
  String p="6%;\"><br> <br> ";
  
  String name="<h3 class=\"clr\">";
  
  String button="<form style=\" margin-left:30%\" method=\"post\" > <button onclick=\"return check()\" formaction=\"Delimg\" class=\"btn\"type=\"submit\" name=\"img\"value=\"";
 for(int i=0;i<pic.size();i++){
	 out.print(name+pic.get(i)+"</h3>");
	 out.println(f+pic.get(i)+b+p+" "+button+pic.get(i)+"\">DELETE</button><button type=\"submit\" class=\"btn\" style=\" margin-left:5%\">SCAN</button></form>");
	 //System.out.println(f+pic.get(i)+b+p+" "+button+pic.get(i)+"\">DELETE</button></form>");
 }
 pic=new ArrayList<>();
  
  %>


</body>
</html>