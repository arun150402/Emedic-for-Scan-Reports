<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  <% String g="";
  	HttpSession ses=request.getSession(true);
  	g=(String)ses.getAttribute("aad");
  
  %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="Stylesheet" href="./MyStylesheet.css">
        <script type="text/javascript" src="./Javascript.js">
        </script>
        <title>Upload Form</title>
        <link rel="icon" href="images/tit.jpg" type="image/x-icon">
        <style type="text/css">
        body {
                background-image: url('images/uplback.jpg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;
            }
        
        </style>
    </head>
    <body>
    
        <h1 style="color: black;"><u>UPLOAD FORM </u></h1>
        <div class="instruction" style="color: burlywood;">
            <ul>
           <li>
                Set the resolution of the digital camera/webcam to highest value.
            </li>
           <li>
            The size of image should be less than 10MB. If the size of the image is more than 10MB
            resize the image to required size. 
           </li>
           <li>
            Image should be in .jpg/.jpeg/.png format. other format not allowed
           </li>
           <li>
               The Image Should be properly focused and background must be clear.
           </li>
        </ul>
        </div>
        <form action="Uploadimg" method="post" onsubmit="return check()" enctype="multipart/form-data">
        <div class="filechoose" >
           <input type="file" name="filechooser" id="filechooser" accept=".png,.jpg,.jpeg" onchange="isValidFile()"><br><br> <br>
          <div class="submit" style="padding: 10px"> <input style="font-weight: bold;" id="suxmit" type="submit" value="SUBMIT" name="add">
           <input style="font-weight: bold;" id="SUBMIT" type="submit" value="BACK" name="add"></div>
             </div>
        </form>
    </body>
</html>>