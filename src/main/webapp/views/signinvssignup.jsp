<%--
  Created by IntelliJ IDEA.
  User: trong
  Date: 29/12/2021
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1">

    <title>SignUp vs SignIn</title>
    <script src="https://kit.fontawesome.com/936c874066.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/signinvssignup.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css">
</head>
<body>
<header>
    <div class="header-top-wrap-logo">
        <h1>
            <a href="./home.html"><img src="<%=request.getContextPath()%>/img/logo.png"
                                       alt="Thời trang công sở Seven.AM: Váy đầm, quần áo, vest nữ"></a>
        </h1>
    </div>
</header>
<section id="sign">
    <div class="container-center right-panel-active">
        <!-- Sign Up -->
        <div class="container-center__form container-center--signup">
            <div class="form">
                <h2 class="form__title">Đăng ký</h2>
                <input type="text" placeholder="Tên đăng nhập" class="input" id="exampleInputName1"/>
                <input type="email" placeholder="Email" class="input" id="exampleInputEmail"/>
                <input type="password" placeholder="Mật khẩu" class="input" id="exampleInputPassword1"/>
                <input type="password" placeholder="Nhập lại mật khẩu" class="input" id="exampleConfirmPassword1"/>
                <button class="btn" onclick="">Đăng ký</button>
            </div>
        </div>
        <!-- Sign In -->
        <div class="container-center__form container-center--signin content-agile2">
            <form action="" method="POST" class="form">
                <h2 class="form__title">Đăng nhập</h2>
                <input type="text" placeholder="Tên đăng nhập" name="name" class="input" id="email"
                       title="Vui lòng nhập UserName" required=""/>
                <input type="password" placeholder="Mật khẩu" name="pass" class="input" id="password1"
                       title="Vui Lòng nhập password" required=""/>
                <a href="#" class="link">Quên mật khẩu</a>
                <!-- <button class="btn">Đăng nhập</button> -->
                <input type="submit" class="register btn" value="Đăng Nhập">
            </form>
        </div>

        <!-- Overlay -->
        <div class="container-center__overlay">
            <div class="overlay">
                <div class="overlay__panel overlay--left">
                    <button class="btn" id="signIn">Đăng nhập</button>
                </div>
                <div class="overlay__panel overlay--right">
                    <button class="btn" id="signUp">Đăng ký</button>
                </div>
            </div>
        </div>
    </div>
</section>
<%@include file="../views/footer.jsp"%>

<script>

    //sytle
    const signInBtn = document.getElementById("signIn");
    const signUpBtn = document.getElementById("signUp");
    const container = document.querySelector(".container-center");
    container.classList.remove("right-panel-active");
    signInBtn.addEventListener("click", () => {
        container.classList.remove("right-panel-active");
    });
    signUpBtn.addEventListener("click", () => {
        container.classList.add("right-panel-active");
    });
</script>
</body>
</html>