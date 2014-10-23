package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.types.ObjectId;
import org.json.JSONArray;
import org.json.JSONObject;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

import dao.UserDAO;
import database.MongoDB;

@WebServlet("/Profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DB db;
       
    public Profile() {
        super();
        db = new MongoDB().getDb();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		JSONObject result = new JSONObject();
		
		//Get user's information
		String id = request.getParameter("userId");
		DBObject user = new UserDAO(db).getUserDBObjectById(new ObjectId(id));
		result.put("user", user);
		
		JSONObject userJSONObject = new JSONObject(user.toString());
		DBCollection volunteerCollection = db.getCollection("INeedAHand");
		
		
		
		
		//Get user's job requests
		
		ArrayList<String> jobRequestIdList = new ArrayList<String>();
		if (userJSONObject.has("yourJobRequests")) {
			JSONArray jobRequestIds = userJSONObject.getJSONArray("yourJobRequests");
			if (jobRequestIds != null) { 
			   int length = jobRequestIds.length();
			   for (int i=0; i<length; i++){
				   JSONObject jobRequestObject = new JSONObject(jobRequestIds.get(i).toString());
				   jobRequestIdList.add((String) jobRequestObject.get("$oid"));
			   }
			   
			   ArrayList<DBObject> orList = new ArrayList<DBObject>();
			   for (String jobId : jobRequestIdList) {
				   orList.add(new BasicDBObject("_id", new ObjectId(jobId)));
			   }
			   BasicDBObject searchQuery = new BasicDBObject("$or", orList);
			   
			   DBCursor cursor = volunteerCollection.find(searchQuery);//.sort(new BasicDBObject("date",-1)); //TODO filter
			   
			   ArrayList<DBObject> jobRequests = new ArrayList<DBObject>();
			   while (cursor.hasNext()) {
				   DBObject jobDBObject = cursor.next();
				   jobRequests.add(jobDBObject);
			   }
			   
			   result.put("yourPostings", jobRequests);
			} else {
				result.put("yourPostings", 0);
			}
		} else {
			result.put("yourPostings", 0);
		}
		
		
		
		
		
		
		//Get user jobs they've signed up for
		
		ArrayList<String> jobIdList = new ArrayList<String>();
		if (userJSONObject.has("yourJobs")) {
			JSONArray jobIds = userJSONObject.getJSONArray("yourJobs");
			if (jobIds != null) { 
			   int length = jobIds.length();
			   for (int i=0; i<length; i++){
				   JSONObject jobObject = new JSONObject(jobIds.get(i).toString());
				   jobIdList.add((String) jobObject.get("$oid"));
			   }
			   
			   
			   ArrayList<DBObject> orList2 = new ArrayList<DBObject>();
			   for (String jobId : jobIdList) {
				   orList2.add(new BasicDBObject("_id", new ObjectId(jobId)));
			   }
			   BasicDBObject searchQuery2 = new BasicDBObject("$or", orList2);
			   
			   DBCursor cursor2 = volunteerCollection.find(searchQuery2);//.sort(new BasicDBObject("date",-1)); //TODO filter
			   
			   ArrayList<DBObject> upcomingJobs = new ArrayList<DBObject>();
			   while (cursor2.hasNext()) {
				   DBObject jobDBObject = cursor2.next();
				   upcomingJobs.add(jobDBObject);
			   }
			   
			   result.put("upcomingJobs", upcomingJobs);
			} else {
				result.put("upcomingJobs", 0);
			}
		} else {
			result.put("upcomingJobs", 0);
		}
		
		
		
		
		response.getWriter().print(result);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
