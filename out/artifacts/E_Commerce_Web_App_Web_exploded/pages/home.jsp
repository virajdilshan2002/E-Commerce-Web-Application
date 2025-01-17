<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HOME</title>
</head>
<body>
<%
    String message = request.getParameter("message");
    String username = request.getParameter("username");

    if (message != null && username != null) {
%>
<h1><%=message%> <br> Welcome <%=username%>!</h1>
<%
    }
%>

</body>
</html>
