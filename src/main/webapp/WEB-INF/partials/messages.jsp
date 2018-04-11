<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:if test="${not empty error}">
    <div class="panel panel-danger">
        <div class="panel-heading">
            <h3 class="panel-title">Uh oh...</h3>
        </div>
        <div class="panel-body">
            ${error}
        </div>
    </div>
</c:if>

