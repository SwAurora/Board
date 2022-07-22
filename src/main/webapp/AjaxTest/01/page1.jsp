<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String userid = request.getParameter("userid");
%>
<h1>Page1</h1>
USERID = <%=userid%>
</body>
</html>
