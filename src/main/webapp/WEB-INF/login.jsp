<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In"/>
    </jsp:include>
</head>
<body style="height: 100%;background-position:center;background-size:cover;;background-image: url(https://i.pinimg.com/originals/08/1f/8c/081f8cd08585e1040a8393c25b274126.gif) ">
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container">
    <h1>Please Log In</h1>
    <%
        if (request.getAttribute("errors") != null) {
    %>
    <fieldset>
        <legend>Ups... something is wrong</legend>
        <i class="far fa-meh-rolling-eyes"></i>
        <ul>
            <%if (request.getAttribute("username_error") != null) {%>
            <li class="error">Username error. Please enter a correct username</li>
            <% } %>

            <%if (request.getAttribute("password_error") != null) {%>
            <li class="error">Enter a correct password</li>
            <% } %>
        </ul>
    </fieldset>
    <%
        }
    %>

    <div class="rounded" style="background-color: cyan;">
        <form class="mt-5 p-3" action="/login" method="POST">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>

            <input type="submit" class="btn btn-info btn-block" value="Log In">
        </form>
    </div>

</div>
</body>
</html>