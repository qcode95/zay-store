package com.fpt.prj301.util.linkedin;

import com.fpt.prj301.constants.Constants;
import com.fpt.prj301.model.UserLinked;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import javax.net.ssl.HttpsURLConnection;

public class LinkedinPostUtil {
    
    public UserLinked sendPost(String code) throws Exception {
        
        String url = "https://www.linkedin.com/oauth/v2/accessToken";
        URL obj = new URL(url);
        HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();
        
        con.setRequestMethod("POST");
        con.setRequestProperty("Host", "www.linkedin.com");
        con.setRequestProperty("Content-type", "application/x-www-form-urlencoded");
        
        String urlParameters = "grant_type=client_credentials&code=" + code + "&redirect_uri=" + Constants.LINKED_REDIRECT_URI 
                + "&client_id=" + Constants.LINKED_CLIENT_ID + "&client_secret=" + Constants.LINKED_CLIENT_SECRET + "";
        
        int responseCode = con.getResponseCode();
        
        System.out.println("\nSending 'POST' request to URL: " +url);
        System.out.println("POST parameters: " +urlParameters);
        System.out.println("Response Code: " +responseCode);
        
        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();
        
        while((inputLine = in.readLine()) != null){
            response.append(inputLine);
        }
        in.close();
        
        System.out.println(response.toString());
        
        Map<String, String> linkedProfile = new HashMap<String, String>();
        JsonObject jsonObj = JsonParser.parseString(response.toString()).getAsJsonObject();
        String access_code = linkedProfile.put("access_token", jsonObj.get("access_token").getAsString());
        
        UserLinked objProfile = new UserLinked();
        objProfile = sendGet(access_code);
        
        return objProfile;
    }
    
    public UserLinked sendGet(String access_token) throws Exception {
        
        UserLinked objProfile = new UserLinked();
        
        String url = "https://api.linkedin.com/v1/people/~?format=json";
        URL obj = new URL(url);
        HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();
        
        con.setRequestMethod("GET");
        con.setRequestProperty("Host", "api.linkedin.com");
        con.setRequestProperty("Connection", "Keep-Alive");
        con.setRequestProperty("Authorization", "Bearer " + access_token);
        
        int responseCode = con.getResponseCode();
        
        System.out.println("\nSending 'GET' request to URL: " +url);
        System.out.println("Response Code: " +responseCode);
        
        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();
        
        while((inputLine = in.readLine()) != null){
            response.append(inputLine);
        }
        in.close();
        
        System.out.println(response.toString());
        
        Map<String, String> linkedProfile = new HashMap<String, String>();
        JsonObject jsonObj = JsonParser.parseString(response.toString()).getAsJsonObject();
        String firstName = linkedProfile.put("firstName", jsonObj.get("firstName").getAsString());
        String lastName = linkedProfile.put("lastName", jsonObj.get("lastName").getAsString());
        String headLine = linkedProfile.put("headline", jsonObj.get("headline").getAsString());
        String id = linkedProfile.put("id", jsonObj.get("id").getAsString());
        
        objProfile.setFirstName(firstName);
        objProfile.setLastName(lastName);
        objProfile.setHeadLine(headLine);
        objProfile.setId(id);
        
        return objProfile;
    }
}
