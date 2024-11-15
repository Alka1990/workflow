package com.whatsapp;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class TelegramApiCaller1 {

	 public String callApi(String message) throws IOException {
	        String apiUrl = "https://api.telegram.org/bot7145121995:AAHealbgnML_jrMPoXv3luJzTOf7MSvvFvs/SendMessage?chat_id=-1002128937649&text="+ message;
	        URL url = new URL(apiUrl);
	        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
	        connection.setRequestMethod("GET");
	        int status = connection.getResponseCode();
	        if (status == HttpURLConnection.HTTP_OK) {
	            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
	            String inputLine;
	            StringBuilder content = new StringBuilder();
	            while ((inputLine = in.readLine()) != null) {
	                content.append(inputLine);
	            }
	            in.close();
	            connection.disconnect();
	            return content.toString();
	        } else {
	            connection.disconnect();
	            throw new IOException("Failed to call API: " + status);
	        }
	    }
	 
   
}
