package WebModule;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.tomcat.util.codec.binary.StringUtils;


public class PostPage {
	private int postIdx;
	private String userId;
	private String comment;
	private Calendar updateDate;
	private ArrayList<Integer> pictureList;
	private ArrayList<Integer> commentList;
	private ArrayList<String> hashTagList;
	private ArrayList<String> favoriteList;
	
	public PostPage() {}
	
	public PostPage(int postIdx, String userId, String comment, Calendar updateDate, ArrayList<Integer> pictureList, ArrayList<Integer> commentList,
			ArrayList<String> hashTagList, ArrayList<String> favoriteList) {
		this.postIdx=postIdx;
		this.userId=userId;
		this.comment=comment;
		this.updateDate=updateDate;
		this.pictureList=pictureList;
		this.commentList=commentList;
		this.hashTagList=hashTagList;
		this.favoriteList=favoriteList;
	}
	
	//get ÇÔ¼ö
	public int getPostIdx() {return postIdx;}
	public String getUserId() {return userId;}
	public String getComment() {return comment;}
	public Calendar getUpdateData() {return updateDate;}
	public ArrayList<Integer> getPictureList() {return pictureList;}
	public ArrayList<Integer> getCommentList() {return commentList;}
	public ArrayList<String> getHashTagList() {return hashTagList;}
	public ArrayList<String> getFavoriteList() {return favoriteList;}
	
	//set ÇÔ¼ö
	public void setPostIdx(int postIdx) {this.postIdx=postIdx;}
	public void setUserId(String userId) {this.userId=userId;}
	public void setComment(String comment) {this.comment=comment;}
	public void setUpdateData(Calendar updateDate) {this.updateDate=updateDate;}
	public void setPictureList(ArrayList<Integer> pictureList) {this.pictureList=pictureList;}
	public void setCommentList(ArrayList<Integer> commentList) {this.commentList=commentList;}
	public void setHashTagList(ArrayList<String> hashTagList) {this.hashTagList=hashTagList;}
	public void setFavoriteList(ArrayList<String> favoriteList) {this.favoriteList=favoriteList;}
	
	public static class Builder{
		private int postIdx;
		private String userId;
		private String comment;
		private Calendar updateDate;
		private ArrayList<Integer> pictureList;
		private ArrayList<Integer> commentList;
		private ArrayList<String> hashTagList;
		private ArrayList<String> favoriteList;
		
		public Builder(int postIdx, String userId, String comment, Calendar updateDate) {
			this.postIdx=postIdx;
			this.userId=userId;
			this.comment=comment;
			this.updateDate=updateDate;
		}
		public Builder pictureList(ArrayList<Integer> list) {
			this.pictureList=list;
			return this;
		}
		public Builder commentList(ArrayList<Integer> list) {
			this.commentList=list;
			return this;
		}
		public Builder hashTagList(ArrayList<String> list) {
			this.hashTagList=list;
			return this;
		}
		public Builder favoriteList(ArrayList<String> list) {
			this.favoriteList=list;
			return this;
		}
		
		public PostPage build() {
			return new PostPage(this);
		}
	}
	
	private PostPage(Builder builder) {
		this.postIdx=builder.postIdx;
		this.userId=builder.userId;
		this.comment=builder.comment;
		this.updateDate=builder.updateDate;
		this.pictureList=builder.pictureList;
		this.commentList=builder.commentList;
		this.hashTagList=builder.hashTagList;
		this.favoriteList=builder.favoriteList;
	}
	
	public void findHashTag(String str) {
	    Pattern p = Pattern.compile("\\#([0-9a-zA-Z°¡-ÆR]*)");
	    Matcher m = p.matcher(str);
	    ArrayList<String> list = null;
	 
	    while(m.find()) {
	    	list.add(m.group());
	    }
	    this.setHashTagList(list);
	}
}