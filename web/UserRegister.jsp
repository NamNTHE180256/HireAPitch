<%-- 
    Document   : UserRegister
    Created on : 28 Feb 2024, 22:16:34
    Author     : dumspicy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="asset/stylesheet/UserRegisterStyle.css" rel="stylesheet" type="text/css">
        <link href="asset/stylesheet/reset.css" rel="stylesheet" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <form action="userRegister" method="get" class="form__register--user">
                <div class="home">
                    <a href="<%=request.getContextPath()%>/pitchcontroller"><img src="asset/icon/home.svg" class="homepage__icon" alt="..."></a>
                </div>
                <div class="register__heading">
                    <h1>Đăng ký tài khoản</h1>
                </div>
                <div class="register">
                    <div class="register__left">
                        <label for="name">Họ và Tên(<span>*</span>)</label>
                        <input type="text" name="name" id="name" value="${param.name}" />
                        <span class="error-message">${empty requestScope.nameEmpty ? "" : requestScope.nameEmpty}</span>
                        <br />

                        <label for="phone">Số điện thoại(<span>*</span>)</label>
                        <input type="text" name="phone" id="phone" value="${param.phone}" />
                        <span class="error-message">${empty requestScope.phoneEmpty ? "" : requestScope.phoneEmpty}</span>
                        <span class="error-message">${empty requestScope.phoneExisted ? "" : requestScope.phoneExisted}</span>
                        <br />

                        <label for="username">Username(<span>*</span>)</label>
                        <input type="text" name="username" id="username" value="${param.username}" />
                        <span class="error-message">${empty requestScope.usernameEmpty ? "" : requestScope.usernameEmpty}</span>
                        <span class="error-message">${empty requestScope.usernameExisted ? "" : requestScope.usernameExisted}</span>
                        <br />
                    </div>

                    <div class="register__right">
                        <label for="email">Email</label>
                        <input type="email" name="email" id="email" value="${param.email}" />
                        <span class="error-message">${empty requestScope.emailEmpty ? "" : requestScope.emailEmpty}</span>
                        <span class="error-message">${empty requestScope.emailExisted ? "" : requestScope.emailExisted}</span>
                        <br />

                        <label for="avt">Avatar</label>
                        <input type="text" name="avt" id="avt" value="${param.avt}" />

                        <div class="section__password">
                            <div class="pass">
                                <label for="password">Mật khẩu(<span>*</span>)</label>
                                <input type="password" name="pass" id="password" value="${param.pass}"/>
                                <span class="error-message">${empty requestScope.passEmpty ? "" : requestScope.passEmpty}</span>
                            </div>

                            <div class="re_pass">
                                <label for="confirm-pass">Xác nhận mật khẩu(<span>*</span>)</label>
                                <input type="password" name="confirm-pass" id="confirm-pass" />
                                <span class="error-message">${empty requestScope.passEmpty ? (empty requestScope.confirmPasswordMessage ? "" : requestScope.confirmPasswordMessage) : ""}</span>
                            </div>
                        </div>
                    </div>


                    <div class="clear"></div>

                </div>
                <div class="CTA-action">
                    <p>Đã có tài khoản, <a href="<%=request.getContextPath()%>/UserLogin.jsp">đăng nhập</a></p>
                    <input type="submit" value="Đăng ký" class="form__register--btn" id="submit_btn"/>
                </div>
            </form>

        </div>
        <script>
            function validatePass() {
                var pass = document.getElementById("password");
                var re_pass = document.getElementById("confirm-pass");
                var submitBtn = document.getElementById("submit_btn");
                if (pass.value !== re_pass.value) {
                    submitBtn.disabled = true;
                    re_pass.style.border = "1px solid red";
                } else {
                    submitBtn.disabled = false;
                    re_pass.style.border = "1px solid green";
                }
            }
        </script>
    </body>
</html>
