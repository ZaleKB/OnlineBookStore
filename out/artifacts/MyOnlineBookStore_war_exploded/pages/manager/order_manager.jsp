<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2/02/2021
  Time: 5:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Management</title>

    <%@ include file="/pages/common/head.jsp"%>

</head>
<body>
    <div id="header">
        <img class="logo_img" alt="" src="static/img/logo.gif" >
        <span class="wel_word">Order Management System</span>

        <%@include file="/pages/common/manager_menu.jsp"%>

    </div>

    <div id="main">
        <table>
            <tr>
                <td>Date</td>
                <td>Price</td>
                <td>Detail</td>
                <td>Delivery</td>

            </tr>
            <tr>
                <td>2020.010.24</td>
                <td>90.00</td>
                <td><a href="#">See Detail</a></td>
                <td><a href="#">Click Shipping</a></td>
            </tr>

            <tr>
                <td>2020.010.20</td>
                <td>20.00</td>
                <td><a href="#">See Detail</a></td>
                <td>已发货</td>
            </tr>

            <tr>
                <td>2020.12.20</td>
                <td>190.00</td>
                <td><a href="#">See Detail</a></td>
                <td>Wait for Receiving</td>
            </tr>
        </table>
    </div>


    <%@include file="/pages/common/footer.jsp"%>

</body>
</html>
