package Server;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Changepass")
public class Changepass extends HttpServlet {

	public void service(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
    {
       response.setContentType("text/html");
       PrintWriter out = response.getWriter();
       String mail=(String)request.getSession(true).getAttribute("correct");
       String pass=request.getParameter("pw");
       try {
    	            Class.forName("com.mysql.jdbc.Driver");  
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mini_db","root","himysql");   
		    		Statement stmt=con.createStatement();
		    		String q="update mini_db.usersdetails set pass='"+pass+"' where email='"+mail+"'";
		    		int u=stmt.executeUpdate(q);
		    		con.close();
		    		System.out.println("Password Changed"+u);
		    		request.getRequestDispatcher("Login.html").forward(request, response);
		}
		catch (Exception e) {
			System.out.print("Exception in password change");
		}
    }
}