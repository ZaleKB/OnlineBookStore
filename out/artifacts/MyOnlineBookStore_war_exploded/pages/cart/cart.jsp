<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2/14/2021
  Time: 5:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>

    <%@ include file="/pages/common/head.jsp"%>
    <script>
        $(function () {

            $("a.deleteItem").click(function () {
                return confirm("Sure About To Delete[" + $(this).parent().parent().find("td:first").text() +"]?")
            });

            $(".clearCart").click(function () {
                return confirm("Sure About To Delete all items?");
            })

            $(".updateCount").change(function () {

                var name = $(this).parent().parent().find("td:first").text();
                var id = $(this).attr('bookId');

                var count = this.value;
                if ( confirm("Are you sure to add [" + name + "] up to [" + count + "]?") ) {

                    location.href = "<%=basePath%>cartServlet?action=updateCount&count="+count+"&id="+id;
                } else {
                    // defaultValue belongs to Dom subject of Form attribute
                    this.value = this.defaultValue;
                }
            });

        });
    </script>
</head>
<body>
    <div id="header">
        <img class="logo_img" alt="" src="static/img/logo.gif" >
        <span class="wel_word">Shopping Cart</span>


        <%@ include file="/pages/common/login_success_menu.jsp"%>


    </div>

    <div id="main">

        <table>
            <tr>
                <td>BookName</td>
                <td>Quantity</td>
                <td>Price</td>
                <td>Total Price</td>
                <td>Operation</td>
            </tr>
            <c:if test="${empty sessionScope.cart.items}">
                <tr>
                    <td colspan="5">
                        <a href="index.jsp">Your Shopping Cart is Empty! Let's go shopping!</a> </td>
                </tr>
            </c:if>

            <c:if test="${not empty sessionScope.cart.items}">

                <c:forEach items="${sessionScope.cart.items}" var="entry">
                    <tr>
                        <td>${entry.value.name}</td>
                        <td>
                            <input class="updateCount" style="width: 60px;"
                                   bookId="${entry.value.id}"
                                   type="text" value="${entry.value.count}">
                        </td>
                        <td>${entry.value.price}</td>
                        <td>${entry.value.totalPrice}</td>
                        <td><a class="deleteItem" href="cartServlet?action=deleteItem&id=${entry.value.id}">Delete</a></td>
                    </tr>
                </c:forEach>
            </c:if>
        </table>

        <c:if test="${not empty sessionScope.cart.items}">
            <div class="cart_info">
                <span class="cart_span">Subtotal: <span class="b_count">${sessionScope.cart.totalCount}</span> Items</span>
                <span class="cart_span">Total Price: $<span class="b_price">${sessionScope.cart.totalPrice}</span></span>
                <span class="cart_span"><a class="clearCart" href="cartServlet?action=clear">Clear Cart</a></span>
                <span class="cart_span"><a href="orderServlet?action=createOrder">Checkout</a></span>
            </div>
        </c:if>

    </div>


    <%@include file="/pages/common/footer.jsp"%>

</body>
</html>
