package servlets;

import java.io.IOException;
import java.util.ArrayList;

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
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

import database.MongoDB;

@WebServlet("/INeedAHand")
public class INeedAHand extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DB db;
       
    public INeedAHand() {
        super();
        db = new MongoDB().getDb();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<DBObject> jobList = new ArrayList<DBObject>();
		
		DBCollection table = db.getCollection("INeedAHand");
		
		DBCursor cursor = table.find();
		while (cursor.hasNext()) {
			jobList.add(cursor.next());
		}
		
		response.getWriter().print(jobList);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Get form values (and session)
		User user = (User) request.getSession().getAttribute("user");
		ObjectId userId = user.getId();
		String title = request.getParameter("title");
		String details = request.getParameter("details");
		String date = request.getParameter("date"); //TODO change to DateTime?
		String location = request.getParameter("location");
		String volunteers = request.getParameter("volunteers"); //TODO change to int?
		
		//Add job request to DB
		DBCollection table = db.getCollection("INeedAHand");
		BasicDBObject document = new BasicDBObject();
		document.put("userId", userId);
		document.put("name", user.getName());
		document.put("title", title);
		document.put("details", details);
		document.put("date", date);
		document.put("location", location);
		document.put("volunteers", volunteers);
		table.insert(document);
		
		//Add job request to user's list
		DBCollection userCollection = db.getCollection("users");
		BasicDBObject selectUserQuery = new BasicDBObject("_id", userId);
		BasicDBObject updateJobsCommand = new BasicDBObject("$push", new BasicDBObject("yourJobRequests", document.get("_id")));
		userCollection.update(selectUserQuery, updateJobsCommand);
		
		response.getWriter().print(document.get("_id"));
	}

}
