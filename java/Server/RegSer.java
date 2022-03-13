package Server;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/RegSer")
@MultipartConfig
public class RegSer extends HttpServlet{
	static String name="";
	static String lname="";
	static String fname="";
	static String mname="";
	static String aanum="";
	static String em="";
	static String mb="";
	String pas="",add="";
	
	public void service(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
    {
       // response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        javax.servlet.http.Part filereq=request.getPart("img");
		String filename=filereq.getSubmittedFileName();
		System.out.println(filename);
		String uploadpath="C:/Java Eclipse/Mini Project/src/main/webapp/images/"+filename;
		try {
		FileOutputStream outstream=new FileOutputStream(uploadpath);
		InputStream inputStrean=filereq.getInputStream();
		byte bytary[]=new byte[inputStrean.available()];
		inputStrean.read(bytary);
		outstream.write(bytary);
		outstream.close();
		System.out.print("Supr bha !!**");
		}
		catch (Exception e) {
			
			System.out.print("Ennamo panita da ne   "+e);
		}
        
        try{  
    		Class.forName("com.mysql.jdbc.Driver");  
    		Connection con=DriverManager.getConnection(  
    		"jdbc:mysql://localhost:3306/mini_db","root","himysql");   
    		Statement stmt=con.createStatement();  
    		int u=stmt.executeUpdate("insert into mini_db.usersdetails values("+'"'+request.getParameter("fn")+'"'+','+'"'+request.getParameter("ln")+'"'+','+'"'+request.getParameter("ffn")+'"'+','+'"'+request.getParameter("mn")+'"'+','+'"'+request.getParameter("an")+'"'+','+'"'+request.getParameter("emm")+'"'+','+'"'+request.getParameter("mnn")+'"'+','+'"'+request.getParameter("pp")+'"'+','+'"'+request.getParameter("message")+'"'+','+'"'+filename+'"'+")");  
    		System.out.print(1);
    		con.close();  
    		response.sendRedirect("Login.html");
    		}catch(Exception e){ System.out.println(e);}  
        

        out.close();
       
    }

    }



