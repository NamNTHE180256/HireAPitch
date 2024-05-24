<%-- 
    Document   : addcustomer
    Created on : Mar 13, 2024, 7:11:36 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Customer</title>
        <link href="asset/stylesheet/addcustomer.css" rel="stylesheet" type="text/css">

    </head>
    <body>
        <div class="container">
            <h1>Add Customer</h1>
            <form action="addCustomer" method="POST" >
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" value="${param.username}" required>
                    <span class="error-message">${empty requestScope.usernameEmpty ? "" : requestScope.usernameEmpty}</span>
                    <span class="error-message">${empty requestScope.usernameExisted ? "" : requestScope.usernameExisted}</span>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" value="${param.password}" required>
                    <span class="error-message">${empty requestScope.passEmpty ? "" : requestScope.passEmpty}</span>
                </div>
                <div class="form-group">
                    <label for="displayName">Display Name:</label>
                    <input type="text" id="displayName" name="displayName" value="${param.displayName}"required>
                    <span class="error-message">${empty requestScope.nameEmpty ? "" : requestScope.nameEmpty}</span>
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Phone Number:</label>
                    <input type="tel" id="phoneNumber" name="phoneNumber" value="${param.phoneNumber}" required>
                    <span class="error-message">${empty requestScope.phoneEmpty ? "" : requestScope.phoneEmpty}</span>
                    <span class="error-message">${empty requestScope.phoneExisted ? "" : requestScope.phoneExisted}</span>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="${param.email}" required>
                    <span class="error-message">${empty requestScope.emailEmpty ? "" : requestScope.emailEmpty}</span>
                    <span class="error-message">${empty requestScope.emailExisted ? "" : requestScope.emailExisted}</span>
                </div>
                <div class="form-group">
                    <label for="avatar">Avatar:</label>
                    <input type="text" id="avatar" name="avatar" value="${param.avatar}">
                </div>
                <div class="button-group">
                    <input type="submit" value="Submit">
                    <input type="reset" value="Reset">
                </div>
            </form>
        </div>
    </body>
</html>
