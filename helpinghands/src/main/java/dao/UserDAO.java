package dao;

import java.util.ArrayList;

import objects.User;

import org.bson.types.ObjectId;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

public class UserDAO {
	
	private DBCollection userCollection;
	
	public UserDAO (DB db) {
		userCollection = db.getCollection("users");
	}
	
	public User getUserObjectByUsername(String phoneNumber) {
		BasicDBObject searchQuery = new BasicDBObject();
		searchQuery.put("phoneNumber", phoneNumber);
		DBCursor cursor = userCollection.find(searchQuery);
		
		if (cursor.hasNext()) {
			DBObject userDBObject = cursor.next();
			User user = new User((ObjectId)userDBObject.get("_id"), 
						(String)userDBObject.get("name"),
						(String)userDBObject.get("phoneNumber")
					);
			return user;
		} else {
			return null;
		}
	}
	
	public DBObject getUserDBObjectById(ObjectId id) {
		BasicDBObject searchQuery = new BasicDBObject();
		searchQuery.put("_id", id);
		DBCursor cursor = userCollection.find(searchQuery);
		
		if (cursor.hasNext()) {
			DBObject userDBObject = cursor.next();
			return userDBObject;
		} else {
			return null;
		}
	}
	
	public ArrayList<DBObject> getUsersByRank() {
		ArrayList<DBObject> usersSorted = new ArrayList<DBObject>();
		DBCursor cursor = userCollection.find().sort(new BasicDBObject("points",-1));
		while (cursor.hasNext()) {
			usersSorted.add(cursor.next());
		}
		return usersSorted;
	}
	
}
