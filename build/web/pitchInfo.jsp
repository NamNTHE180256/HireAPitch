<%-- 
    Document   : pitchInfo
    Created on : Mar 18, 2024, 7:33:17 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Thông tin sân bóng</h1>
        <table border="1">
            <tbody>
                <tr>
                    <td rowspan="6"><img src="${p.image}" alt="Pitch Image" style="max-width: 100px; max-height: 100px;"></td>
                    <td>Tên sân</td>
                    <td>${p.pitchName}</td>
                </tr>
                <tr>
                    <td>Địa chỉ</td>
                    <td>${p.address}</td>
                </tr>
                <tr>
                    <td>Giá</td>
                    <td><fmt:formatNumber value="${p.price}" pattern="###,###" />/h</td>
                </tr>
                <tr>
                    <td>Loại sân</td>
                    <td>${p.type}</td>
                </tr>
                <tr>
                    <td>Khu vực</td>
                    <td>${p.region}</td>
                </tr>
            </tbody>
        </table> </br>
        <button onclick="goBack()">Back</button>
        <script>
            function goBack() {
                window.history.back();
            }
        </script>
    </body>
</html>
