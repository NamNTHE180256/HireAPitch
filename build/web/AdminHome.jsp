<%-- 
    Document   : AdminHome
    Created on : Mar 13, 2024, 9:56:36 AM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Admin Home</title>
    </head>
    <c:if test="${sessionScope.user.role != 'Admin'}">Vui lòng đăng nhập với vai trò Admin để truy cập</br>
        <a href="UserLogin.jsp">Đăng nhập</a>
    </c:if>
    <c:if test="${sessionScope.user.role == 'Admin'}">
    <body>
        
        <%@ include file="AdminMenu.jsp" %>
        <%
        
        
        %>
        <h1>Welcome Admin</h1>
        <p> </p> <%-- show name --%>
        <p> </p> <%-- show phone number --%>
        <p> </p> <%-- show email --%>
    </body>
    </c:if>
</html>
