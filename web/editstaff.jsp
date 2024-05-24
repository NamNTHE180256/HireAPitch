<%-- 
    Document   : editstaff
    Created on : Mar 13, 2024, 10:40:39 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Staff</title>
        <link href="asset/stylesheet/editstaff.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="container">
            <h1>Edit Staff</h1>
            <form action="editStaff?id=${user.id}" method="POST">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" value="${user.username}" required>
                    <span class="error-message">${empty requestScope.usernameExisted ? "" : requestScope.usernameExisted}</span>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="text" id="password" name="password" value="${user.password}" required>
                </div>
                <div class="form-group">
                    <label for="displayName">Display Name:</label>
                    <input type="text" id="displayName" name="displayName" value="${user.display_name}" required>
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Phone Number:</label>
                    <input type="text" id="phoneNumber" name="phoneNumber" value="${user.phone_number}" required>
                    <span class="error-message">${empty requestScope.phoneExisted ? "" : requestScope.phoneExisted}</span>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="${user.email}" required>
                    <span class="error-message">${empty requestScope.emailExisted ? "" : requestScope.emailExisted}</span>
                </div>
                <div class="form-group">
                    <label for="avatar">Avatar:</label>
                    <input type="text" id="avatar" name="avatar" value="${user.avatar}">
                </div>
                <div class="button-group">
                    <input type="submit" value="Update">
                </div>
            </form>
        </div>
    </body>
</html>
