<%@ page import="java.io.File" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    File dir = new File("C://upload");

    File[] files = dir.listFiles();
    for(File file : Objects.requireNonNull(files))
    {
        out.println("<a href='/download.do?filename=" + file.getName().replaceAll(" ", "+")  + "'>" + file.getName() + "</a><br>");
    }
%>
</body>
</html>
