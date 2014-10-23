package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.types.ObjectId;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

import database.MongoDB;

@WebServlet("/VolunteerDetails")
public class VolunteerDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DB db;
       
    public VolunteerDetails() {
        super();
        db = new MongoDB().getDb();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("iNeedAHandId");

		DBCollection volunteerCollection = db.getCollection("INeedAHand");
		
		BasicDBObject searchQuery = new BasicDBObject();
		searchQuery.put("_id", new ObjectId(id));
		DBCursor cursor = volunteerCollection.find(searchQuery);
		
		if (cursor.hasNext()) {
			DBObject userDBObject = cursor.next();
			response.getWriter().print(userDBObject);
		} else {
			response.getWriter().print("id does not exist");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
