package Server;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;

import org.apache.tomcat.util.http.parser.Cookie;

import com.mysql.cj.Session;
@MultipartConfig
@WebServlet("/Uploadimg")
public class Uploadimg extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void service(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
    {
		HttpSession ses=request.getSession(true);
		String value=(String)ses.getAttribute("aad");
		System.out.println(value);
       // response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String aadhar=request.getParameter("g");
        javax.servlet.http.Part filereq=request.getPart("filechooser");
		String filename=filereq.getSubmittedFileName();
		System.out.println(filename +" "+value);
		String uploadpath="C:/Java Eclipse/Mini Project/src/main/webapp/reportpics/"+filename;
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
    	//	Class.forName("com.mysql.jdbc.Driver");  
    		Connection con=DriverManager.getConnection(  
    		"jdbc:mysql://localhost:3306/mini_db","root","himysql");   
    		Statement stmt=con.createStatement();  
    		int u=stmt.executeUpdate("insert into mini_db.reportimg (aadharnum ,img) values('"+value+"', '"+filename+"')");  
    		System.out.print(1);
    		con.close();  
    		response.sendRedirect("Upload.jsp");
    		}catch(Exception e){ System.out.println(e);}  
        

        out.close();
       
    }
	
}

