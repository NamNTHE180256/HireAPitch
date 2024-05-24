<%-- 
    Document   : Booking
    Created on : Mar 18, 2024, 6:10:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<c:if test="${sessionScope.user.role != 'Staff'}">Vui lòng đăng nhập với vai trò Nhân Viên để truy cập 
<a href="UserLogin.jsp">Đăng nhập</a></c:if>
<c:if test="${sessionScope.user.role == 'Staff'}">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh Sách Đặt Sân</title>
        
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure to reject booking request with id = " + id + "?")) {
                    window.location = "deleteBooking?id=" + id;
                }
            }
        </script>
        <style>
            .link {
                color: #2563EB; /* Blue color */
                text-decoration: none; /* Remove underline */
                margin-right: 10px; /* Add some space between links */
            }

            .link:hover {
                color: #0a770f; /* Dark green color on hover */
            }
        </style>
    </head>
    <body>
        <a href="pitchcontroller">Về trang chủ</a>
        <table border="1">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Booking Day</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Customer</th>
                    <th>Pitch</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${bList}" var="booking">
                <tr>
                    <td>${booking.bookingId}</td>
                    <td>${booking.bookDay}</td>
                    <td>${booking.timeStart}</td>
                    <td>${booking.timeEnd}</td>
                    <td><a href="userInfo?id=${booking.userId}" class="link">${booking.getCustomer().display_name}</a></td>
                    <td><a href="pitchInfo?id=${booking.pitchId}" class="link">${booking.getPitch().pitchName}</a></td>
                    <c:if test="${booking.status != true}">
                    <td>
                        <a href="ConfirmBooking?id=${booking.bookingId}" class="link">Confirm</a> | 
                        <a href="#" onclick="doDelete('${booking.bookingId}')" class="link">Reject</a>
                    </td>
                    </c:if>
                    <c:if test="${booking.status == true}">
                    <td>
                        <a href="fdscontroller?id=${booking.bookingId}" class="link">Đồ ăn/uống</a> | 
                        <a href="stuffcontroller?id=${booking.bookingId}" class="link">Dụng cụ</a> | 
                        <a href="CartController?id=${booking.bookingId}" class="link">Giỏ hàng</a> | 
                        <a href="BillController?id=${booking.bookingId}" class="link">Hóa đơn</a> | 
                        <a href="#" onclick="doDelete('${booking.bookingId}')" class="link">Xóa</a>
                    </td>
                    </c:if>
                </tr>
            </c:forEach>
            <c:if test="${empty bList}">
                <tr>
                    <td colspan="7">No bookings found</td>
                </tr>
            </c:if>
        </tbody>
    </table>
        <a href="logout">Đăng xuất</a>
    </body>
</html>
</c:if>
