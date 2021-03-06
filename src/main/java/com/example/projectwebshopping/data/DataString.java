package com.example.projectwebshopping.data;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.Base64;
import java.util.UUID;

public class DataString {
    public static final String ID_QC = "5e441189-6aa9-4191-a6aa-6d2c43f3b775";
    public static final String ID_BST = "cfda2e1f-5fc8-436b-89ed-d6c8657cf122";
    public static final String ID_USER_ADMIN = "26aff6a7-5032-4b51-8c7f-4beaf0a90417";

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
//convert img to base64
    public static String convertToBase64(String path) {
        String base64 = "";
        try {
            FileInputStream fileInputStreamReader = new FileInputStream(path);
            int bytes;
            byte[] buffer = new byte[8192];
            while ((bytes = fileInputStreamReader.read(buffer)) != -1) {
                byte[] bytes2 = new byte[bytes];
                System.arraycopy(buffer, 0, bytes2, 0, bytes);
                base64 = Base64.getEncoder().encodeToString(bytes2);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return base64;
    }
    public static void main(String[] args) throws IOException {
        //read from file
        FileInputStream fis = new FileInputStream("D:\\t.txt");
        BufferedReader br = new BufferedReader(new java.io.InputStreamReader(fis));
        String line = null;
        while ((line = br.readLine()) != null) {
            if(line.trim().length()>0){
                System.out.println("' "+line.trim()+" '+");

            }
        }
    }


}
