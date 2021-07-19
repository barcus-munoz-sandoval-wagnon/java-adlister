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

  <h1>Welcome, ${user.username}!</h1>

  <form class="form-group" action="/profile/edit" method="post">
    <div>
      <label for="username">Username: </label>
      <input id="username" name="username" class="form-control" type="text" placeholder="${user.username}">
    </div>
    <div>
      <label for="email">Email: </label>
      <input id="email" name="email" class="form-control" type="text" placeholder="${user.email}">
    </div>
    <div>
          <input type="hidden" name="userId" value="${user.id}">
    </div>

    <button type="submit" class="btn btn-primary btn-block">Save Changes</button>
  </form>




</div>

</body>
</html>