<%-- 
    Document   : addstuff
    Created on : Mar 13, 2024, 9:08:53 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Stuff</title>
        <link href="asset/stylesheet/addstuff.css" rel="stylesheet" type="text/css">
        <script>
            function changeSizeField() {
                const stuffType = document.getElementById("stuffType").value;
                const sizeField = document.getElementById("sizeField");
                const shoeSizeField = document.getElementById("shoeSizeField");
                const shirtGloveSizeField = document.getElementById("shirtGloveSizeField");

                // Ẩn tất cả các trường kích thước
                sizeField.style.display = "none";
                shoeSizeField.style.display = "none";
                shirtGloveSizeField.style.display = "none";

                // Hiển thị trường kích thước tương ứng với loại đồ dùng đã chọn
                if (stuffType === "Bóng") {
                    sizeField.style.display = "block";
                } else if (stuffType === "Giày") {
                    shoeSizeField.style.display = "block";
                } else if (stuffType === "Áo Pitch" || stuffType === "Găng") {
                    shirtGloveSizeField.style.display = "block";
                }
            }

            window.onload = function () {
                changeSizeField();
            };
        </script>
    </head>
    <body>
        <div class="container">
            <h1>Add Stuff</h1>
            <form action="addStuff" method="get" >
                <div class="form-group">
                    <label for="stuffName">Stuff Name:</label>
                    <input type="text" id="stuffName" name="stuffName" required>
                </div>
                <div class="form-group">
                    <label for="stuffType">Stuff Type:</label>
                    <select id="stuffType" name="type" onchange="changeSizeField()">
                        <option value="">Select Stuff Type</option>
                        <option value="Bóng" name="stuffType">Bóng</option>
                        <option value="Giày" name="stuffType">Giày</option>
                        <option value="Áo Pitch" name="stuffType">Áo Pitch</option>
                        <option value="Găng" name="stuffType">Găng</option>
                    </select>
                </div>

                <div class="form-group" id="sizeField">
                    <label for="size">Size:</label>
                    <select id="size" name="size">
                        <option value="" name="size">Select Size</option>
                       
                        <option value="4" name="size">4</option>
                        <option value="5" name="size">5</option>
                    </select>
                </div>

                <div class="form-group" id="shoeSizeField">
                    <label for="shoeSize">Size:</label>
                    <input type="number" id="shoeSize" name="shoeSize" min="35" max="44">
                </div>

                <div class="form-group" id="shirtGloveSizeField">
                    <label for="shirtGloveSize">Size:</label>
                    <select id="shirtGloveSize" name="shirtGloveSize">
                        <option value="" name="shirtGloveSize">Select Size</option>
                        <option value="S" name="shirtGloveSize">S</option>
                        <option value="M" name="shirtGloveSize">M</option>
                        <option value="XL" name="shirtGloveSize">XL</option>
                        <option value="XXL" name="shirtGloveSize">XXL</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="number" id="price" name="price" step="0.01" required>
                </div>
                <div class="form-group">
                    <label for="amount">Amount:</label>
                    <input type="number" id="amount" name="amount" required>
                </div>
                <div class="form-group">
                    <label for="image">Image:</label>
                    <input type="text" id="image" name="image">
                </div>
                <div class="button-group">
                    <input type="submit" value="Save">
                    <input type="reset" value="Reset">
                </div>
            </form>
        </div>
    </body>
</html>