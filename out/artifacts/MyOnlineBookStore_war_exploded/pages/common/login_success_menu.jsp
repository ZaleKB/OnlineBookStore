<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 1/26/2021
  Time: 6:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <span>Welcome<span class="um_span">${sessionScope.user.username}</span>to Online BookStore</span>
    <a href="pages/order/order.jsp">[My Order]</a> |
    <a href="userServlet?action=logout">[Sign Out]</a>
    <a href="index.jsp">Home</a>
</div>
