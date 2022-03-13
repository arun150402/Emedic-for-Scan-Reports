package Server;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Checkmail")
public class Checkmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String m= request.getParameter("mail");
        try{  
        	Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mini_db","root","himysql");  
			Statement stmt=con.createStatement();
			String ss="select * from mini_db.usersdetails where email='"+m+"'";
    		ResultSet rs=stmt.executeQuery(ss);
    		if(rs.next()) {
    			request.setAttribute("mail",m);
    			request.getRequestDispatcher("/Mail1").forward(request, response);
    		}
    		else {
    			HttpSession h=request.getSession(true);
    			h.setAttribute("vaild","no");
    			request.getRequestDispatcher("Forgotpass2.jsp").forward(request, response);
    		}
    		con.close();  
    		}catch(Exception e){ System.out.println(e);}  
        
	}

}
