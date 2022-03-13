<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
    <head>
        <style>
            body {
                background-image: url('images/Background .jpg');
              /*  https://drive.google.com/thumbnail?id=14JG_c-p41BvNmj5kVh3UMiK95ndJKjlK/view*/
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;
            }

        </style>
        <title>E-MEDI</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

    </head>
   <link rel="icon" href="images/tit.jpg" type="image/x-icon">
<body>

<style>
    .pane1{
        font:status-bar;
        text-align: center;
        font-size: 2.5vw;
        font-family: Bookman Old Style;
    }
    h2{
    
        background-color:rgb(241, 241, 241);
        color:black;
        padding: 30px;
        margin-right: 1100px;
        font-family: Matura MT Script Capitals;
        position: relative;
        right: 500px;
        border-radius: 15px 50px;
        left: 1100px;
        
       

    }
  
    .er{
         margin: 0 350px 5px 890px;
        color: rgb(255, 15, 15);
        font-family: Bookman Old Style ;
        font-weight: bold;
        padding: 10px;
      	text-shadow: 0 0 13px white;
        border-radius: 15px 50px;
        font-size: 1.7vw;
        -webkit-box-reflect : below 1px linear-gradient(transparent , #0004);
		line-height: 0.70em;
		outline: none;
		display: flex;
     animation: animate 3s linear infinite;
    }
    @keyframes animate{
	0%{
		color: white;
		
	}
	50%,100%{
		color: red;
		text-shadow: 0 0 10px white,
		            

	}
}

    .aadhar{
        color: white;
        text-align: left;
        position: relative;
        font:bold 100% Gungsuh;
        left: 900px;
        background-color: black;
        margin-right: 1000px;
        border-radius: 15%,50%;
        padding: 10px;

    }
    .aadha :hover{
        background: cadetblue;
    }
    .help{
        background-color: rgb(255, 255, 255);
        position: relative;
        border: transparent;
        font: bold 110% High Tower Text;
        left: 1460px;
        padding: 3px;
    }
    .reg{
        background-color: rgb(255, 255, 255);
        position: relative;
        border: transparent;
        left: 1320px;
        font: bold 90% High Tower Text;
		border-radius: 10px;
        width: 200px;
        height: 30px;

    }
</style>

  <!-- <h1 style="text-align: center;"><img src="https://drive.google.com/thumbnail?id=11FnNyxjTsdezvYtXx0WK2wY_-N-qlorX" alt="Picture of doctor" width="150" height="120"></h1>-->
    <h1 style="text-align: center;">  E-MEDIC WITH AI UPDATED</h1>
    <hr>
    <br>
    <br>
  
    <form    action="Registration.html">
    <button class="help" type="submit">Help!!!</button>
    <br>
    <br>
    </form>
    <button onclick="document.location='Registration.html'"  class="reg" type="submit">NEW REGISTRATION</button>
    <br>
    <br>

    <pre><h2>Login</h2></pre> 
    <p class="er">Invalid Details!</p>

    <form class="aadhar" action="LogSer" method="post"> 
        <fieldset style="border-inline-color: crimson;">
            <legend>Details:</legend>
            <br>
        <label for="aadhar">AADHAR NUMBER  :</label>
        <input class="aadha" type="text" id="aadhar" name="aadhar" size="30" pattern="[0-9]{4} [0-9]{4} [0-9]{4}" placeholder="xxxx  xxxx  xxxx" required >
        <br>
        <br>
        
        <pre><label for="pass" style="font:bold 100% Gungsuh;"> PASSWORD              : </label><input type="password" id="pass" name="pass" size="30"  required></pre>
  		<a href="Forgotpass.jsp" style="color: white;"> Forgot Password ? </a>
        <br>
        <pre style="text-align: center;"><input type="submit" required> <input type="reset" required></pre>
        <br>
        </fieldset>
    </form>


</body>
</html>