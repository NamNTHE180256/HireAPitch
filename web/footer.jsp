<%-- 
    Document   : footer
    Created on : 7 Mar 2024, 22:33:45
    Author     : dumspicy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Footer</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
        <style>
            body {
                margin: 0px;
                box-sizing: border-box;
                font-family: monospace, sans-serif;
                font-size: 18px;
            }

            .footer {
                background-color: #006400;
                color: white;
                padding: 40px 0;
                display: flex;
                align-items: center;
            }

            .footer .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 0 15px;
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                gap: 40px;
            }

            .footer h4 {
                font-size: 20px;
                margin-bottom: 25px;
                border-bottom: 2px solid #e74c3c;
                display: inline-block;
            }

            .footer p,
            .footer a {
                margin-bottom: 10px;
                display: block;
            }

            .footer ul {
                padding: 0;
                list-style-type: none;
            }

            .footer a {
                color: #bdc3c7;
                text-decoration: none;
                transition: color 0.3s;
            }

            .footer a:hover {
                color: #e74c3c;
            }

            .footer i {
                font-size: 20px;
                margin-right: 10px;
            }
            
            .footer .social-links ul {
                display: flex;
                gap: 15px;
            }

            

        </style>
    </head>
    <body>
        <footer class="footer">
            <div class="container">

                <div class="useful-links">
                    <h4>Sân bóng Hà Nội</h4>
                    <a href="#">Đặt sân online</a>
                    <a href="#">Tin tức</a>
                    <a href="#">Thành viên thân thiết</a>
                    <a href="#">Liên hệ</a>
                </div>
                <div class="contact">
                    <h4>Contact Us</h4>
                    <p><i class="fas fa-envelope"></i> sanbonghanoi@gmail.com</p>
                    <p><i class="fas fa-phone"></i> 0987563385</p>
                    <p><i class="fas fa-map-marker-alt"></i> Sân bóng Hà Nội</p>
                </div>
                <div class="social-links">
                    <h4>Follow Us</h4>
                    <ul>
                        <li><a href="#" title="Twitter"><i class="fab fa-twitter"></i></a></li>
                        <li><a href="#" title="Facebook"><i class="fab fa-facebook"></i></a></li>
                        <li><a href="#" title="Instagram"><i class="fab fa-instagram"></i></a></li>
                        <li><a href="#" title="Pinterest"><i class="fab fa-pinterest"></i></a></li>
                    </ul>
                </div>
            </div>
        </footer>
    </body>
</html>
