<%-- 
    Document   : userInfo
    Created on : Mar 18, 2024, 7:33:26 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Thông tin khách hàng</h1>
        <table border="1">
            <tbody>
                <tr>
                    <td rowspan="4"><img src="${u.avatar}" alt="Avatar" style="max-width: 100px; max-height: 100px;"></td>
                    <td>Tên</td>
                    <td>${u.display_name}</td>
                </tr>
                <tr>
                    <td>Số điện thoại</td>
                    <td>${u.phone_number}</td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>${u.email}</td>
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
