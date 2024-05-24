<%-- 
    Document   : FDSList
    Created on : 17 Mar 2024, 18:48:06
    Author     : dumspicy
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:if test="${sessionScope.user.role != 'Staff'}">Vui lòng đăng nhập với vai trò Nhân Viên để truy cập 
<a href="UserLogin.jsp">Đăng nhập</a></c:if>
<c:if test="${sessionScope.user.role == 'Staff'}">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="asset/stylesheet/FDSStyle.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>JSP Page</title>
        <style>
            .product__list{
                margin-bottom: 140px;
            }
            .product-card{
                transition: 0.25s;
            }

            .product-card:hover{
                transform: scale(1.1);
            }

            .product-items__image{
                width: 100%;
                height: 240px;
                object-fit: cover;
            }
        </style>
    </head>
    <body>
        <header style="height: 203px;">
            <%@include file="header.jsp" %>
        </header>
        <br/>
        <main>
            <div class="product__list ">
                <div class="container">
                    <div class="product-items row justify-content-center">
                        <c:forEach items="${requestScope.ListFDS}" var="o">
                            <!--Product Start-->
                            <div class="col-lg-3 col-md-6 mb-5">
                                <div class="card h-100 product-card">
                                    <a href="<%=request.getContextPath()%>/FDSDetails.jsp?fdsid=${o.FDS_id}">
                                        <!--Product Image-->
                                        <img class="product-items__image card-img-top" 
                                             src="${o.image}" 
                                             alt="..."
                                             />

                                        <!--Product Details-->
                                        <div class="card-body p4 product-card__details">
                                            <div class="text-right">
                                                <!--Product name-->
                                                <h5 class="mb-3 fw-bold"><span>${o.FDS_name}</span></h5>

                                                <!--Product Price-->

                                                <h5 class="mb-3">Giá: <span><fmt:formatNumber value="${o.price}" pattern="###,###" /></span> </h5>

                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="footer.jsp" %>
    </body>
</html>
</c:if>