<%-- 
    Document   : editstuff
    Created on : Mar 13, 2024, 9:28:25 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Stuff</title>
        <link href="asset/stylesheet/editstuff.css" rel="stylesheet" type="text/css">    
    </head>
    <body>
        <div class="container">
            <h1>Edit Stuff</h1>
            <form action="editStuff?id=${s.stuffId}" method="POST">
                <div class="form-group">
                    <label for="stuffName">Stuff Name:</label>
                    <input type="text" id="stuffName" name="stuffName" value="${s.stuffName}" required>
                </div>
                <div class="form-group">
                    <label for="stuffType">Stuff Type:</label>
                    <input type="text" id="stuffType" name="stuffType" value="${s.type}" readonly>
                </div>
                <div class="form-group">
                    <label for="size">Size:</label> 
                    <input type="text" id="size" name="size" value="${s.size}" readonly>
                </div>
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="number" id="price" name="price" step="0" value="${s.price}" required>
                </div>
                <div class="form-group">
                    <label for="amount">Amount:</label>
                    <input type="number" id="amount" name="amount" value="${s.amountExist}" required>
                </div>
                <div class="form-group">
                    <label for="image">Image:</label>
                    <input type="text" id="image" name="image" value="${s.image}">
                </div>
                <div class="button-group">
                    <input type="submit" value="Update">
                </div>
            </form>
        </div>
    </body>
</html>
