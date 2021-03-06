package com.roomcalculator.pojo;
import org.apache.commons.net.util.Base64;

import com.encryption.GetEncrypt;

public class MyCrypto {

    /**
     * Codifica un texto usando Base64.
     * @param texto <code>String</code> texto a codificar.
     * @return <code>String</code> texto codificado.
     */
	public static void main(String[] args) {
		String bhushan="bhushan";
		
		
		System.out.println("Input Value:"+bhushan);
		String data=encrypt(bhushan);
		System.out.println("Encrypted  database::"+data);
		System.out.println("Decrypted ::"+decrypt(data));
		
	}
    public static String encrypt(String texto) {
    	return new String(Base64.encodeBase64(texto.getBytes()));
    }

    /**
     * Decodifica un texto usando Base64.
     * @param texto <code>String</code> texto a decodificar.
     * @return <code>String</code> texto decodificado.
     */
    public static String decrypt(String texto) {    	
           return new String(Base64.decodeBase64(texto.getBytes()));
    }
}