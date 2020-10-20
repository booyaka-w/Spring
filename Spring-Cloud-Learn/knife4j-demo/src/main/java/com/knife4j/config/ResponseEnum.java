package com.knife4j.config;

public enum ResponseEnum {

	ERROR(false, 100, "操作失败"), WARNING(false, 101, "参数有误"), BUSINESS_WARNING(false, 102, "业务错误"),
	SUCCESS(true, 200, "操作成功");

	private Boolean state;

	private Integer code;

	private String msg;

	ResponseEnum(Boolean state, Integer code, String msg) {
		this.state = state;
		this.code = code;
		this.msg = msg;
	}

	public Boolean getState() {
		return state;
	}

	public Integer getCode() {
		return code;
	}

	public String getMsg() {
		return msg;
	}

}
