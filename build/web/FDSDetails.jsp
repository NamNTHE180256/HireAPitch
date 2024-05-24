<%-- 
    Document   : FDSDetails
    Created on : 17 Mar 2024, 19:02:52
    Author     : dumspicy
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.FDS"%>
<%@page import="dal.FDS_DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:if test="${sessionScope.user.role != 'Staff'}">Vui lòng đăng nhập với vai trò Nhân Viên để truy cập 
<a href="UserLogin.jsp">Đăng nhập</a></c:if>
<c:if test="${sessionScope.user.role == 'Staff'}">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./asset/stylesheet/FDSDetailsStyle.css" rel="stylesheet" type="text/css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <header style="height: 203px;">
            <%@include file="header.jsp" %>
        </header>
        <br/>
        <main>
            <%
            String fdsId = request.getParameter("fdsid");
            int id = Integer.parseInt(fdsId);
            FDS_DAO fDAO = new FDS_DAO();
            FDS f = fDAO.getFoodAndDrinkById(id);
            %>
            <div class="stuff-details">
                <div class="fds-inner container">
                    <div class="fds-top row">
                        <div class="fds-top--info col-lg-5">
                            <img src="<%=f.getImage()%>" class="fds-info--img" />
                        </div>

                        <div class="fds-top__details col-lg-7">
                            <div class="fds-top__title">
                                <h2 class="fds-top__heading fw-bold"><%=f.getFDS_name()%></h2>
                                <p class="fds-top__desc">Mã sản phẩm:<span><%=f.getFDS_id()%></span></p>
                            </div>

                            <div class="fds-top__price">
                                <p class="fds-top__desc">Giá sản phẩm: <span class="fds-price"><%=f.getPrice()%></span></p>
                            </div>

                            <div class="fds-top__sub-desc">
                                <div class="fds-top__size">
                                    <form class="add-to-cart-form" action="OrderFDS" method="get">
                                        <input type="hidden" name="id" value="<%=f.getFDS_id()%>"/>
                                        <label for="quantity">Số lượng: </label>
                                        <input type="text" id="quantity" name="quantity" value="1" readonly class="amount-input">
                                        <br><br>
                                        <button type="button" class="quantity-btn plus" onclick="increaseQuantity()"><i class="fas fa-plus"></i></button>
                                        <button type="button" class="quantity-btn minus" onclick="decreaseQuantity()"><i class="fas fa-minus"></i></button>
                                        <br><br>
                                        <button type="submit" class="add-to-cart-btn">Thêm vào giỏ hàng</button>
                                    </form>
                                    </br><p style="color: #2a952e">${noti}</p>            
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </main>
        <script>
            function increaseQuantity() {
                var quantityField = document.getElementById("quantity");
                var quantity = parseInt(quantityField.value);
                quantityField.value = quantity + 1;
            }

            function decreaseQuantity() {
                var quantityField = document.getElementById("quantity");
                var quantity = parseInt(quantityField.value);
                if (quantity > 1) {
                    quantityField.value = quantity - 1;
                }
            }
        </script>
        <%@include file="footer.jsp" %>
    </body>
</html>
</c:if>