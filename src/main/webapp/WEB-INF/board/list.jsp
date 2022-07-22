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
<%
    String msg = (String) request.getAttribute("MSG");
    if(msg != null)
    {
%>
<script>
    alert('<%=msg%>');
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
    <div id="maincontents" style="margin-top: 15px;">
        <%--Path--%>
        <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">자유게시판</li>
            </ol>
        </nav>
        <h1>자유게시판</h1>
        <%
            int totalcount = 0; // 전체 게시물 수
            int numPerPage = 10; // 페이지당 표시할 게시물 수

            int totalPage = 0; // 전체 페이지 수
            int nowPage = 1; // 현재 페이지 번호

            int start = 0; // 게시물 읽을 때 사용되는 시작 값
            int end = 10; // 게시물 읽을 때 사용되는 끝 값

            int pagePerBlock = 15; // 블럭당 표시할 페이지 수
            int totalBlock = 0; // 전체 페이징 블럭 수
            int nowBlock = 1; // 현재 페이징 블럭 수
        %>

        <%
            if(request.getParameter("nowPage") != null)
            {
                nowPage = Integer.parseInt(request.getParameter("nowPage"));

                start = 0;
                end = 0;
            }
        %>

        <%
            totalcount = (int) request.getAttribute("tcnt"); // 전체 게시물 수 받기
            totalPage = (int) Math.ceil(totalcount / numPerPage); // 전체 페이지 수 계산

            totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock); // 전체 블럭수 계산
            nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock); // 현재 블럭수 계산
        %>

        <script>
            // 페이징 처리함수 - 페이지 번호를 받아 해당 페이지를 표시
            function paging(pageNum)
            {
                let form = document.readFrm;
                form.nowPage.value = pageNum;
                numPerPage = <%=numPerPage%>;
                form.start.value = (pageNum * numPerPage) - numPerPage;
                form.end.value = (pageNum * numPerPage);
                form.action = "/Board/list.do";
                form.submit();
            }

            // 블럭처리 함수 - 이전/이후 버튼 누를 때 이전블럭/다음블럭으로 이동
            function block(value)
            {
                let form = document.readFrm;
                StartPage =
                <%=pagePerBlock%> *
                (value - 1) + 1;
                numPerPage = <%=numPerPage%>;
                form.nowPage.value = StartPage;
                form.start.value = (StartPage * numPerPage) - numPerPage + 1;
                form.end.value = (StartPage * numPerPage);
                form.action = "/Board/list.do";
                form.submit();
            }

            // 처음으로 이동 처리
            function init()
            {
                let form = document.initFrm;
                form.nowPage.value = 1;
                form.action = "/Board/list.do";
                form.submit();
            }

            function read(no)
            {
                let form = document.readFrm;
                form.no.value = no;
                form.nowPage.value = <%=nowPage%>;
                form.action = "/Board/read.do";
                form.submit();
            }
        </script>

        <form name="initFrm" method="get">
            <input type="hidden" name="nowPage">
        </form>

        <%--페이징 처리 폼--%>
        <form name="readFrm" method="get">
            <input type="hidden" name="no"> <%--게시물번호--%>
            <input type="hidden" name="start"> <%--DB로 부터 읽을 시작 번호--%>
            <input type="hidden" name="end"> <%--DB로 부터 읽을 끝 번호--%>
            <input type="hidden" name="nowPage"> <%--현재 페이지 번호--%>
            <input type="hidden" name="init" value="true"> <%--현재 페이지 번호--%>
        </form>

        <%--현재페이지 / 전체페이지--%>
        <table class="table">
            <tr>
                <td style="border:0;"><span style="color: dodgerblue"><%=nowPage%></span>/<%=totalPage%> Page</td>
                <td style="border:0; text-align: right;">
                    <button class="btn btn-secondary" onclick="init()">처음으로</button>
                    <a class="btn btn-primary" href="/Board/post.do">글쓰기</a>
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
                <td><%=boardDTO.getNo()%>
                </td>
                <td><a href="javascript:read(<%=boardDTO.getNo()%>)"><%=boardDTO.getTitle()%>
                </a>
                </td>
                <td><%=boardDTO.getWriter()%>
                </td>
                <td><%=boardDTO.getRegdate()%>
                </td>
                <td><%=boardDTO.getCount()%>
                </td>
            </tr>
            <%
                }
            %>
            <tr>
                <%--페이지네이션--%>
                <td colspan="5" style="border-bottom: 0;">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <%--이전으로--%>
                            <%
                                if(nowBlock > 1)
                                {
                            %>
                            <li class="page-item">
                                <a class="page-link" href="javascript:block(<%=nowBlock-1%>)" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <%
                                }
                            %>

                            <%
                                int pageStart = (nowBlock - 1) * pagePerBlock + 1;
                                int pageEnd = ((pageStart + (pagePerBlock - 1)) < totalPage) ? (pageStart + (pagePerBlock - 1)) : totalPage;
                            %>
                            <%--페이지 번호--%>
                            <%
                                for(; pageStart <= pageEnd; pageStart++)
                                {
                                    if(pageStart == nowPage)
                                    {
                            %>
                            <li class="page-item active"><a class="page-link"
                                                            href="javascript:paging(<%=pageStart%>)"><%=pageStart%>
                            </a></li>
                            <%
                            }
                            else
                            {
                            %>
                            <li class="page-item"><a class="page-link"
                                                     href="javascript:paging(<%=pageStart%>)"><%=pageStart%>
                            </a></li>
                            <%
                                    }
                                }
                            %>
                            <%--다음으로--%>
                            <%
                                if(totalBlock > nowBlock)
                                {
                            %>
                            <li class="page-item">
                                <a class="page-link" href="javascript:block(<%=nowBlock+1%>)" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </nav>
                </td>
            </tr>
        </table>
    </div>
    <%--Footer--%>
</div>
</body>
</html>
