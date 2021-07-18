<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Viewing Individual Ads"/>
  </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<form class="container bg-danger">
    <div class="col-md-12">
        <h1><c:out value="${ad.title}" /></h1>
        <p><c:out value="${ad.description}" /></p>
        <p><c:out value="${category.name}" /></p>
    </div>
</form>

</body>
</html>