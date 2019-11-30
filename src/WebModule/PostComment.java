package WebModule;

import java.util.Calendar;

public class PostComment {
	private int commentIdx;
	private int postIdx;
	private String userId;
	private String comment;
	private Calendar writeDate;
	
	public PostComment() {}
	
	public PostComment(int commentIdx, int postIdx, String userId, String comment, Calendar writeDate) {
		this.commentIdx=commentIdx;
		this.postIdx=postIdx;
		this.comment=comment;
		this.writeDate=writeDate;
		this.userId = userId;
	}
	
	//get 함수
	public int getCommentIdx() {return commentIdx;}
	public int getPostIdx() {return postIdx;}
	public String getUserId() {return userId;}
	public String getComment() {return comment;}
	public Calendar getwriteDate() {return writeDate;}
	
	//set 함수
	public void setCommentIdx(int commentIdx) {this.commentIdx=commentIdx;}
	public void setPostIdx(int postIdx) {this.postIdx=postIdx;}
	public void setUserId(String userId) {this.userId=userId;}
	public void setComment(String comment) {this.comment=comment;}
	public void setWriteDate(Calendar writeDate) {this.writeDate=writeDate;}
	
	public static class Builder{
		private int commentIdx;
		private int postIdx;
		private String userId;
		private String comment;
		private Calendar writeDate;
		
		public Builder(int commentIdx, int postIdx, String userId) {
			this.commentIdx=commentIdx;
			this.postIdx=postIdx;
			this.userId=userId;
		}
		
		public Builder comment(String comment) {
			this.comment=comment;
			return this;
		}
		public Builder writeDate(Calendar date) {
			this.writeDate=date;
			return this;
		}
		
		public PostComment build() {
			return new PostComment(this);
		}
		
	}
	public PostComment(Builder builder) {
		this.commentIdx=builder.commentIdx;
		this.postIdx=builder.postIdx;
		this.userId=builder.userId;
		this.comment=builder.comment;
		this.writeDate=builder.writeDate;
	}

}