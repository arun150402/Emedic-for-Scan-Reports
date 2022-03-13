<%@ page import="java.io.FileInputStream ,java.sql.* ,java.io.*"
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%!  
   public String name = "" ;public String downloadpath="" ;String aadhar="";  
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<link rel="icon" href="images/tit.jpg" type="image/x-icon">

<% name = (String)request.getAttribute("myname");

HttpSession ses=request.getSession(true);
ses.setAttribute("aad", name);
aadhar=name;
	
try{  
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:mysql://localhost:3306/mini_db","root","himysql");   
	Statement stmt=con.createStatement();  
	ResultSet rs=stmt.executeQuery("select * from mini_db.usersdetails where aadharnum="+'"'+name+'"');  
	rs.next();
	String imgname=rs.getString("img");
	downloadpath="images/"+imgname;
	name=rs.getString("uname");
	con.close();  
	}
catch(Exception e){ System.out.println(e+" Ada lusu");
	
	}
    
 %>

<style type="text/css">
	body{
			background: url("images/opt.jpg");	
			background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
	}
	.person_pic {
		 margin-left: 1251px;
		 display: inline-block;
		font-size:xx-large;
		
}

	.line :before {
	content: '';
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: #262626;
	z-index: 1;
}
.line:after {
	content: '';
	position: absolute;
	display: block;
	top: 105px;
	left: 78.0%;
	width: 20.3%;
	height: 3px;
	background: #fff;
	z-index: 2;
	transform-origin: left;
	transform: scaleX(0);
	animation: linemov 3s infinite alternate;
}

@keyframes linemov {
    0%{
        transform: translate(0) scale(0);
        transform-origin: left;
        left: 78%;
        right: auto;
    }
        
    45%{
        transform: translate(0) scale(1);
        transform-origin: left;
        left: 78%;
        right: auto;
    }
    50%{
        transform: translate(0) scale(1);
        transform-origin: right;
        left: auto;
        right:1.7%;
    }
    100%{
        transform: translate(0) scale(0);
        transform-origin: right;
        left: auto;
        right: 1.7%;
    }
    
}
.out{
 margin: 80px 0 30px 50px;
}

.coloum{

	display:inline;
	font-size:xx-large;
	float: left;
 	 width: 50%;
  	padding: 45px;
}
.row:after {
  content: "";
  display: table;
  clear: both;
}
.lb{
	
	padding: 20px;
	background-color:white;
	border-radius: 15px 50px;
	font-size:x-large;
	font:100% Bookman Old Style;
}
button:hover {
	background-color:rgb(255, 192, 56);
	color: white;
	cursor: pointer;
}
	.para{
	font-weight: bold ;
	font-size: x-large;
	font-family:  High Tower Text;
	color: hsl(38, 100%, 96%);
	}
	.vertical {
            border-left: 6px solid #bbfffc;
            height: 400px;
            position:absolute;
            left: 50%;
        }
        
     .lbb{
     margin: 0 0 0 30px;
     background-color: white;
     padding: 10px;
     border-radius: 15px;
     font-family:Bookman Old Style ;
     font-size: medium;
     
     }   
        
        
        
        
</style>
</head>
<body>
<div class="person_pic">
<pre>
    <label style="font-family: Bookman Old Style"><%=name %></label> <img src="<%=downloadpath %>" alt="your image" width="50px" height="50px"/>
    
    </pre>
 </div>
 <div class="line">
 
 </div>
 <div class="row">
 	<div class="coloum">
 	<form action="ViewForm.jsp" method="post" target="_blank">
 	 <img src="images/view.png" alt="your image" width="50px" height="40px"/>    <button class="lb" type="submit">View Details!</button><br><br></form>
 	 <form action="Upload.jsp" method="post" target="_blank">
 	 <img src="images/upload.png" alt="your image" width="50px" height="40px"/>    <button class="lb" type="submit" name="add" value="<%= aadhar %>"> Upload Documents!!</button><br><br></form>
 	 <form action="Update.jsp" method="post" target="_blank">
 	 <img src="images/update.png" alt="your image" width="50px" height="50px"/>    <button class="lb" type="submit" name="add" value="<%= aadhar %>">Update Your Details!!!</button>
 	</form>
 	
 	</div>
 	<div class="vertical"></div>
 	<div class="col">
    <h1>Welcome <%= name %> ,</h1>
    <p class="para">Cloud storage allows you to access files and documents from anywhere you are via mobile devices or office computers.To maintain paper documents, you will need a large physical filing system that will take up significant space over time.
     Flexible. Efficient. Cost-effective. Digital documents hold a clear advantage over paper documents in most cases. 
     You can utilize your office space more efficiently, boost productivity with remote capabilities, and show your environmental consciousness. 
     Plus, another great thing about maintaining a digital database of all your documents and data is you can always print out hard copies when you need them. 
     Consider making the switch to digital documents today.</p>
  </div>
  <br><br>
 <button class="lbb" onclick="document.location='Login.html'">Back</button>
 </div>

</body>
</html>