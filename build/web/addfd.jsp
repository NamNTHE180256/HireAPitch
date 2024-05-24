<%-- 
    Document   : addfd
    Created on : Mar 13, 2024, 8:19:27 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Food Item</title>  
        <link href="asset/stylesheet/addfd.css" rel="stylesheet" type="text/css">

    </head>
    <body>
        <div class="container">
            <h1>Add Food Item</h1>
            <form action="addFDS" method="get" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="amount">Amount:</label>
                    <input type="number" id="amount" name="amount" required>
                </div>
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="number" id="price" name="price" step="0.01" required>
                </div>
                <div class="form-group">
                    <label for="type">Type:</label>
                    <select id="type" name="type" required>
                        <option value="Đồ ăn">Đồ ăn</option>
                        <option value="Đồ uống">Đồ uống</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="image">Image:</label>
                    <input type="text" id="image" name="image">
                </div>
                <div class="button-group">
                    <input type="submit" value="Save">
                    <input type="reset" value="Reset">
                </div>
            </form>
        </div>
</body>
</html>
