<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="resources/includes/link.jsp" %>
    <link rel="stylesheet" href="resources/css/common.css">
</head>
<body>
<%
    String msg = request.getParameter("MSG");
    if(msg != null)
    {
%>
<script>
    alert("<%=msg%>");
</script>
<%
    }
%>
<div class="container-md" id="wrapper" style="width:80%; margin:100px auto;">
    <%--TopMenu--%>
    <%@ include file="resources/includes/topmenu.jsp" %>
    <%--NAV--%>
    <%@ include file="resources/includes/nav.jsp" %>
    <%--MainContents--%>
    <div id="maincontents" style="border: 1px solid gray; margin-top: 15px;">

    </div>
    <%--Footer--%>
</div>
</body>
</html>
