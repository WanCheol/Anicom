

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/GSignupServlet")
public class GSignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;       
  
    public GSignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = (request.getParameter("id"));
		String pw = (request.getParameter("password"));
		String name = (request.getParameter("name"));
		String frontnumber = (request.getParameter("frontnumber"));
		String phonenumber1 = (request.getParameter("phonenumber1"));
		String phonenumber2 = (request.getParameter("phonenumber2"));
		String email = (request.getParameter("email"));
		
		String phonenumber = frontnumber + phonenumber1 + phonenumber2;
		
		String sql = "insert into member (id, password, name, phone, email) ";
		sql += "values('" +id+ "', '" +pw+ "', '"+ name +"', '" +phonenumber+"', '"+email+"')"; 
	}

}
