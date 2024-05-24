<%-- 
    Document   : editPitch
    Created on : Mar 14, 2024, 12:48:52 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Pitch</title>
        <link href="asset/stylesheet/editPitch.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="container">
            <h1>Edit Pitch</h1>
            <form action="editPitch?id=${p.pitchId}" method="POST">
                <div class="form-group">
                    <label for="name">Pitch Name:</label>
                    <input type="text" id="name" name="name" value="${p.pitchName}" required>
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" value="${p.address}" required>
                </div>
                <div class="form-group">
                    <label for="province">Province:</label>
                    <select id="province" name="province" required>
                        <option value="Hà Nội" ${p.region == 'Hà Nội' ? "selected" : ""}>Hà Nội</option>
                        <option value="Hồ Chí Minh" ${p.region == 'Hồ Chí Minh' ? "selected" : ""}>Hồ Chí Minh</option>
                        <option value="Đà Nẵng" ${p.region == 'Đà Nẵng' ? "selected" : ""}>Đà Nẵng</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="type">Type:</label>
                    <select id="type" name="type" required>
                        <option value="Sân 5" ${p.type == 'Sân 5' ? "selected" : ""}>Sân 5</option>
                        <option value="Sân 7" ${p.type == 'Sân 7' ? "selected" : ""}>Sân 7</option>
                        <option value="Sân 11" ${p.type == 'Sân 11' ? "selected" : ""}>Sân 11</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="number" id="price" name="price" step="0" value="${p.price}" required>
                </div>
                <div class="form-group">
                    <label for="image">Image:</label>
                    <input type="text" id="image" name="image" value="${p.image}">
                </div>
                <div class="button-group">
                    <input type="submit" value="Save">
                </div>
            </form>
        </div>
    </body>
</html>
