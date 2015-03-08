package com.roomcalculator.pojo;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

public final class GenerateId {

  public static void main (String... arguments) {
	  for(int i=0;i<100000;i++)
	  System.out.println(getOtp());
	//  for(int i=0;i<100000;i++)
	 // getRandomNumber();
	
  }
  public static int getRandomNumber()
  {
	  int clubsArray []; 
	  clubsArray = new int [4]; 
	  for(int i = 0; i < clubsArray.length; i++) { 
	    clubsArray[i] = i +1; 
	  }
	  return  clubsArray[new Random().nextInt(clubsArray.length)];
  }

  public static String getOtp()
  {
	  String randomNum="null";
	  try {
	      //Initialize SecureRandom
	      //This is a lengthy operation, to be done only upon
	      //initialization of the application
	      SecureRandom prng = SecureRandom.getInstance("SHA1PRNG");
	      //generate a random number
	      randomNum = new Integer(prng.nextInt()).toString();
	      //get its digest
	      MessageDigest sha = MessageDigest.getInstance("SHA-1");
	      byte[] result =  sha.digest(randomNum.getBytes());
	      randomNum=randomNum.replace("-","");
	      //System.out.println("Random number: " + randomNum);
	      //System.out.println("Message digest: " + hexEncode(result));
	    }
	    catch (NoSuchAlgorithmException ex) {
	      System.err.println(ex);
	    }
	   // System.out.println("Length"+randomNum.length());
	    StringBuilder strbuff=new StringBuilder();
	    int length= 5+getRandomNumber();
	    for (int i = 0; i <length; i++) {
	    	 char c='1';//newcode
	    	if(i<randomNum.length()){//newcode
	        c = randomNum.charAt(i);	        
	    	}//newcode
	    	else//newcode
	    	{//newcode
	    		c = randomNum.charAt(randomNum.length()-1);//newcode
	    	}//newcode
	    	strbuff.append(c);//newcode
	    }
	    //System.out.println(strbuff.toString());
	    return strbuff.toString();
  }
  /**
  * The byte[] returned by MessageDigest does not have a nice
  * textual representation, so some form of encoding is usually performed.
  *
  * This implementation follows the example of David Flanagan's book
  * "Java In A Nutshell", and converts a byte array into a String
  * of hex characters.
  *
  * Another popular alternative is to use a "Base64" encoding.
  */
  static private String hexEncode(byte[] aInput){
    StringBuilder result = new StringBuilder();
    char[] digits = {'0', '1', '2', '3', '4','5','6','7','8','9','a','b','c','d','e','f'};
    for (int idx = 0; idx < aInput.length; ++idx) {
      byte b = aInput[idx];
      result.append(digits[ (b&0xf0) >> 4 ]);
      result.append(digits[ b&0x0f]);
    }
    return result.toString();
  }
} 