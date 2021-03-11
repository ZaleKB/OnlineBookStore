<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2/02/2021
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Book</title>


    <%@ include file="/pages/common/head.jsp"%>

    <script>
        $(function () {
            $(".addClass").click(function () {
                return confirm("Add Book [" + $(this).parent().parent().find("td:first").find("input:first").text() + "]?");
            //    need to fix this!
            })
        });
    </script>


    <style type="text/css">
        h1 {
            text-align: center;
            margin-top: 200px;
        }

        h1 a {
            color:red;
        }

        input {
            text-align: center;
        }
    </style>
</head>
<body>
    <div id="header">
        <img class="logo_img" alt="" src="static/img/logo.gif" >
        <span class="wel_word">Edit Book</span>


        <%@include file="/pages/common/manager_menu.jsp"%>


    </div>

    <div id="main">
        <form action="manager/bookServlet" method="get">
            <input type="hidden" name="pageNo" value="${param.pageNo}">
            <input type="hidden" name="action" value="${ empty param.id ? "add" : "update" }" />
            <input type="hidden" name="id" value="${ requestScope.book.id }" />
            <table>
                <tr>
                    <td>Name</td>
                    <td>Price</td>
                    <td>Author</td>
                    <td>Sale</td>
                    <td>Stock</td>
                    <td colspan="2">Edit</td>
                </tr>
                <tr>
                    <td><input name="name" type="text" value="${requestScope.book.name}"/></td>
                    <td><input name="price" type="text" value="${requestScope.book.price}"/></td>
                    <td><input name="author" type="text" value="${requestScope.book.author}"/></td>
                    <td><input name="sales" type="text" value="${requestScope.book.sales}"/></td>
                    <td><input name="stock" type="text" value="${requestScope.book.stock}"/></td>
                    <td><input class="addClass" type="submit" value="Submit"/></td>
                </tr>
            </table>
        </form>
    </div>


    <%@include file="/pages/common/footer.jsp"%>

</body>
</html>
