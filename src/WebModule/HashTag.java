package WebModule;

public class HashTag {
	 private int postIdx;
	 private String tagName;
	 
	 //자바빈즈용
	 public HashTag(){}
	 
	 public HashTag(int postIdx, String tagName){
		 this.postIdx=postIdx;
		 this.tagName=tagName;
	 }
	 
	 //get Functions
	 public int getPostIdx() {return postIdx;}
	 public String getTagName() {return tagName;}
	 
	 //set Functions
	 public void setPostIdx(int postIdx) {this.postIdx=postIdx;}
	 public void setTagName(String tagName) {this.tagName=tagName;}
	 
	 
	 
}
