<%@ page import="com.korea.dao.BoardDAO" %>
<%@ page import="com.korea.dto.BoardDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    BoardDAO dao = BoardDAO.getInstance();
    List<BoardDTO> list = dao.Select(0, 10);
    for(BoardDTO dto : list)
    {
        out.println(dto.getNo() + " ");
        out.println(dto.getTitle() + " ");
        out.println(dto.getContent() + " ");
        out.println(dto.getWriter() + "<br>");
    }
%>
</body>
</html>