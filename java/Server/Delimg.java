package Server;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;



/**
 * Servlet implementation class Delimg
 */
@WebServlet("/Delimg")
public class Delimg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String del=request.getParameter("img");
		try {
			Connection con=DriverManager.getConnection(  
		    		"jdbc:mysql://localhost:3306/mini_db","root","himysql");   
		    		Statement stmt=con.createStatement();  
		    		int u=stmt.executeUpdate("DELETE FROM mini_db.reportimg WHERE img='"+del+"';");  
		    		//System.out.print(1);
		    		con.close();  
		    		response.sendRedirect("ViewForm.jsp");
			
		}
		catch (Exception e) {
			System.out.print(e);
		}
	}
	

}

