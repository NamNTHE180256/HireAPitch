<%-- 
    Document   : StuffDetails
    Created on : 17 Mar 2024, 14:46:29
    Author     : dumspicy
--%>

<%@page import="model.Stuff"%>
<%@page import="dal.StuffDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./asset/stylesheet/StuffDetailsStyle.css" rel="stylesheet" type="text/css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body>
        <header style="height: 203px;">
            <%@include file="header.jsp" %>
        </header>
        <br/>
        <main>
            <%
            String stuffId = request.getParameter("stuffid");
            int id = Integer.parseInt(stuffId);
            StuffDAO sDao = new StuffDAO();
            Stuff s = sDao.getStuffById(id);
            %>
            <div class="stuff-details">
                <div class="stuff-inner container">
                    <div class="stuff-top row">
                        <div class="stuff-top--info col-lg-5">
                            <img src="<%=s.getImage()%>" class="stuff-info--img" />
                        </div>

                        <div class="stuff-top__details col-lg-7">
                            <div class="stuff-top__title">
                                <h2 class="stuff-top__heading fw-bold"><%=s.getStuffName()%></h2>
                                <p class="stuff-top__desc">Mã sản phẩm:<span><%=s.getStuffId()%></span></p>
                            </div>

                            <div class="stuff-top__price">
                                <p class="stuff-top__desc">Giá sản phẩm: <span class="stuff-price"><%=s.getPrice()%></span></p>
                            </div>

                            <div class="stuff-top__sub-desc">
                                <div class="stuff-top__size">
                                    <p class="stuff-size">Size: <span><%=s.getSize()%></span></p>

                                    <form class="add-to-cart-form" action="OrderStuff" method="get">
                                        <input type="hidden" name="id" value="<%=s.getStuffId()%>"/>
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
                <button onclick="goBack()">Back</button>
                <script>
                    function goBack() {
                        window.history.back();
                    }
                </script>                
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
