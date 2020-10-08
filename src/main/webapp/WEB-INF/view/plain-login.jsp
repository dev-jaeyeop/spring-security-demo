<%--
  Created by IntelliJ IDEA.
  User: Jaeyeop
  Date: 10/8/2020
  Time: 8:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        .failed {
            color: red;
        }
    </style>
</head>
<body>

<h3>My Custom Login Page</h3>

<form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="POST">

    <!-- Check for login error -->
    <c:if test="${param.containsKey('error')}">
        <i class="failed">Sorry! You entered invalid username/password.</i>
    </c:if>

    <p>User name: <input type="text" name="username"></p>

    <p>Password: <input type="password" name="password"></p>

    <p><input type="submit" value="Login"></p>

</form:form>
</body>
</html>
