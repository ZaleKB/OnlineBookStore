<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 1/10/2021
  Time: 8:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <%@ include file="/pages/common/head.jsp" %>
</head>
<body>
    <div id="login_header">
        <img class="logo_img" alt="" src="static/img/logo.gif" >
    </div>

    <div class="login_banner">

        <div id="l_content">
            <span class="login_word">Welcome Login!</span>
        </div>

        <div id="content">
            <div class="login_form">
                <div class="login_box">
                    <div class="tit">
                        <h1>Membership</h1>
                        <a href="pages/user/register.jsp">Sign up</a>
                    </div>
                    <div class="msg_cont">
                        <b></b>
                        <span class="errorMsg">
                            ${ empty requestScope.msg ? "Please enter username and password":requestScope.msg }
                        </span>
                    </div>
                    <div class="form">
                        <form action="userServlet" method="post">
                            <input type="hidden" name="action" value="login" />
                            <label>Username:</label>
                            <input class="itxt" type="text" placeholder="Please enter username"
                                   autocomplete="off" tabindex="1" name="username"
                                   value="${requestScope.username}" />
                            <br />
                            <br />
                            <label>Password:</label>
                            <input class="itxt" type="password" placeholder="Please enter password"
                                   autocomplete="off" tabindex="1" name="password" />
                            <br />
                            <br />
                            <input type="submit" value="Log In" id="sub_btn" />
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>


    <%@include file="/pages/common/footer.jsp"%>

</body>
</html>
