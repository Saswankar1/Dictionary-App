<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dictionary App</title>
    <link rel="stylesheet" href="style.css">
    <script src="dictionary.js" defer></script>
</head>
<body>
    <div class="container">
        <h1>Dictionary App</h1>
        <input type="text" id="word-input" placeholder="Enter a word" autocomplete="off">
        <button id="search-button">Search</button>
        <div id="definition"></div>
    </div>
</body>
</html>
