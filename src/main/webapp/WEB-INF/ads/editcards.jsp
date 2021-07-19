<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit your Ad"/>
    </jsp:include>
</head>
<body style="height: 100%;background-position:center;background-size:cover;background-image: url(https://i.pinimg.com/originals/08/1f/8c/081f8cd08585e1040a8393c25b274126.gif) ">
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="rounded mx-auto " style=" margin-top: 3em; background-color: deepskyblue; width: 60%">
    <h1 style="text-align: center">Edit ad listing</h1>
    <form class="p-3" action="/ads/edit" method="post">
        <input type="hidden" name="id" value="${ad.id}">
        <div class="form-group ">
            <h2><label for="title">Title:</label></h2>
            <input id="title" type="text" name="title" class="form-control" placeholder="${ad.title}">
        </div>
        <div class="form-group">
            <h2><label for="description"> Description: </label></h2>
            <textarea id="description" name="description" class="form-control" placeholder="${ad.description}"></textarea>
        </div>
        <input type="submit" class="btn btn-info btn-block" value="Submit Changes">

    </form>
</div>
</body>
</html>