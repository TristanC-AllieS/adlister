<%--
  Created by IntelliJ IDEA.
  User: alyxandriascott
  Date: 4/9/18
  Time: 1:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update your profile"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <h1>Update your profile</h1>
    <div class="alert alert-warning" role="alert">Please only change fields you would like to update</div>

    <form action="/profile/update" method="POST">

        <div class="form-group">
            <label for="username">Change username: </label>
            <input id="username" name="username" class="form-control" type="text"
                   value="${sessionScope.user.getUsername()}">
        </div>

        <div class="form-group">
            <label for="email">Change email: </label>
            <input id="email" name="email" class="form-control" type="email"
                   value="${sessionScope.user.getEmail()}">
        </div>

        <div class="form-group">
            <label for="password">Change password: </label>
            <input id="password" name="password" class="form-control" type="password"
                   placeholder="Must enter new password">
        </div>

        <div class="form-group">
            <label for="password-confirm">Confirm password change: </label>
            <input id="password-confirm" name="password-confirm" class="form-control" type="password"
                   placeholder="Must confirm new password">
        </div>

        <input type="submit" class="btn btn-primary btn-block" value="Update">
    </form>
</div>
</body>
</html>