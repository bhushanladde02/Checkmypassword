package com.encryption;

public class EncryptionPojo {
	private byte[] iv;
	private byte[] encryptedData;
	public byte[] getIv() {
		return iv;
	}
	public void setIv(byte[] iv) {
		this.iv = iv;
	}
	public byte[] getEncryptedData() {
		return encryptedData;
	}
	public void setEncryptedData(byte[] encryptedData) {
		this.encryptedData = encryptedData;
	}


}
