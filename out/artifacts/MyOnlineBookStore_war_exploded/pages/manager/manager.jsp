<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2/02/2021
  Time: 5:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>BackStage</title>


    <%@ include file="/pages/common/head.jsp"%>


    <style type="text/css">
        h1 {
            text-align: center;
            margin-top: 200px;
        }
    </style>
</head>
<body>
    <div id="header">
        <img class="logo_img" alt="" src="static/img/logo.gif" >
        <span class="wel_word">Management System</span>


        <%@include file="/pages/common/manager_menu.jsp"%>


    </div>

    <div id="main">
        <h1>Welcome To Management System!</h1>
    </div>


    <%@include file="/pages/common/footer.jsp"%>

</body>
</html>
