package com.resource.server.model;

public class TestTable {

	private Integer pk;

	private Integer number;

	private Integer version;

	private String port;

	public Integer getPk() {
		return pk;
	}

	public void setPk(Integer pk) {
		this.pk = pk;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	/**
	 * ToString
	 */
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(" [");
		if (pk != null) {
			sb.append("pk=").append(pk);
		}
		if (number != null) {
			sb.append(", number=").append(number);
		}
		if (version != null) {
			sb.append(", version=").append(version);
		}
		if (port != null) {
			sb.append(", port=").append(port);
		}
		sb.append("]");
		return sb.toString();
	}
}
