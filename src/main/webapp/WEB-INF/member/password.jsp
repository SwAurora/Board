<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/resources/includes/link.jsp" %>
    <link rel="stylesheet" href="/resources/css/common.css">
</head>
<body>
<%
    String MSG = (String) request.getAttribute("MSG");
    if(MSG != null)
    {
%>
<script>
    alert("<%=MSG%>");
</script>
<%
    }
%>
<div class="container-md" id="wrapper" style="width:80%; margin:100px auto;">
    <%--TopMenu--%>
    <%@ include file="/resources/includes/topmenu.jsp" %>
    <%--NAV--%>
    <%@ include file="/resources/includes/nav.jsp" %>
    <%--MainContents--%>
    <div id="maincontents" style="border: 1px solid gray; margin-top: 15px;">
        <h1>비밀번호 확인</h1>
        <form action="/MemberUpdate.do" method="post">
            <table class="table w-75 table-striped" style="margin:100px auto;">
                <tr>
                    <td><input type="password" name="pwd" class="form-control w-50"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="확인" class="btn btn-primary"></td>
                </tr>
            </table>
            <input type="hidden" name="flag" value="true">
            <input type="hidden" name="addr1" value="<%=request.getParameter("addr1")%>">
            <input type="hidden" name="addr2" value="<%=request.getParameter("addr2")%>">
            <input type="hidden" name="newpwd" value="<%=request.getParameter("newpwd")%>">
        </form>
    </div>
    <%--Footer--%>
</div>
</body>
</html>
