<%-- 
    Document   : RentAccessory
    Created on : 16 Mar 2024, 21:33:05
    Author     : dumspicy
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link href="asset/stylesheet/RentStuff.css" rel="stylesheet" type="text/css">
        <title>JSP Page</title>
        <script>
            function filterProducts() {
                var selectedTypes = Array.from(document.querySelectorAll('input[name="typeFilter"]:checked')).map(checkbox => checkbox.value);
                var table = document.getElementById("productTable");
                var rows = table.getElementsByTagName("tr");

                for (var i = 1; i < rows.length; i++) { // Start from index 1 to skip the header row
                    var row = rows[i];
                    var typeCell = row.cells[5].innerText.toLowerCase();
                    var typeMatch = selectedTypes.includes("all") || selectedTypes.includes(typeCell);

                    if (typeMatch) {
                        row.style.display = "";
                    } else {
                        row.style.display = "none";
                    }
                }
            }
        </script>
    </head>
    <body>
        <header style="height: 203px;">
            <%@include file="header.jsp" %>
        </header>
        <br/>
        <main>
            <div class="container">
                <div class="header">
                    <h1 class="stuff-header">Stuff List</h1>
                </div>


                <div class="filter">
                    <div>
                        <label>Filter by Type:</label>
                        <input type="checkbox" id="allCheckbox" name="typeFilter" value="all" onclick="filterProducts()" checked>
                        <label for="allCheckbox">All</label>
                    </div>
                    <div>
                        <input type="checkbox" id="ballCheckbox" name="typeFilter" value="ball" onclick="filterProducts()" checked>
                        <label for="ballCheckbox">Ball</label>
                    </div>
                    <div>
                        <input type="checkbox" id="shoesCheckbox" name="typeFilter" value="shoes" onclick="filterProducts()" checked>
                        <label for="shoesCheckbox">Shoes</label>
                    </div>
                    <div>
                        <input type="checkbox" id="shirtCheckbox" name="typeFilter" value="shirt" onclick="filterProducts()" checked>
                        <label for="shirtCheckbox">Shirt</label>
                    </div>
                    <div>
                        <input type="checkbox" id="gloveCheckbox" name="typeFilter" value="glove" onclick="filterProducts()" checked>
                        <label for="gloveCheckbox">Glove</label>
                    </div>

                </div>
                </br>
                <table class="productTable" id="productTable">
                    <thead>
                        <tr>
                            <th>Stuff</th>
                            <th>Size</th>
                            <th>Amount Exist</th>
                            <th>Price</th>
                            <th>Image</th>
                            <th>Type</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach begin="1" end="4">
                            <tr>
                                <td>Football</td>
                                <td>5</td>
                                <td>15</td>
                                <td>19.99</td>
                                <td><img src="https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/26bd561036f3455997baab7500fc64bd_9366/Bong_Tiro_League_TB_trang_FS0376_01_standard.jpg" alt="Football"></td>
                                <td>Ball</td>
                                <td>
                                    <form action=""><!--form action giong voi cai duoi-->
                                        <input type="checkbox" name="accessory" value/>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        <!-- Other product rows -->
                    </tbody>
                </table>
                <div class="rentAction">
                    <form>
                        <input type="submit" value="Thuê đồ" class="rent-btn"/>
                    </form>
                </div>
            </div>
        </main>
        <%@include file="footer.jsp" %>
    </body>
</html>
