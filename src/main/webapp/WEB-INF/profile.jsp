<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <h1>Welcome, ${sessionScope.user.username}!</h1>

    <a href="/ads/create" class="btn btn-primary">Create Ad</a>

    <a href="/profile/update" class="btn btn-primary">Update Profile</a>

    <h3>Your current ads:</h3>
    <c:forEach var="ad" items="${sessionScope.userAds}">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h2 class="card-title">${ad.getTitle()}</h2>
                    <p class="card-text">${ad.getDescription()}</p>
                </div>
            </div>
        </div>
    </c:forEach>

</div>

</body>
</html>