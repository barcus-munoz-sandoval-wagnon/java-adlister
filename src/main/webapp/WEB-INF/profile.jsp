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
    <div class="col-6 mx-auto">
        <h1>Welcome, ${user.username}!</h1>
        <form action="/profile/edit">
            <%--      put a hidden input type ="hidden" send over value with
                      whole ad Object--%>
                <input type="hidden" name="username" value="${user.username}">
            <input type="submit" class="btn btn-sm bg-primary" value="Click Here to Edit your profile">

        </form>
    </div>


    <h1>Here Are your ads ...</h1>


    <c:forEach var="ad" items="${ads}">
        <c:if test="${ad.userId eq user.id}">
            <div class="col-md-6">
                    <%--                    <form action="/ads/edit" method="get">--%>

                <div class="card" style="width: 18rem;">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                        <h1 class="card-title"><c:out value="${ad.title}" /></h1>
                        <p class="card-text"><c:out value="${ad.description}" /></p>
                        <p>Go somewhere</p>
                    </div>
                </div>
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