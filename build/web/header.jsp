<%-- 
    Document   : header
    Created on : 27 Feb 2024, 16:04:55
    Author     : dumspicy
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./asset/stylesheet/reset.css" rel="stylesheet" type="text/css">
        <link href="./asset/stylesheet/headerstyle.css" rel="stylesheet" type="text/css">
        <style>
            .header_search {
                width: 100%;
                max-width: 100%;
                float: left;
            }

            .header_search .header_search_content {
                border-radius: 4px;
                border: none;
            }

            #search_form {
                position: relative;
            }

            #search_form .input-text {
                background: #f6f6f6;
                width: 100%;
                height: 42px;
                border: none;
                padding-left: 54px;
                box-sizing: border-box;
                font-size: 14px;
                border-radius: 4px;
                border-right: 4px solid var(--main-color);
            }

            .button-search {
                border: none;
                outline: none;
                background-color: transparent;
                position: absolute;
                left: 5px;
                top: 10px;
            }

            .button-search img {
                width: 30px;
                height: 20px;
            }
        </style>
    </head>
    <body>
        <div class="header_wrapper">
            <!-- logo -->
            <div class="header_left">
                <a href="<%=request.getContextPath()%>/pitchcontroller" class="header_logo" rel="homepage">
                    <img
                        src="./asset/img/Xanh lá và Trắng Con hưu đực Bóng đá Việt Biểu trưng.png"
                        alt="Logo page"
                        />
                </a>
                
                <!-- nav bar -->
                <div class="header_navbar">
                    <div class="header_search">
                        <div class="header_search_content">
                            <form action="searchProduct" method="get" id="search_form" >
                                <button type="submit" class="button-search">
                                    <img
                                        src="./asset/icon/magnifying-glass-solid 1.svg"
                                        alt="search"
                                        />
                                </button>
                                <input
                                    type="text"
                                    name="keyword"
                                    id="keyword"
                                    placeholder="Tìm kiếm sân..."
                                    class="input-text"
                                    />
                            </form>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <!--                    <div class="navbar_list">
                                            <a href="" class="nav_items" title="Quả bóng đá">Quả bóng đá</a>
                                            <a href="" class="nav_items" title="Áo đấu">Áo đấu</a>
                                            <a href="" class="nav_items" title="Găng tay thủ môn">Găng tay thủ môn</a>
                                            <a href="" class="nav_items" title="Giày đá bóng">Giày đá bóng</a>
                                        </div>-->
                </div>
            </div>
            <div class="header_right">
                <div class="header_CTO">
                    <c:if test="${sessionScope.user == null}">
                        <div class="login">
                            <a href="<%=request.getContextPath()%>/UserLogin.jsp">
                                <img src="./asset/icon/Vector.svg" alt="" />
                                <p class="desc">
                                    Đăng nhập
                                    <img
                                        src="./asset/icon/angle-down-solid 3.svg"
                                        alt=""
                                        id="dropdown-btn"
                                        />
                                </p>
                            </a>
                            <div class="login_sub_menu">
                                <a href="<%=request.getContextPath()%>/UserRegister.jsp">Đăng ký tài khoản</a>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.user != null}">
                        <div class="logout">
                            <a href="<%=request.getContextPath()%>/logout">Đăng xuất</a>
                        </div>
                    </c:if>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
    </body>
</html>
