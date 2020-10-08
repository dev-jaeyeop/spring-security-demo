<%--
  Created by IntelliJ IDEA.
  User: Jaeyeop
  Date: 10/8/2020
  Time: 7:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>Hello Spring</h1>

<hr>
<p>
    hello spring
</p>
<hr>
<p>
    User: <security:authentication property="principal.username"/>
    <br><br>
    Roles (s): <security:authentication property="principal.authorities"/>
</p>
<hr>
<p>
    <security:authorize access="hasRole('MANAGER')">
        <a href="${pageContext.request.contextPath}/leaders">LeaderShip Meeting</a>
        (Only for Manager peeps)
    </security:authorize>
</p>
<p>
    <security:authorize access="hasRole('ADMIN')">
        <a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
        (Only for Admin peeps)
    </security:authorize>
</p>
<hr>
<form:form action="${pageContext.request.contextPath}/logout" method="POST">
    <input type="submit" value="Logout">
</form:form>

</body>
</html>
