<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cart</title>
    <script>
        function doDeleteStuff(Booking_id, Stuff_id) {
            if (confirm("Are you sure to delete?")) {
            window.location = "deleteBookingStuff?Booking_id=" + Booking_id + "&Stuff_id=" + Stuff_id;
            }
        }
        function doDeleteFDS(Booking_id, FDS_id) {
            if (confirm("Are you sure to delete?")) {
            window.location = "deleteBookingFDS?Booking_id=" + Booking_id + "&FDS_id=" + FDS_id;
            }
        }
    </script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 80%;
            max-width: 800px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        img {
            max-width: 100px;
            max-height: 100px;
            display: block;
            margin: auto;
        }

        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="container">
    <c:if test="${bs.size() != 0}">
    <h2>Dụng cụ đặt kèm</h2>
    <table>
        <thead>
        <tr>
            <th></th>
            <th>Tên sản phẩm</th>
            <th>Size</th>
            <th>Số lượng</th>
            <th>Đơn giá</th>
            <th>Tổng giá</th>
            <th></th>
        </tr>
        </thead>
        <c:forEach items="${bs}" var="bs">
            <tbody>
            <tr>
                <td><img src="${bs.getStuff().image}" alt="Stuff Image"/></td>
                <td>${bs.getStuff().stuffName}</td>
                <td>${bs.getStuff().size}</td>
                <td>${bs.amount}</td>
                <td><fmt:formatNumber value="${bs.getStuff().price}" pattern="###,###" /></td>
                <td><fmt:formatNumber value="${bs.getStuff().price*bs.amount}" pattern="###,###" /></td>
                <td><button onclick="doDeleteStuff('${bs.booking_id}', '${bs.stuff_id}')">Remove</button></td>
            </tr>
            </tbody>
        </c:forEach>
    </table>
    </c:if>
    <c:if test="${bfd.size() != 0}">
    <h2>Đồ Ăn / Uống</h2>
    <table>
        <thead>
        <tr>
            <th></th>
            <th>Tên sản phẩm</th>
            <th>Số lượng</th>
            <th>Đơn giá</th>
            <th>Tổng giá</th>
            <th></th>
        </tr>
        </thead>
        <c:forEach items="${bfd}" var="bfd">
            <tbody>
            <tr>
                <td><img src="${bfd.getFDS().image}" alt="FDS Image"/></td>
                <td>${bfd.getFDS().FDS_name}</td>
                <td>${bfd.amount}</td>
                <td><fmt:formatNumber value="${bfd.getFDS().price}" pattern="###,###" /></td>
                <td><fmt:formatNumber value="${bfd.getFDS().price*bfd.amount}" pattern="###,###" /></td>
                <td><button onclick="doDeleteFDS('${bfd.booking_id}', '${bfd.FDS_id}')">Remove</button></td>
            </tr>
            </tbody>
        </c:forEach>
    </table>
    </c:if>
    <button onclick="goBack()">Back</button>
</div>

<script>
    function goBack() {
        window.history.back();
    }
</script>
</body>
</html>
