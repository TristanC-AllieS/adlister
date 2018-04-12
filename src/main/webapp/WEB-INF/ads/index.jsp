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

    <h1>Here Are all the ads!</h1>

    <form role="search" action="/ads" class="form-inline my-2 my-lg-0">
        <input id="search" name="search" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-dark my-2 my-sm-0" type="submit">Find Ads</button>
    </form>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>${ad.getTitle()}</h2>
            <p>${ad.getDescription()}</p>
            <ul>
            <c:forEach var="c" items="${categoryDao.getCategoriesWithAd(ad.getId())}">
                <li>${c.getName()}</li>
            </c:forEach>
            </ul>
        </div>
    </c:forEach>
</div>

<jsp:include page="/WEB-INF/partials/categories.jsp" />
</body>
</html>
