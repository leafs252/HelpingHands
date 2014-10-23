package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import objects.User;

import com.mongodb.DB;

import dao.UserDAO;
import database.MongoDB;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DB db;
       
    public Login() {
        super();
        db = new MongoDB().getDb();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String usernamePassedIn = request.getParameter("username");
		
		User user = new UserDAO(db).getUserObjectByUsername(usernamePassedIn);
		
		//user object is null if no user was found in db with the username passed in
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			session.setMaxInactiveInterval(2 * 60 * 60);
			
			response.getWriter().print("success");
		} else {
			response.getWriter().print("username not found");
		}
		
	}

}
