package com.roomcalculator.pojo;
import java.rmi.server.UID;
import java.util.UUID;

public class UniqueId {

  /**
  * Build and display some UID objects.
  */
  public static void main (String... arguments) {
    for (int idx=0; idx<1; ++idx){
      UID userId = new UID();
      System.out.println("TYPE 1-----User Id: " + userId);
    }
    
    //generate random UUIDs
		UUID idOne = UUID.randomUUID();
    UUID idTwo = UUID.randomUUID();
    log("TYPE 2--------UUID One: " + idOne);
    log("TYPE 2--------UUID Two: " + idTwo);
    
    
    
  }

  private static void log(Object aObject){
      System.out.println( String.valueOf(aObject) );
    }
} 
