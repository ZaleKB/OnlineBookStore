<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 1/21/2021
  Time: 6:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>

    <%@include file="/pages/common/head.jsp"%>
    <script type="text/javascript">
        $(function () {
            $("button.addToCart").click(function () {
                var bookId = $(this).attr("bookId");

                $.getJSON("<%=basePath%>cartServlet","action=ajaxAddItem&id=" + bookId,function (data) {
                    $(".cartTotalCount").text("You have total " + data.totalCount + " items in your Cart");
                    $(".cartLastName").text(data.lastName);
                });
            });

            $("a.sign_out").click(function () {
                return confirm("Are you sure to Sign Out?");
            })
        });
    </script>

</head>
<body>

    <div id="header">
        <img class="logo_img" alt="" src="static/img/logo.gif" >
        <span class="wel_word">Online BookStore</span>
        <div>
            <%--if user not login then show menu of login and register --%>
            <c:if test="${empty sessionScope.user}">
                <a href="pages/user/login.jsp">[Login]</a> |
                <a href="pages/user/register.jsp">[Register]</a> &nbsp;&nbsp;
            </c:if>
            <%--if already login then show success menu information。--%>
            <c:if test="${not empty sessionScope.user}">
                <span>Welcome<span class="um_span">${sessionScope.user.username}</span>to Online BookStore</span>
                <a href="pages/order/order.jsp">[My Order]</a> |
                <a class="sign_out" href="userServlet?action=logout">[SignOut]</a>&nbsp;&nbsp;&nbsp;
            </c:if>

            <a href="pages/cart/cart.jsp">[Shopping Cart]</a> |
            <a href="pages/manager/manager.jsp">[Management]</a>
        </div>
    </div>

    <div id="main">
        <div id="book">
            <div class="book_cond">
                <form action="client/bookServlet" method="get">
                    <input type="hidden" name="action" value="pageByPrice">
                    PRICE: $ <input id="min" type="text" name="min" value="${param.min}"> -
                    $ <input id="max" type="text" name="max" value="${param.max}">
                    <input type="submit" value="Search" />
                </form>
            </div>
            <div style="text-align: center">
                <c:if test="${empty sessionScope.cart.items}">
                    <%--output when Cart is empty--%>
                    <span class="cartTotalCount"> </span>
                    <div>
                        <span style="color: red" class="cartLastName">Your shopping chart is empty!</span>
                    </div>
                </c:if>
                <c:if test="${not empty sessionScope.cart.items}">
                    <%--output when cart is not empty--%>
                    <span class="cartTotalCount">You have total ${sessionScope.cart.totalCount} items in your cart</span>
                    <div>
                        <span style="color: hsl(30, 100%, 50%)" class="cartLastName">[${sessionScope.lastName}]</span> added to cart!
                    </div>
                </c:if>
            </div>

            <c:forEach items="${requestScope.page.items}" var="book">
                <div class="b_list">
                    <div class="img_div">
                        <img class="book_img" alt="" src="${book.imgPath}" />
                    </div>
                    <div class="book_info">
                        <div class="book_name">
                            <span class="sp1">Name:</span>
                            <span class="sp2">${book.name}</span>
                        </div>
                        <div class="book_author">
                            <span class="sp1">Author:</span>
                            <span class="sp2">${book.author}</span>
                        </div>
                        <div class="book_price">
                            <span class="sp1">Price:</span>
                            <span class="sp2">$${book.price}</span>
                        </div>
                        <div class="book_sales">
                            <span class="sp1">Sale:</span>
                            <span class="sp2">${book.sales}</span>
                        </div>
                        <div class="book_amount">
                            <span class="sp1">Stock:</span>
                            <span class="sp2">${book.stock}</span>
                        </div>
                        <div class="book_add">
                            <button bookId="${book.id}" class="addToCart">Add to cart</button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <%--static include page_nav exhibition--%>
        <%@include file="/pages/common/page_nav.jsp"%>
    </div>

    <%@ include file="/pages/common/footer.jsp" %>

</body>
</html>
