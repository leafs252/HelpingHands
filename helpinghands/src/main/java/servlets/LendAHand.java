package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import objects.User;

import org.bson.types.ObjectId;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;

import dao.UserDAO;
import database.MongoDB;

@WebServlet("/LendAHand")
public class LendAHand extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DB db;
       
    public LendAHand() {
        super();
        db = new MongoDB().getDb();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		ObjectId userId = user.getId();
		
		String jobIdIn = request.getParameter("id");
		ObjectId jobId = new ObjectId(jobIdIn);
		
		//Put jobId in user's job list
		DBCollection userCollection = db.getCollection("users");
		BasicDBObject selectUserQuery = new BasicDBObject("_id", userId);
		BasicDBObject updateJobsCommand = new BasicDBObject("$push", new BasicDBObject("yourJobs", jobId));
		userCollection.update(selectUserQuery, updateJobsCommand);
		
		//Put userId in INeedAHand's volunteer list
		DBCollection iNeedAHandCollection = db.getCollection("INeedAHand");
		BasicDBObject selectINeedAHandQuery = new BasicDBObject("_id", jobId);
		BasicDBObject updateVolunteersCommand = new BasicDBObject("$push", new BasicDBObject("volunteerList", userId));
		iNeedAHandCollection.update(selectINeedAHandQuery, updateVolunteersCommand);
		
		//Get user's points
		UserDAO userDAO = new UserDAO(db);
		DBObject userDBObject = userDAO.getUserDBObjectById(userId);
		int userPoints;
		if (userDBObject.containsField("points")) {
			userPoints = (Integer) userDBObject.get("points") + 10; //add 10 to points
		} else {
			userPoints = 10; //set to 10 if they don't have any yet
		}
		BasicDBObject updateUserPoints = new BasicDBObject("$set", new BasicDBObject("points", userPoints)); //update new points
		userCollection.update(selectUserQuery, updateUserPoints);
		
		response.getWriter().print(userId);
	}

}
