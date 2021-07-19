<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit your Ad"/>
    </jsp:include>
</head>
<body style="height: 100%;background-position:center;background-size:cover;background-image: url(https://i.pinimg.com/originals/08/1f/8c/081f8cd08585e1040a8393c25b274126.gif) ">
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container">
    <form action="/ads/edit" method="post">
        <%--TODO below the name was changed to userID to try to fix a 500 error without success, when trying to edit ads we are still getting the same error --%>
        <input type="hidden" name="adToUpdate" value="${ad.id}">
        <div class="col-md-6 justify-content-center form-group">
            <h1>TODO edit Ads.</h1>

            <label for="title"> Title:</label>
            <input id="title" type="text" name="title" placeholder="${ad.title}">
        </div>
        <div class="form-group">
            <label for="description"> Description: </label>
            <textarea id="description" name="description" placeholder="${ad.description}"></textarea>
            <h3>Categories would go here: </h3>
            <button>Save Changes</button>
        </div>

    </form>

</div>

</body>
</html>