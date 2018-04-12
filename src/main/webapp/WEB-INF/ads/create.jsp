<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
    <div class="container">
        <h1>Create a new Ad</h1>
        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="title">Title</label>
                <input required id="title" name="title" class="form-control" type="text" value="${stickyTitle}">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea required id="description" name="description" class="form-control">${stickyDescription}</textarea>
            </div>
            <div>
                <h4>Select category: </h4>
                <c:forEach var="category" items="${categories}">
                    <label for="category-${category.getId()}">${category.getName()}</label>
                    <input type="checkbox" name="category" id="category-${category.getId()}" value="${category.getId()}">
                </c:forEach>
            </div>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>

    <%--radio buttons for categories--%>

</body>
</html>
