<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.BufferedReader, java.io.InputStreamReader, java.net.HttpURLConnection, java.net.URL" %>
<%@ page import="org.json.JSONArray, org.json.JSONObject" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dictionary Result</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>Dictionary Result</h1>
        <%
            String word = request.getParameter("word");
            if (word != null && !word.trim().isEmpty()) {
                try {
                    // Fetch definition from API
                    URL url = new URL("https://api.dictionaryapi.dev/api/v2/entries/en/" + word);
                    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                    conn.setRequestMethod("GET");

                    BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                    StringBuilder content = new StringBuilder();
                    String inputLine;
                    while ((inputLine = in.readLine()) != null) {
                        content.append(inputLine);
                    }
                    in.close();

                    // Parse JSON response
                    JSONArray jsonResponse = new JSONArray(content.toString());
                    JSONObject definitionObject = jsonResponse.getJSONObject(0)
                                                              .getJSONArray("meanings")
                                                              .getJSONObject(0)
                                                              .getJSONArray("definitions")
                                                              .getJSONObject(0);
                    String definition = definitionObject.getString("definition");
                    out.println("<p>Definition of <b>" + word + "</b>: " + definition + "</p>");
                } catch (Exception e) {
                    out.println("<p>Error fetching definition: " + e.getMessage() + "</p>");
                }
            } else {
                out.println("<p>Please enter a word.</p>");
            }
        %>
        <a href="index.jsp">Search another word</a>
    </div>
</body>
</html>
