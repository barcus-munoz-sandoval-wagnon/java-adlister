<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://kit.fontawesome.com/d0d640b552.js" crossorigin="anonymous"></script>
<nav class="navbar navbar-default" style="background-size: cover; background-repeat: no-repeat;background-image: url(../img/adoptapet.jpg)">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <%--LOGO directing to ads page (change it to home page) -K --%>
            <img src="../img/CorgiGif.gif" alt="CorgiLogo">
            <a class="navbar-brand" href="/ads">adLister <i class="fas fa-ad"></i></a>
        </div>
        <div>
            <ul class="nav navbar-nav navbar-right">
                <%--                <li>--%>
                <%--                         for visitor/user view  add a dropdown list w/ categories -K--%>
                <%--                </li>--%>
                <li>
                    <%--      for visitor/user view   add a search bar for searching through ads--%>
                    <%--      need help centering search bar + adding dropdown              --%>
<%--                    <form action="/search" class="form-inline" method="POST">--%>
<%--                        <input id="s" name="s" class="form-control" type="search" placeholder="Search Ads Here!"--%>
<%--                               aria-label="Search">--%>
<%--                        <button class="btn btn-outline-success" type="submit"><i class="fas fa-search"></i></button>--%>
<%--                    </form>--%>
                        <form action="/search" method="post" style="float:left; margin-top: 1em;">
                            <input type="text" name="query" placeholder="Ad Search" />
                            <button>Go!</button>
                        </form>
                </li>
                <%--        IF USER profile, logout, create ad links -K--%>
                <%--        IF VISITOR login & register links -K--%>
                <c:choose>
                    <c:when test="${sessionScope['user'] != null}">
                        <form class action="/profile" >
                            <input type="hidden" name="username" value="${user.username}">
                            <input type="submit" class="btn" value="View Profile">
                        </form>
                        <a type="button" class="btn btn-info" style="float:left; margin-top: 1em;" href="${pageContext.request.contextPath}/logout">Logout</a>
                        <a type="button" class="btn btn-info" style="float:left; margin-top: 1em;" href="${pageContext.request.contextPath}/ads/create">Create Ads</a>
                    </c:when>
                    <c:otherwise>
                        <a type="button" class="btn btn-info" style="float:left; margin-top: 1em;"  href="${pageContext.request.contextPath}/login">Login</a>
                        <a type="button" class="btn btn-info" style="float:left; margin-top: 1em;"  href="${pageContext.request.contextPath}/register">Register</a>
                    </c:otherwise>
                </c:choose>

            </ul>
        </div>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->

</nav>