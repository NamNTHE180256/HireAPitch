<%-- 
    Document   : UserLogin
    Created on : 28 Feb 2024, 22:13:52
    Author     : dumspicy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="asset/stylesheet/UserLoginStyle.css" rel="stylesheet" type="text/css">
        <link href="asset/stylesheet/reset.css" rel="stylesheet" type="text/css">
        <title>UserLogin</title>
    </head>
    <body>
        <div class="wrapper">
            <form action="login" method="get" class="form__login--user">
                <div class="home">
                    <a href="<%=request.getContextPath()%>/pitchcontroller"><img src="asset/icon/home.svg" class="homepage__icon" alt="..."></a>
                </div>
                <div class="login__heading">
                    <h1>Đăng nhập</h1>
                </div>
                <div class="login">
                    <label for="user">Tên đăng nhập</label>
                    <input type="text" name="username" id="user" value="${param.username}" required />
                    <br />
                    <label for="pass">Mật khẩu</label>
                    <input type="password" name="password" id="pass" value="${param.password}" required />
                </div>
                <!-- Display error message if 'error' attribute is present -->
                <c:if test="${not empty requestScope.error}">
                    <div class="error-message" style="color: red;">${requestScope.error}</div>
                </c:if>
                <div class="form--btn">
                    <a href="<%=request.getContextPath()%>/UserRegister.jsp" id="UserRegister">Đăng ký</a>
                    <input type="submit" value="Đăng nhập" id="form__user--btn" />
                </div>
            </form>
        </div>
    </body>
</html>
