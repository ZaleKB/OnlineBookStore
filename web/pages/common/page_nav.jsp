<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2/07/2021
  Time: 10:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $(function () {
        $("#searchPageBtn").click(function () {
            var pageNo = $("#pn_input").val();

            location.href = "${pageScope.basePath}${requestScope.page.url}&pageNo=" + pageNo;
        });
    });


</script>

<%--This is where paging begin--%>
<div id="page_nav">

    <c:if test="${requestScope.page.pageNo > 1}">
        <a href="${requestScope.page.url}&pageNo=1">Front</a>
        <a href="${requestScope.page.url}&pageNo=${requestScope.page.pageNo-1}">Prev</a>
    </c:if>

    <c:choose>
        <c:when test="${requestScope.page.pageTotal <= 5}">
            <c:set var="begin" value="1" />
            <c:set var="end" value="5" />
        </c:when>

        <c:when test="${requestScope.page.pageTotal > 5}">
            <c:choose>

                <c:when test="${requestScope.page.pageNo <= 3}">
                    <c:set var="begin" value="1"/>
                    <c:set var="end" value="5"/>
                </c:when>

                <c:when test="${requestScope.page.pageNo > requestScope.page.pageTotal-3}">
                    <c:set var="begin" value="${requestScope.page.pageTotal-4}"/>
                    <c:set var="end" value="${requestScope.page.pageTotal}"/>
                </c:when>

                <c:otherwise>
                    <c:set var="begin" value="${requestScope.page.pageNo-2}"/>
                    <c:set var="end" value="${requestScope.page.pageNo+2}"/>
                </c:otherwise>
            </c:choose>
        </c:when>
    </c:choose>


    <c:forEach begin="${begin}" end="${end}" var="i">
        <c:if test="${i == requestScope.page.pageNo}">
            [${i}]
        </c:if>
        <c:if test="${i != requestScope.page.pageNo}">
            <a href="${requestScope.page.url}&pageNo=${i}">${i}</a>
        </c:if>
    </c:forEach>

    <c:if test="${requestScope.page.pageNo < requestScope.page.pageTotal}">
        <a href="${ requestScope.page.url }&pageNo=${requestScope.page.pageNo+1}">Next</a>
        <a href="${ requestScope.page.url }&pageNo=${requestScope.page.pageTotal}">End</a>
    </c:if>

    &nbsp&nbsp&nbsp Page-${ requestScope.page.pageTotal }, Record-${ requestScope.page.pageTotalCount }
    &nbsp To <input value="${param.pageNo}" name="pn" id="pn_input"/>
    <input id="searchPageBtn" type="button" value="GO">

</div>
