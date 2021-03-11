<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 1/12/2021
  Time: 6:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login In</title>

    <%@ include file="/pages/common/head.jsp"%>


    <style type="text/css">
        h1 {
            text-align: center;
            margin-top: 200px;
        }

        h1 a {
            color:red;
        }
    </style>
</head>
<body>
    <div id="header">
        <img class="logo_img" alt="" src="static/img/logo.gif" >


        <%@ include file="/pages/common/login_success_menu.jsp"%>


    </div>

    <div id="main">

        <h1>Welcome Back! <a href="index.jsp">Home Page</a></h1>

    </div>



    <%@include file="/pages/common/footer.jsp"%>

</body>
</html>
