<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <h1>Here Are all the ads!</h1>
    <c:forEach var="ad" items="${ads}">
<%--        Form to send info to ViewIndividualServlet--%>
        <form class="col-6 bg-danger" style="border: 1px black" action="ads/view">
            <h2><c:out value="${ad.title}" /></h2>
            <p><c:out value="${ad.description}" /></p>
            <p><c:out value="${ad.category}" /></p>
<%--        Hidden input to set the value of the name 'id' to 'ad.id--%>
            <input type="hidden" name="id" value="${ad.id}">
<%--        Form submit button--%>
            <input class="btn btn-sm btn-secondary" type="submit" value="View Ad">
        </form>

    </c:forEach>
</div>


</body>
</html>