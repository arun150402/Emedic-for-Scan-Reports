<%@ page language="java"  import="java.io.FileInputStream ,java.sql.* ,java.util.*,java.io.*,javax.servlet.annotation.WebServlet" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%! String name="";
	String val[]=new String[7];
	String ans[]=new String[7];%>    
<% 
 name = (String)request.getParameter("add");

try{  
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:mysql://localhost:3306/mini_db","root","himysql");
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from mini_db.usersdetails where aadharnum="+'"'+name+'"');  
	rs.next();
	int j=0;
	for(int i=1;i<=9;i++){
		if(i!=5&&i!=6)
		val[j++]=rs.getString(i);
	}
	//System.out.print(Arrays.toString(val));
	con.close();  
	}
catch(Exception e){ System.out.println(e+" Ada lusu");
	
	}


 %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Updation</title>
<link rel="icon" href="images/tit.jpg" type="image/x-icon">
<style type="text/css">
@keyframes anim{
	/*0% {text-shadow: 5px 5px 7px green;}
	20% {text-shadow: 5px 5px 7px red;} 	
	40% {text-shadow: 5px 5px 7px blue;}
	60% {text-shadow: 5px 5px 7px yellow;}
	80% {text-shadow: 5px 5px 7px orange;}
	100% {text-shadow: 5px 5px 7px pink;}*/
	0% {text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;}
	20% {text-shadow: 1px 1px 2px red, 0 0 25px green, 0 0 5px orange;} 	
	40% {text-shadow: 1px 1px 2px yellow, 0 0 25px red, 0 0 5px green;}
	60% {text-shadow: 1px 1px 2px orange, 0 0 25px yellow, 0 0 5px pink;}
	80% {text-shadow: 1px 1px 2px aquawhite, 0 0 25px violet, 0 0 5px yellow;}
	100% {text-shadow: 1px 1px 2px green, 0 0 25px yellow, 0 0 5px orange;}
}
.he1{
    left:0;  top:0;text-align:center;color:brown;animation-name: anim; animation-duration: 1.5s;
    animation-iteration-count: infinite;animation-direction:alternate;
    font-family: Bookman Old Style;
    width: 100%;
    vertical-align:middle;
    
}
body{
    background-image:url('images/upback.jpg');
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;
}
label{
	font-size: 1.4em;
	font-family: fantasy;
}
div{
    /*background-color:antiquewhite;*/
    margin-left: 25%;
    margin-right: 30%;
    width:50%;
    padding: 30px;
    backdrop-filter:blur(10px);
}
.i{
    display: block;clear:both;
    width:60%;
    padding: 10px;
    margin-top: 5px;
    font-size: 15px;
    position:relative;
    margin-left:8%;
    transition-duration: 0.5s;
    font-weight:bold;
    /* z-index:5;*/
}
label{
    display: inline-block;
    margin-top: 10px;
    margin-left: 8%;
    font-size: 1.3rem;
}
textarea{
    width:75%;
}
.i:focus{
	transform: scale(1.1,1.2);
	color: red;
	box-shadow: 0 12px 16px 0 rgba(0,0,0,0.5),0 17px 50px 0  rgba(0,0,0,0.5);
}
.i:hover{
	background-color: antiquewhite;  
}

.buttons{
	background-color:green;color:white;
	padding: 5px;
	width:35%;margin-left:2%;
	margin-bottom: 2%;
	transition-duration:0.3s;
	font-size:1.2rem; /*box-shadow: 0 10px #999;*/
}
.buttons:hover{
   cursor:pointer;
   /*background-color:green;opacity:0.9;*/
   box-shadow: 0 12px 16px 0 black,0 17px 50px 0 black;
   opacity:0.8;
}
.buttons:active{
	box-shadow: 0 5px #666;
    transform: translateY(4px);
}

.division{
font-family: Bookman Old Style;
font-weight:bold;
}

</style>
</head>
<body>

<script type="text/javascript">
         function Toggle1(){
        	 var ch=document.getElementById("epass");
        	 var but=document.getElementById("check1");
        	 if(ch.type==="password"){
        		 ch.type="text";
        		 but.value="Hide";
        	 }
        	 else{
        		 ch.type="password";
        		 but.value="Show";
        	 }
         }
         function Toggle2(){
        	 var ch=document.getElementById("repass");
        	 var but=document.getElementById("check2");
        	 if(ch.type==="password"){
        		 ch.type="text";
        		 but.value="Hide";
        	 }
        	 else{
        		 ch.type="password";
        		 but.value="Show";
        	 }
         }
         
         
        </script>
        
<h1 class="he1">LET'S UPDATE YOUR PERSONAL DETAILS</h1>
        <div class="division">
         <form action="updateSerlet" method="post">
            <label for="fname" class="division">First Name:</label>
            <input class="i" type="text" id="fname" value="<%=val[0] %>" name="fname">
            <label for="lname"class="division">Last Name:</label>
            <input class="i" type="text" id="lname" value="<%=val[1] %>" name="lname" >
            <label for="father"class="division">Father's Name:</label>
            <input class="i"  type="text" id="father" name="father" value="<%=val[2] %>">
            <label for="mother"class="division">Mother's Name:</label>
            <input class="i" type="text" id="mother" name="mother" value="<%=val[3] %>">
            <label for="mob"class="division">Mobile:</label>
            <input class="i" type="text" id="mob" name="mob" value="<%=val[4] %>">
            <label for="add" class="division">Address:</label>
            <textarea class="i" id="add" name="address" style="resize: none;" ><%=val[6] %></textarea>
			<label for="cpass" class="division">Current Password:</label>
            <input class="i" type="text" id="cpass" name="cpass" value="<%=val[5] %>">
            <label for="epass" class="division">New Password:</label>  
            <input class="i" type="password" id="epass" name="epass" required="required"> 
            <!--<input class="check" type="button" style="float:right; margin-right:10%; margin-top:0; padding: 5px;" onclick="Toggle1()" id="check1" value="Show">-->
            <label for="repass" class="division">Re-Enter Password:</label> 
            <input class="i" type="password" id="repass" name="repass" required="required">  
            <!-- <input class="check" type="button" style="float:right; margin-right:10%; margin-top:0; padding: 5px;" onclick="Toggle2()" id="check2" value="Show" >-->	
            <button class="buttons" name="adhar" onclick="myFunction()" value="<%=name %>" type="submit" style="margin-top: 9px; width:45%; height:auto; padding: 10px;">Submit</button>
            <input class="buttons" type="reset" style="margin-top: 9px; width:45%; height:auto; padding: 10px;">
         </form>
        </div>
</body>

<script>
			function myFunction() {
  			window.confirm("Updated SuccessFully!!!");
			}
			
</script>

</html>




