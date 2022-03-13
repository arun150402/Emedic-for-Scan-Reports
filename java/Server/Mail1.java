package Server;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import java.util.*;

@WebServlet("/Mail1")
public class Mail1 extends HttpServlet{
		public void service(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
		{
			String mail=(String)request.getAttribute("mail");
			System.out.println(mail);
			Random r=new Random();
			int otp=r.nextInt(999999);
			String ans=String.valueOf(otp);


		final String username = "emedicwithai123@gmail.com";
		final String password = "mpai@0000";

                final String from = "emedicwithai123@gmail.com";
                final String to = mail;

		Properties props = new Properties();

		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");



                
                Authenticator a =new Authenticator() {

                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {      
                        return new PasswordAuthentication(username, password);
                        
                    }
                    
                };

                Session session = Session.getInstance(props, a);

		try {

			Message message = new MimeMessage(session);

			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
			message.setSubject("OTP Confirmation from emedicai website");
			message.setText("Your one Time Password is:  "+ans);
			Transport.send(message);
			System.out.println("SUPER PAA");
			System.out.println("otp is:"+ans);
			HttpSession ss=request.getSession(true);
			ss.setAttribute("otp",ans);
			ss.setMaxInactiveInterval(20);
			HttpSession xx=request.getSession(true);
			xx.setAttribute("correct",mail);
			request.getRequestDispatcher("otp.jsp").forward(request, response);


		} catch (MessagingException e) {
			System.out.println(e);
		}
	}
}