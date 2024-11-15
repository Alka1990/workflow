package com.whatsapp;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.List;

public class InteraktApiCaller {

    private static final String API_URL = "https://api.interakt.ai/v1/public/message/";
    private static final String AUTH_TOKEN = "Basic bUNoOElKZERZNE1fYU5WQWhJaTAzVnRzUWQ4Wm9RazdEWElabGpmN3V5azo=";  // Replace with your actual Authorization token

   /**
    * 
    * @param mobileNumber
    * @param templateName
    * @param caseId
    * @param patientName
    * @param doctorName
    * @param trackingId
    */

    public void sendMessage(String mobileNumber, String templateName, String caseId, String patientName, String doctorName, String trackingId) {
    	 
        // Create the template information
        InteraktMessage.Template template = new InteraktMessage.Template(
        		templateName,
                "en_US",
                Arrays.asList(caseId, patientName,doctorName , trackingId)
        );

        // Create the message
        InteraktMessage interaktMessage = new InteraktMessage(
                "+91",
                mobileNumber,
                "some text here",
                "Template",
                template
        );

        // Convert the message to JSON string using Gson
        String jsonInputString = new Gson().toJson(interaktMessage);
        System.out.println("jsonInputString: " + jsonInputString);

        if (jsonInputString != null) {
            try {
                // Specify the URL for the POST request
                URL url = new URL(API_URL);

                // Open a connection to the URL
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();

                // Set the request method to POST
                connection.setRequestMethod("POST");

                // Enable input/output streams
                connection.setDoOutput(true);
                connection.setDoInput(true);

                // Set headers
                connection.setRequestProperty("Authorization", "Basic " + AUTH_TOKEN);
                connection.setRequestProperty("Content-Type", "application/json");
                System.out.println("Request Code: " + connection.toString());
                System.out.println("WhatsApp Code: " + AUTH_TOKEN);

                // Get the output stream of the connection and write the JSON payload
                try (OutputStream os = connection.getOutputStream()) {
                    byte[] input = jsonInputString.getBytes("utf-8");
                    os.write(input, 0, input.length);
                }

                // Get the response code
                int responseCode = connection.getResponseCode();
                System.out.println("Response Code: " + responseCode);
                System.out.println("Response Code: " + connection.getInputStream().toString());

                // Read the response from the server
                try (BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
                    StringBuilder response = new StringBuilder();
                    String line;
                    while ((line = br.readLine()) != null) {
                        response.append(line);
                    }
                    System.out.println("Response Body: " + response.toString());
                }

                // Close the connection
                connection.disconnect();
            } catch (IOException e) {
                e.printStackTrace();
            }
//                if (responseCode == HttpURLConnection.HTTP_OK) {
//                    try (BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
//                        StringBuilder response = new StringBuilder();
//                        String line;
//                        while ((line = br.readLine()) != null) {
//                            response.append(line);
//                        }
//                        System.out.println("Response Body: " + response.toString());
//                    }
//                } else {
//                    try (BufferedReader br = new BufferedReader(new InputStreamReader(connection.getErrorStream()))) {
//                        StringBuilder response = new StringBuilder();
//                        String line;
//                        while ((line = br.readLine()) != null) {
//                            response.append(line);
//                        }
//                        System.out.println("Error Response Body: " + response.toString());
//                    }
//                }
//
//                connection.disconnect();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
        }
    }
}

class InteraktMessage {

    private String countryCode;
    private String phoneNumber;
    private String callbackData;
    private String type;
    private Template template;

    // Constructors, getters, and setters

    public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getCallbackData() {
		return callbackData;
	}

	public void setCallbackData(String callbackData) {
		this.callbackData = callbackData;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Template getTemplate() {
		return template;
	}

	public void setTemplate(Template template) {
		this.template = template;
	}

	public InteraktMessage(String countryCode, String phoneNumber, String callbackData, String type, Template template) {
        this.countryCode = countryCode;
        this.phoneNumber = phoneNumber;
        this.callbackData = callbackData;
        this.type = type;
        this.template = template;
    }

    public static class Template {
        private String name;
        private String languageCode;
        private List<String> bodyValues;
        
        // Constructors, getters, and setters

        public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getLanguageCode() {
			return languageCode;
		}

		public void setLanguageCode(String languageCode) {
			this.languageCode = languageCode;
		}

		public List<String> getBodyValues() {
			return bodyValues;
		}

		public void setBodyValues(List<String> bodyValues) {
			this.bodyValues = bodyValues;
		}

		public Template(String name, String languageCode, List<String> bodyValues) {
            this.name = name;
            this.languageCode = languageCode;
            this.bodyValues = bodyValues;
        }
    }
}



