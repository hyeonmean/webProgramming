package WebModule;

public class Picture {
	private int pictureIdx;
	private int postIdx;
	private String pictureAddress;
	
	public Picture() {}
	
	public Picture(int pictureIdx, int postIdx, String pictureAddress){
		this.pictureAddress=pictureAddress;
		this.pictureIdx=pictureIdx;
		this.postIdx=postIdx;
	}
	
	//get Functions
	public int getPictureIdx() {return pictureIdx;}
	public int getPostIdx() {return postIdx;}
	public String getPictureAddress() {return pictureAddress;}
	
	//set Functions
	public void setPostIdx(int postIdx) {this.postIdx=postIdx;}
	public void setPictureIdx(int pictureIdx) {this.pictureIdx=pictureIdx;}
	public void setPictureAddress(String pictureAddress) {this.pictureAddress=pictureAddress;}
}
