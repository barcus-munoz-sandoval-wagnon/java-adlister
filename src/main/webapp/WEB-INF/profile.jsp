<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
</head>
<body style="height: 100%;background-position:center;background-size:cover;background-image: url(https://i.pinimg.com/originals/08/1f/8c/081f8cd08585e1040a8393c25b274126.gif) ">
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

    <div class="col-3">
        <c:forEach var="ad" items="${ads}">
            <c:if test="${ad.userId eq user.id}">
                <div class="col-md-6">
                        <%--                    <form action="/ads/edit" method="get">--%>
                    <div class="card border border-dark mb-3" style="width: 30rem;">
                        <img src="https://mymodernmet.com/wp/wp-content/uploads/2020/10/cooper-baby-corgi-dogs-8.jpg" class="card-img-top" alt="...">
                        <div class="card-body bg-dark" style="color: white">
                            <h3 class="card-header"><c:out value="${ad.title}" /></h3>
                            <p class="card-text" ><c:out value="${ad.description}" /></p>
                            <div class="card-footer row" style="width: 20rem;">
                                <div class="justify-content-between">
                                    <p class="mr-auto">Category: <c:out value="${ad.category}"/></p>
                                    <div class="row justify-content-around">
                                        <form  action="/ads/edit">
                                            <input class="btn btn-info btn-sm" type="submit" name="id" value="${ad.id}" placeholder="Edit Ad">
                                        </form>
                                        <form  action="/ads/delete" method="POST">
                                                <%--      put a hidden input type ="hidden" send over value with
                                                          whole ad Object--%>
                                            <button class="btn btn-info btn-sm" > Delete Ad</button>
                                            <input type="hidden" name="id" value="${ad.id}">
                                        </form>
                                        <form action="/ads/view">
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
            </c:if>
        </c:forEach>
    </div>


</div>

</body>
</html>