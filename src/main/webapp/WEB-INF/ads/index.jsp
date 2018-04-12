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
    <h1>Here Are all the ads!</h1>

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
