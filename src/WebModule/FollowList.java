package WebModule;

import java.util.ArrayList;

public class FollowList {
	private ArrayList<String> followerList;
	private ArrayList<String> followList;
	private String userId;

	public FollowList() {}
	
	public FollowList(ArrayList<String> followerList, ArrayList<String> followList, String userId) {
		this.followerList=followerList;
		this.followList=followList;
		this.userId=userId;
	}

	//팔로우 명수 반환
	public int getFollowerNumber() {return this.followerList.size();}
	public int getFollowingNumber() {return this.followList.size();}
	
	//get functions
	public ArrayList<String> getFollowList() {return followList;}
	public ArrayList<String> getFollowerList() {return followerList;}
	public String getUserId() {return userId;}
	
	//set functions
	public void setFollowID(ArrayList<String> followList) {this.followList=followList;}
	public void setFollowerList(ArrayList<String> followerList) {this.followerList=followerList;}
	public void setUserId(String userId) {this.userId=userId;}
	
}
