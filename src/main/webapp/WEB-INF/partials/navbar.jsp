<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://kit.fontawesome.com/d0d640b552.js" crossorigin="anonymous"></script>
<nav class="navbar navbar-default navbar-dark " style="height:100px;background-position:center;background-size:cover; background-repeat: no-repeat;background-image: url(https://www.metoffice.gov.uk/binaries/content/gallery/metofficegovuk/hero-images/weather/cloud/cumulus-cloud.jpg) ">
    <div class="container-fluid">

        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header" >
            <h2><a class="navbar-brand" style="color: black; font-size:40; float: right" href="/ads">AdoptionLister<i class="fas fa-ad"></i></a></h2>
            <%--LOGO directing to ads page (change it to home page) -K --%>
<%--            <img src="https://giphy.com/gifs/Mvi1ZqG17NSso" alt="CorgiLogo">--%>
                <iframe src="https://giphy.com/embed/Mvi1ZqG17NSso" width="150" height="150" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/Mvi1ZqG17NSso">via GIPHY</a></p>

        </div>
        <div>
            <ul class="nav navbar-nav navbar-right">
                        <form class="my-auto row form-inline" action="/search" method="post" style="float:left; margin-top: 1em;">
                            <input class="mr-1" type="text" name="query" placeholder="Adoption search" />
                            <button class="btn btn-info btn-sm ">Go!</button>
                        </form>
                <%--        IF USER profile, logout, create ad links -K--%>
                <%--        IF VISITOR login & register links -K--%>
                <c:choose>
                    <c:when test="${sessionScope['user'] != null}">

                        <div class="row justify-content-between">
                            <form class="" action="/profile" >
                                <input type="hidden" name="username" value="${user.username}">
                                <input class="btn btn-info btn-sm" style=" margin-top: 1em;" type="submit" value="View Profile">
                                <a type="button " class="btn btn-info btn-sm" style="margin-top: 1em;" href="${pageContext.request.contextPath}/logout">Logout</a>
                                <a type="button " class="btn btn-info btn-sm" style="margin-top: 1em;" href="${pageContext.request.contextPath}/ads/create">Create Ads</a>
                            </form>
                        </div>

                    </c:when>
                    <c:otherwise>
                        <div class="row justify-content-start">
                            <a type="button" class="btn btn-info" style=" margin-right: 20px; margin-top: 1em;"  href="${pageContext.request.contextPath}/login">Login</a>
                            <a type="button" class="btn btn-info" style="margin-top: 1em;"  href="${pageContext.request.contextPath}/register">Register</a>
                        </div>

                    </c:otherwise>
                </c:choose>

            </ul>
        </div>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->

</nav>