<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!"/>
    </jsp:include>
</head>
<body class="" style="height: 100%;background-position:center;background-size:cover;background-image: url(https://i.pinimg.com/originals/08/1f/8c/081f8cd08585e1040a8393c25b274126.gif) ">
<jsp:include page="partials/navbar.jsp"/>
<div class="container mx-auto px-auto" style="; width: 75%">
    <h1 style="text-align: center">Please fill in your information...</h1>
    <%
        if (request.getAttribute("errors") != null) {
    %>
    <fieldset>
        <legend>Ups! We have some errors below!</legend>
        <i class="far fa-sad-cry"></i>
        <ul>
            <%if (request.getAttribute("username_error") != null) {%>
            <li class="error">Please fill out username</li>
            <% } %>
            <%if (request.getAttribute("email_error") != null) {%>
            <li class="error">Please fill out email</li>
            <% } %>
            <%if (request.getAttribute("password_error") != null) {%>
            <li class="error">Please fill out password</li>
            <% } %>
            <%if (request.getAttribute("passwordConfirmation_error") != null) {%>
            <li class="error">Passwords do not match</li>
            <% } %>
        </ul>
    </fieldset>
    <%
        }
    %>
    <form class="rounded p-3 mx-auto" style=" background-color: deepskyblue; width: 60%" action="/register" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <input id="username" name="username" class="form-control" type="text">
        </div>
        <%--below allows me to display the error message from the RegisterServlet that checks for unique usernames--%>
        <c:if test="${sessionScope.registrationError != usernameExists}">
            <div class="alert alert-warning" role="alert"> This username is already in use. Please try a different
                one...
            </div>
        </c:if>
        <div class="form-group">
            <label for="email">Email</label>
            <input id="email" name="email" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input id="password" name="password" class="form-control" type="password">
        </div>
        <div class="form-group">
            <label for="confirm_password">Confirm Password</label>
            <input id="confirm_password" name="confirm_password" class="form-control" type="password">
        </div>
        <input type="submit" class="btn btn-info btn-block" value="Register">
    </form>
</div>
</body>
</html>