package com.example.projectwebshopping.data;

import java.sql.Date;
import java.time.LocalDate;
import java.util.UUID;

public class DataString {
    public static final String ID_QC = "5e441189-6aa9-4191-a6aa-6d2c43f3b775";
    public static final String ID_BST = "cfda2e1f-5fc8-436b-89ed-d6c8657cf122";

//    public static void main(String[] args) {
//        for (int i = 0; i < 10; i++) {
//          System.out.println(UUID.randomUUID().toString());
//        }
//    }


    public static boolean isBetween(Date start, Date end) {
           
      LocalDate localDate = LocalDate.now();
      LocalDate l = LocalDate.of(start.getYear()+1900,start.getMonth()+1,start.getDate());
      LocalDate l2 = LocalDate.of(end.getYear()+1900,end.getMonth()+1,end.getDate());
      if(localDate.equals(l) || localDate.equals(l2)){
          return true;
      }
      if(localDate.isAfter(l)&&localDate.isBefore(l2)){
          return true;
      }
      return false;
    }
}
