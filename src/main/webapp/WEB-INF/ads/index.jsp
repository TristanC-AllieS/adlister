<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <jsp:include page="/WEB-INF/partials/messages.jsp"/>

    <div class="row">
    <h1>Ad Directory</h1>

    <form role="search" action="/ads" class="form-inline">
        <input id="search" name="search" class="form-control" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-dark" type="submit">Find Ads</button>
    </form>
    </div>

    <div class="row">
        <c:forEach var="ad" items="${ads}">
            <div class="col-md-6">
                <a href="/ads/${ad.getId()}">${ad.getTitle()}</a>
                <p>${ad.getDescription()}</p>
                <p><em>Posted by ${usersDao.findById(ad.getUserId()).getUsername()}</em></p>
                <ul>
                    <c:forEach var="c" items="${categoriesDao.getCategoriesWithAd(ad.getId())}">
                        <li>${c.getName()}</li>
                    </c:forEach>
                </ul>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
