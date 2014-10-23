package database;

import java.net.UnknownHostException;

import com.mongodb.DB;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;

public class MongoDB {
	
	private DB db;
	
	public MongoDB() {
		try {
			String textUri = "mongodb://cs3025:UNBpassword1!@ds047020.mongolab.com:47020/helpinghands2";
			MongoClientURI uri = new MongoClientURI(textUri);
			MongoClient mongo= new MongoClient(uri);
			this.setDb(mongo.getDB("helpinghands2"));
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
	}

	public DB getDb() {
		return db;
	}

	public void setDb(DB db) {
		this.db = db;
	}
}
