<%@ page import="com.korea.dto.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/resources/includes/link.jsp" %>
    <link rel="stylesheet" href="/resources/css/common.css">
</head>
<body>
<%
    MemberDTO dto = (MemberDTO) request.getAttribute("dto");
%>
<div class="container-md" id="wrapper" style="width:80%; margin:100px auto;">
    <%--TopMenu--%>
    <%@ include file="/resources/includes/topmenu.jsp" %>
    <%--NAV--%>
    <%@ include file="/resources/includes/nav.jsp" %>
    <%--MainContents--%>
    <div id="maincontents" style="border: 1px solid gray; margin-top: 15px;">
        <h1>회원 정보</h1>
        <form action="/MemberUpdate.do" method="post">
            <table class="table w-75 table-striped" style="margin:100px auto;">
                <tr>
                    <td>Email</td>
                    <td><input name="email" value="<%=dto.getEmail()%>" disabled>
                    </td>
                </tr>
                <tr>
                    <td>Addr1</td>
                    <td><input name="addr1" value="<%=dto.getAddr1()%>">
                    </td>
                </tr>
                <tr>
                    <td>Addr2</td>
                    <td><input name="addr2" value="<%=dto.getAddr2()%>">
                    </td>
                </tr>
                <tr>
                    <td>PWD</td>
                    <td><input type="password" name="newpwd" value="<%=dto.getPwd()%>"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" class="btn btn-primary w-25" value="정보 수정">
                        <a href="/main.jsp" class="btn btn-secondary w-25">메인 이동</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <%--Footer--%>
</div>
</body>
</html>
