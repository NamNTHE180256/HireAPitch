<%-- 
    Document   : AdminFD
    Created on : Mar 13, 2024, 3:14:20 PM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Food & Drinks</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link href="asset/stylesheet/AdminFD.css" rel="stylesheet" type="text/css">
        <script>
            function filterProducts() {
                var selectedTypes = Array.from(document.querySelectorAll('input[name="typeFilter"]:checked')).map(checkbox => checkbox.value);
                var table = document.getElementById("productTable");
                var rows = table.getElementsByTagName("tr");

                for (var i = 1; i < rows.length; i++) { // Start from index 1 to skip the header row
                    var row = rows[i];
                    var typeCell = row.cells[4].innerText.toLowerCase();
                    var typeMatch = selectedTypes.includes("all") || selectedTypes.includes(typeCell);

                    if (typeMatch) {
                        row.style.display = "";
                    } else {
                        row.style.display = "none";
                    }
                }
            }
        </script>
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure to delete Food&Drinks with id = " + id + "?")) {
                    window.location = "deleteFDS?id=" + id;
                }
            }
        </script>
    </head>
    <c:if test="${sessionScope.user.role != 'Admin'}"> Access Denied </c:if>    <c:if test="${sessionScope.user.role != 'Admin'}">Vui lòng đăng nhập với vai trò Admin để truy cập</br>
        <a href="UserLogin.jsp">Đăng nhập</a>
    </c:if>
    <c:if test="${sessionScope.user.role == 'Admin'}">
    <body>
        <%@ include file="AdminMenu.jsp" %>

        <div class="container">
            <div class="header">
                <h1>Food & Drink</h1>
                <button class="addButton" onclick="location.href = 'addfd.jsp'">Add Food&Drink</button>
            </div>

            <div class="filter">
                <label>Filter by Type:</label>
                <div>
                    <input type="checkbox" id="allCheckbox" name="typeFilter" value="all" onclick="filterProducts()" checked>
                    <label for="allCheckbox">All</label>
                </div>
                <div>
                    <input type="checkbox" id="foodCheckbox" name="typeFilter" value="đồ ăn" onclick="filterProducts()" checked>
                    <label for="foodCheckbox">Đồ ăn</label>
                </div>
                <div>
                    <input type="checkbox" id="drinkCheckbox" name="typeFilter" value="đồ uống" onclick="filterProducts()" checked>
                    <label for="drinkCheckbox">Đồ uống</label>
                </div>
            </div>

            </br>

            <table class="productTable" id="productTable">
                <thead>
                    <tr>

                        <th>Name</th>
                        <th>Price</th>
                        <th>Amount Exist</th>
                        <th>Image</th>
                        <th>Type</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <c:forEach items="${ListFDS}" var="fd">
                <tbody>
                    <tr>

                        <td>${fd.FDS_name}</td>
                        <td><fmt:formatNumber value="${fd.price}" pattern="###,###" /></td>
                        <td>${fd.amount}</td>
                        <td><img src="${fd.image}" alt="FD image" width="50"></td>
                        <td>${fd.type}</td>
                        <td><a href="editFDS?id=${fd.FDS_id}"><i class="fas fa-pen"></i></a> | <a href="#" onclick="doDelete('${fd.FDS_id}')"><i class="fas fa-trash"></i></a></td>
                    </tr>
                </tbody>
                </c:forEach>
            </table>
        </div>
    </body>
    </c:if>
</html>
