package RespCode;

public enum RespCode {
	SYS_OK(0, "操作成功！");
	
	RespCode(int code, String msg) {
		this.code = code;
		this.msg = msg;
	}

	private int code;
	private String msg;

	public int getCode() {
		return code;
	}

	public String getMsg() {
		return msg;
	}
}
