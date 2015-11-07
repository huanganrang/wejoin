package jb.pageModel;

@SuppressWarnings("serial")
public class UserToken implements java.io.Serializable {

	private String token;
	private String mobile;
	private String nickName;
	private String huanxinUid;
	private String password;
	
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getHuanxinUid() {
		return huanxinUid;
	}
	public void setHuanxinUid(String huanxinUid) {
		this.huanxinUid = huanxinUid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
