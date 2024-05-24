<%-- 
    Document   : AdminPitch
    Created on : Mar 13, 2024, 11:34:18 PM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pitches</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link href="asset/stylesheet/AdminPitch.css" rel="stylesheet" type="text/css">

        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure to delete pitch with id = " + id + "?")) {
                    window.location = "deletePitch?id=" + id;
                }
            }
            
            function filterPitches() {
                var selectedTypes = Array.from(document.querySelectorAll('input[name="typeFilter"]:checked')).map(checkbox => checkbox.value);
                var selectedProvinces = Array.from(document.querySelectorAll('input[name="provinceFilter"]:checked')).map(checkbox => checkbox.value);
                var table = document.getElementById("pitchTable");
                var rows = table.getElementsByTagName("tr");

                for (var i = 1; i < rows.length; i++) { // Start from index 1 to skip the header row
                    var row = rows[i];
                    var typeCell = row.cells[4].innerText;
                    var provinceCell = row.cells[5].innerText;
                    var typeMatch = selectedTypes.includes("all") || selectedTypes.includes(typeCell);
                    var provinceMatch = selectedProvinces.includes("all") || selectedProvinces.includes(provinceCell);

                    if (typeMatch && provinceMatch) {
                        row.style.display = "";
                    } else {
                        row.style.display = "none";
                    }
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
                <h1>Pitch List</h1>
                <button class="addButton" onclick="location.href = 'addpitch.jsp'">Add Pitch</button>
            </div>

            <div class="filter">
                <label>Filter by Type:</label>
                <div>
                    <input type="checkbox" id="allCheckbox" name="typeFilter" value="all" onclick="filterPitches()" checked>
                    <label for="allCheckbox">All</label>
                </div>
                <div>
                    <input type="checkbox" id="san5Checkbox" name="typeFilter" value="Sân 5" onclick="filterPitches()" checked>
                    <label for="san5Checkbox">Sân 5</label>
                </div>
                <div>
                    <input type="checkbox" id="san7Checkbox" name="typeFilter" value="Sân 7" onclick="filterPitches()" checked>
                    <label for="san7Checkbox">Sân 7</label>
                </div>
                <div>
                    <input type="checkbox" id="san11Checkbox" name="typeFilter" value="Sân 11" onclick="filterPitches()" checked>
                    <label for="san11Checkbox">Sân 11</label>
                </div>
            </div>

            <div class="filter">
                <label>Filter by Province:</label>
                <div>
                    <input type="checkbox" id="allProvinceCheckbox" name="provinceFilter" value="all" onclick="filterPitches()" checked>
                    <label for="allProvinceCheckbox">All</label>
                </div>
                <div>
                    <input type="checkbox" id="hanoiCheckbox" name="provinceFilter" value="Hà Nội" onclick="filterPitches()" checked>
                    <label for="hanoiCheckbox">Hà Nội</label>
                </div>
                <div>
                    <input type="checkbox" id="hoChiMinhCheckbox" name="provinceFilter" value="Hồ Chí Minh" onclick="filterPitches()" checked>
                    <label for="hoChiMinhCheckbox">Hồ Chí Minh</label>
                </div>
                <div>
                    <input type="checkbox" id="danangCheckbox" name="provinceFilter" value="Đà Nẵng" onclick="filterPitches()" checked>
                    <label for="danangCheckbox">Đà Nẵng</label>
                </div>
            </div>

            <table id="pitchTable" class="productTable">
                <tr>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Type</th>
                    <th>Province</th>
                    <th>Action</th>
                </tr>
                <c:forEach items="${requestScope.PList}" var="p">
                    <tr>
                        <td>${p.pitchName}</td>
                        <td>${p.address}</td>
                        <td><fmt:formatNumber value="${p.price}" pattern="###,###" /></td>
                        <td><img src="${p.image}" alt="Pitch Image"></td>
                        <td>${p.type}</td>
                        <td>${p.region}</td>
                        <td>
                            <a href="editPitch?id=${p.pitchId}"><i class="fas fa-pen"></i></a> |
                            <a href="#" onclick="doDelete('${p.pitchId}')"/><i class="fas fa-trash"></i></a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
    </c:if>
</html>
