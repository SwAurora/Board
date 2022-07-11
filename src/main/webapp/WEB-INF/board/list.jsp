<%@ page import="com.korea.dto.BoardDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/resources/includes/link.jsp" %>
    <link rel="stylesheet" href="/resources/css/common.css">
</head>
<body>
<div class="container-md" id="wrapper" style="width:80%; margin:100px auto;">
    <%--TopMenu--%>
    <%@ include file="/resources/includes/topmenu.jsp" %>
    <%--NAV--%>
    <%@ include file="/resources/includes/nav.jsp" %>
    <%--MainContents--%>
    <div id="maincontents" style="margin-top: 15px;">
        <%--Path--%>
        <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">자유게시판</li>
            </ol>
        </nav>
        <h1>자유게시판</h1>

        <%--현재페이지 / 전체페이지--%>
        <table class="table">
            <tr>
                <td style="border:0;">1/100 Page</td>
                <td style="border:0; text-align: right;">
                    <button class="btn btn-secondary">처음으로</button>
                    <button class="btn btn-primary">글쓰기</button>
                </td>
            </tr>
        </table>
        <table class="table">
            <tr>
                <th>NO</th>
                <th>TITLE</th>
                <th>WRITER</th>
                <th>DATE</th>
                <th>COUNT</th>
            </tr>
            <%
                ArrayList<BoardDTO> list = (ArrayList<BoardDTO>) request.getAttribute("list");
                for(BoardDTO boardDTO : list)
                {
            %>
            <tr>
                <td><%=boardDTO.getNo()%></td>
                <td><%=boardDTO.getTitle()%></td>
                <td><%=boardDTO.getWriter()%></td>
                <td><%=boardDTO.getRegdate()%></td>
                <td><%=boardDTO.getCount()%></td>
            </tr>
            <%
                }
            %>
            <tr>
                <td>1</td>
                <td>글제목1</td>
                <td>작성자1</td>
                <td>2022-07-11</td>
                <td>1</td>
            </tr>
            <tr>
                <%--페이지네이션--%>
                <td colspan="5" style="border-bottom: 0;">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </td>
            </tr>
        </table>
        <a href="/Board/post.do">글쓰기</a>
    </div>
    <%--Footer--%>
</div>
</body>
</html>
