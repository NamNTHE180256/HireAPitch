<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:if test="${sessionScope.user.role != 'Staff'}">Vui lòng đăng nhập với vai trò Nhân Viên để truy cập 
<a href="UserLogin.jsp">Đăng nhập</a></c:if>
<c:if test="${sessionScope.user.role == 'Staff'}">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Invoice</title>
        <script>
            function goBack() {
                window.history.back();
            }
            function finishPayment(id) {
            if (confirm("Hoàn tất thanh toán!")) {
                    window.location = "deleteBooking?id=" + id;
                }
        }
        </script>
        <style>
            .container {
                width: 80%;
                margin: 0 auto;
            }

            table {
                border-collapse: collapse;
                width: 70%;
                margin: auto;
            }

            th, td {
                border: 1px solid black;
                padding: 8px;
                text-align: center;
                width:auto;
            }

            th {
                background-color: #f2f2f2;
            }

            h2, h3 {
                text-align: center;
            }

            button {
                display: block;
                margin: 20px auto;
            }
            
            #finishButton {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            float: right;
        }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Hóa Đơn</h2>

            <h3>Thông tin đặt sân</h3>
            <table>
                <tr>
                    <th>Sân</th>
                    <th>Ngày</th>
                    <th>Giờ bắt đầu</th>
                    <th>Giờ kết thúc</th>
                    <th>Đơn giá</th>
                    <th>Thành tiền</th>
                </tr>
                <tr>
                    <td>${booking.getPitch().pitchName}</td>
                    <td>${booking.bookDay}</td>
                    <td>${booking.timeStart}</td>
                    <td>${booking.timeEnd}</td>
                    <td>${booking.getPitch().price}</td>
                    <td><fmt:formatNumber value="${booking.calculateTotalPrice()}" pattern="###,###"/></td>
                </tr>
            </table>
            <c:if test="${bs.size() != 0}">
            <h3>Dụng cụ đặt kèm</h3>
            <table>
                <tr>
                    <th>Tên sản phẩm</th>
                    <th>Size</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                    <th>Thành tiền</th>
                </tr>
                <c:forEach items="${bs}" var="bs">
                    <tr>
                        <td>${bs.getStuff().stuffName}</td>
                        <td>${bs.getStuff().size}</td>
                        <td>${bs.amount}</td>
                        <td><fmt:formatNumber value="${bs.getStuff().price}" pattern="###,###" /></td>
                        <td><fmt:formatNumber value="${bs.getStuff().price * bs.amount}" pattern="###,###" /></td>
                    </tr>
                </c:forEach>
            </table>
            </c:if>
            <c:if test="${bfd.size() != 0}">
            <h3>Đồ Ăn / Uống</h3>
            <table>
                <tr>
                    <th>Tên sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                    <th>Thành tiền</th>
                </tr>
                <c:forEach items="${bfd}" var="bfd">
                    <tr>
                        <td>${bfd.getFDS().FDS_name}</td>
                        <td>${bfd.amount}</td>
                        <td><fmt:formatNumber value="${bfd.getFDS().price}" pattern="###,###" /></td>
                        <td><fmt:formatNumber value="${bfd.getFDS().price * bfd.amount}" pattern="###,###" /></td>
                    </tr>
                </c:forEach>
            </table>
            </c:if>
            <h2>Total Price: <fmt:formatNumber value="${totalPrice}" pattern="###,###" /></h2>

            <button onclick="goBack()" style="float: left;">Back</button>
            <button id="finishButton" onclick="finishPayment('${booking.bookingId}')">Finish Payment</button>
        </div>
    </body>
</html>
</c:if>