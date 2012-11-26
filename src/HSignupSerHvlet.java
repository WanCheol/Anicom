

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HSignupSerHvlet")
public class HSignupSerHvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HSignupSerHvlet() {
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
		String address = (request.getParameter("address"));
		
		String phonenumber = frontnumber + phonenumber1 + phonenumber2;
		
	}

}
