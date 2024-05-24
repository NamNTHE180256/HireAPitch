<%-- 
    Document   : AdminStuff
    Created on : Mar 13, 2024, 3:15:23 PM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Stuff</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link href="asset/stylesheet/AdminStuff.css" rel="stylesheet" type="text/css">
        <script>
            function filterProducts() {
                var selectedTypes = Array.from(document.querySelectorAll('input[name="typeFilter"]:checked')).map(checkbox => checkbox.value);
                var table = document.getElementById("productTable");
                var rows = table.getElementsByTagName("tr");

                for (var i = 1; i < rows.length; i++) { // Start from index 1 to skip the header row
                    var row = rows[i];
                    var typeCell = row.cells[5].textContent.toLowerCase();
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
                if (confirm("Are you sure to delete stuff with id = " + id + "?")) {
                    window.location = "deleteStuff?id=" + id;
                }
            }
        </script>
    </head>
    <c:if test="${sessionScope.user.role != 'Admin'}">Vui lòng đăng nhập với vai trò Admin để truy cập</br>
        <a href="UserLogin.jsp">Đăng nhập</a>
    </c:if>
    <c:if test="${sessionScope.user.role == 'Admin'}">
    <body>
        <%@ include file="AdminMenu.jsp" %>
        <div class="container">
            <div class="header">
                <h1>Stuff List</h1>
                <button class="addButton" onclick="location.href = 'addstuff.jsp'">Add Stuff</button>
            </div>


            <div class="filter">
                <div>
                    <label>Filter by Type:</label>
                    <input type="checkbox" id="allCheckbox" name="typeFilter" value="all" onclick="filterProducts()" checked>
                    <label for="allCheckbox">All</label>
                </div>
                <div>
                    <input type="checkbox" id="ballCheckbox" name="typeFilter" value="bóng" onclick="filterProducts()" checked>
                    <label for="ballCheckbox">Bóng</label>
                </div>
                <div>
                    <input type="checkbox" id="shoesCheckbox" name="typeFilter" value="giày" onclick="filterProducts()" checked>
                    <label for="shoesCheckbox">Giày</label>
                </div>
                <div>
                    <input type="checkbox" id="shirtCheckbox" name="typeFilter" value="áo pitch" onclick="filterProducts()" checked>
                    <label for="shirtCheckbox">Áo Pitch</label>
                </div>
                <div>
                    <input type="checkbox" id="gloveCheckbox" name="typeFilter" value="găng" onclick="filterProducts()" checked>
                    <label for="gloveCheckbox">Găng</label>
                </div>

            </div>
            </br>
            <table class="productTable" id="productTable">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Size</th>
                        <th>Amount Exist</th>
                        <th>Price</th>
                        <th>Image</th>
                        <th>Type</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listStuff}" var="s">
                        <tr>
                            <td>${s.stuffName}</td>
                            <td>${s.size}</td>
                            <td>${s.amountExist}</td>
                            <td><fmt:formatNumber value="${s.price}" pattern="###,###" /></td>
                            <td><img src="${s.image}" alt="Stuff Image"></td>
                            <td>${s.type}</td>
                            <td><a href="editStuff?id=${s.stuffId}"><i class="fas fa-pen"></i></a> | <a href="#" onclick="doDelete('${s.stuffId}')"><i class="fas fa-trash"></i></a></td>
                        </tr>
                    </c:forEach>
                    <!-- Other product rows -->
                </tbody>
            </table>
        </div>
    </body>
    </c:if>
</html>