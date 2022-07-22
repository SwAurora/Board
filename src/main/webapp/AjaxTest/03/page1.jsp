<%@ page import="com.korea.dao.MemberDAO" %>
<%@ page import="com.korea.dto.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    MemberDAO dao = MemberDAO.getInstance();
    MemberDTO dto = dao.Select("aaaaa@naver.com");
%>
email : <%=dto.getEmail()%><br>
addr1 : <%=dto.getAddr1()%><br>
addr2 : <%=dto.getAddr2()%><br>
</body>
</html>
