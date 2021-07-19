<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>
</head>
<body style="height: 100%;background-position:center;background-size:cover;background-image: url(https://i.pinimg.com/originals/08/1f/8c/081f8cd08585e1040a8393c25b274126.gif) ">
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container mt-5" style="width: 75%">
    <h1 >Here Are all the ads!</h1>
    <div class="row mx-auto mt-5" >
        <c:forEach var="ad" items="${ads}">
                <div class="col 6">
                        <%--                    <form action="/ads/edit" method="get">--%>
                    <div class="card border border-dark mb-3 col3 " style="width: 20rem;">
                        <img src="https://mymodernmet.com/wp/wp-content/uploads/2020/10/cooper-baby-corgi-dogs-8.jpg" class="card-img-top" alt="...">
                        <div class="card-body bg-dark border border-dark" style="color: white">
                            <h3 class="card-header"><c:out value="${ad.title}" /></h3>
                            <p class="card-text" ><c:out value="${ad.description}" /></p>
                            <div class="card-footer row" style="height: 5rem;width: 20rem;">
                                <div class="justify-content-between">
                                    <p class="mr-auto">Category: <c:out value="${ad.category}"/></p>
                                    <div class="row">
                                        <c:if test="${ad.userId eq user.id}">
                                        <form class="mx-1" action="/ads/edit">
                                            <input class="btn btn-info btn-sm" type="submit" value="Edit ad">
                                            <input type="hidden" name="id" value="${ad.id}">
                                            <input type="hidden" name="userId" value="${ad.userId}">
                                        </form>

                                            <form  action="/ads/delete" method="POST">
                                                    <%--      put a hidden input type ="hidden" send over value with
                                                              whole ad Object--%>
                                                <button class="btn btn-info btn-sm" > Delete Ad</button>
                                                <input type="hidden" name="id" value="${ad.id}">
                                            </form>
                                        </c:if>
                                        <form class="mx-1" action="/ads/view">
                                                <%--      put a hidden input type ="hidden" send over value with
                                                          whole ad Object--%>
                                            <button class="btn btn-info btn-sm"  >View Ad Details</button>
                                            <input type="hidden" name="id" value="${ad.id}">
                                            <input type="hidden" name="id" value="${category.id}">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </c:forEach>
    </div>
</div>


</body>
</html>