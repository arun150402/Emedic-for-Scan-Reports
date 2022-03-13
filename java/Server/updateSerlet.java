package Server;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateSerlet")
public class updateSerlet extends HttpServlet {
	public void service(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
    {
        try{  
    		Class.forName("com.mysql.jdbc.Driver");  
    		Connection con=DriverManager.getConnection(  
    		"jdbc:mysql://localhost:3306/mini_db","root","himysql");   
    		Statement stmt=con.createStatement();  
    		int u=stmt.executeUpdate("UPDATE mini_db.usersdetails SET uname = '"+request.getParameter("fname")+"', lname = '"+request.getParameter("lname")+"', fname = '"+request.getParameter("father")+"', mname = '"+request.getParameter("mother")+"', mobile = '"+request.getParameter("mob")+"', pass = '"+request.getParameter("repass")+"', address = '"+request.getParameter("address")+"' WHERE (aadharnum = '"+request.getParameter("adhar")+"')");  
    		//System.out.print(u+"  "+request.getParameter("adhar"));
    		con.close();  
    		request.setAttribute("myname",request.getParameter("adhar"));
			request.getRequestDispatcher("Option.jsp").forward(request, response);
    		}
        
        catch(Exception e){ 
        	System.out.println(e);
        }
    }

}

