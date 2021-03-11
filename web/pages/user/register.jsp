<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 1/10/2021
  Time: 10:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>


    <%@ include file="/pages/common/head.jsp"%>


    <script type="text/javascript">

        $(function () {

            $("#username").blur(function () {

                var username = this.value;
                $.getJSON("<%=basePath%>userServlet","action=ajaxExistsUsername&username=" + username,function (data) {
                    if (data.existsUsername) {
                        $("span.errorMsg").text("Username already exists!");
                    } else {
                        $("span.errorMsg").text("Username usable!");
                    }
                });
            });


            // This for verification code click event
            $("#code_img").click(function () {
                this.src = "${basePath}kaptcha.jpg?d=" + new Date();
            });

            // Register event
            $("#sub_btn").click(function () {

                var usernameText = $("#username").val();
                var usernamePatt = /^\w{5,16}$/;

                if (!usernamePatt.test(usernameText)) {
                    $("span.errorMsg").text("Invalid Username");
                    return false;
                }

                var passwordText = $("#password").val();
                var passwordPatt = /^\w{5,16}$/;

                if (!passwordPatt.test(passwordText)) {
                    $("span.errorMsg").text("Invalid Password!");

                    return false;
                }

                var repwdText = $("#repwd").val();
                if (repwdText != passwordText) {
                    //remind User
                    $("span.errorMsg").text("Passwords didn't match");

                    return false;
                }


                var emailText = $("#email").val();
                var emailPatt = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;

                if (!emailPatt.test(emailText)) {

                    $("span.errorMsg").text("Invalid Email!");

                    return false;
                }


                var codeText = $("#code").val();
                codeText = $.trim(codeText);
                if (codeText == null || codeText == "") {
                    $("span.errorMsg").text("Can not be empty!");
                    return false;
                }

                $("span.errorMsg").text("");

            });

        });

    </script>
    <style type="text/css">
        .login_form{
            height:420px;
            margin-top: 25px;
            margin-right: 0px;
        }

    </style>
</head>
<body>
    <div id="login_header">
        <img class="logo_img" alt="" src="static/img/logo.gif" >
    </div>

    <div class="login_banner">

        <div id="l_content">
            <span class="login_word">Welcome Joining Us!</span>
        </div>

        <div id="content">
            <div class="login_form">
                <div class="login_box">
                    <div class="tit">
                        <h1>Sign Up</h1>
                        <span class="errorMsg">
                            ${ requestScope.msg }
                        </span>
                    </div>
                    <div class="form">
                        <form action="userServlet" method="post">
                            <input type="hidden" name="action" value="register">
                            <label>Username:</label>
                            <input class="itxt" type="text" placeholder="Please enter username"
                                   value="${requestScope.username}"
                                   autocomplete="off" tabindex="1" name="username" id="username" />
                            <br />
                            <br />
                            <label>Password:</label>
                            <input class="itxt" type="password" placeholder="Please enter password"
                                   autocomplete="off" tabindex="1" name="password" id="password" />
                            <br />
                            <br />
                            <label>Confirm:</label>
                            <input class="itxt" type="password" placeholder="Confirm password"
                                   autocomplete="off" tabindex="1" name="repwd" id="repwd" />
                            <br />
                            <br />
                            <label>Email:</label>
                            <input class="itxt" type="text" placeholder="Please enter email address"
                                   value="${requestScope.email}"
                                   autocomplete="off" tabindex="1" name="email" id="email" />
                            <br />
                            <br />
                            <label>Code:</label>
                            <input class="itxt" type="text" name="code" style="width: 120px;" id="code" />
                            <img id="code_img" alt="" src="kaptcha.jpg" style="float: right; margin-right: 40px; width: 110px; height: 30px;">
                            <br />
                            <br />
                            <input type="submit" value="SIGN UP" id="sub_btn" />
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>


    <%@include file="/pages/common/footer.jsp"%>

</body>
</html>
