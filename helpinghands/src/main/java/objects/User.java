package objects;

import org.bson.types.ObjectId;

public class User {
	private ObjectId id;
	private String name;
	private String phoneNumber;
	
	public User(ObjectId id, String name, String phoneNumber) {
		super();
		this.id = id;
		this.name = name;
		this.setPhoneNumber(phoneNumber);
	}
	
	public ObjectId getId() {
		return id;
	}
	public void setId(ObjectId id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
}
