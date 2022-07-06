<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/resources/includes/link.jsp" %>
    <link rel="stylesheet" href="/resources/css/common.css">
</head>
<body>
<%
    String email = (String) request.getAttribute("email");
    String addr1 = (String) request.getAttribute("addr1");
    String addr2 = (String) request.getAttribute("addr2");
%>
<div class="container-md" id="wrapper" style="width:80%; margin:100px auto;">
    <%--TopMenu--%>
    <%@ include file="/resources/includes/topmenu.jsp" %>
    <%--NAV--%>
    <%@ include file="/resources/includes/nav.jsp" %>
    <%--MainContents--%>
    <div id="maincontents" style="border: 1px solid gray; margin-top: 15px;">
        <h1>회원 정보</h1>
        <table class="table w-75 table-striped" style="margin:100px auto;">
            <tr>
                <td>Email</td>
                <td><%=email%>
                </td>
            </tr>
            <tr>
                <td>Addr1</td>
                <td><%=addr1%>
                </td>
            </tr>
            <tr>
                <td>Addr2</td>
                <td><%=addr2%>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button class="btn btn-primary w-25">정보 수정</button>
                    <button class="btn btn-secondary w-25">메인 이동</button>
                </td>
            </tr>
        </table>
    </div>
    <%--Footer--%>
</div>
</body>
</html>
