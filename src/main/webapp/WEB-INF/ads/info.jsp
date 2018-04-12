<%--
  Created by IntelliJ IDEA.
  User: tristan
  Date: 4/11/18
  Time: 12:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="${ad.getTitle()}" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container">
    <h1>${ad.getTitle()}</h1>
    <p>${ad.getDescription()}</p>
</div>
</body>
</html>
