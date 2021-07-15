<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">

    <h1>Welcome, ${sessionScope.user.username}!</h1>

    <h1>Here Are your ads ...</h1>


    <c:forEach var="ad" items="${ads}">
        <c:if test="${sessionScope.user.id eq ad.userId}">
            <div class="col-md-6">
                    <%--                    <form action="/ads/edit" method="get">--%>
                        <h2><c:out value="${ad.title}" /></h2>
                        <p><c:out value="${ad.description}" /></p>
                    <%--      put a hidden input type ="hidden" send over value with
                              whole ad Object--%>
                <form action="/ads/edit">
                    <input type="submit" name="id" value="${ad.id}">Edit Ad</input>
                </form>

                <form action="/ads/delete" method="POST">
                        <%--      put a hidden input type ="hidden" send over value with
                                  whole ad Object--%>
                    <button>Delete Ad</button>
                    <input type="hidden" name="id" value="${ad.id}">
                </form>

                <form action="/ads/view">
                        <%--      put a hidden input type ="hidden" send over value with
                                  whole ad Object--%>
                    <button>View Ad Details</button>
                    <input type="hidden" name="id" value="${ad.id}">
                </form>
            </div>
        </c:if>
    </c:forEach>

</div>

</body>
</html>