<%@ page import="com.korea.dto.BoardDTO" %>
<%@ page import="java.util.Objects" %>
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
<div class="container-md" id="wrapper" style="margin:100px auto;">
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
                <li class="breadcrumb-item"><a href="#">자유게시판</a></li>
                <li class="breadcrumb-item active" aria-current="page">글내용</li>
            </ol>
        </nav>
    </div>
    <h1>글내용</h1>
    <%
        BoardDTO dto = (BoardDTO) request.getAttribute("dto");
        String nowPage = (String) request.getAttribute("nowPage");
        String[] filelist = dto.getFilename().split(";");
        String[] filesize = dto.getFilesize().split(";");
    %>
    <form action="" method="post" enctype="multipart/form-data">
        <input name="title" class="form-control mb-3 w-50" value="<%=dto.getTitle()%>">
        <input name="writer" class="form-control mb-3 w-50" value="<%=dto.getWriter()%>">
        <textarea name="content" class="form-control mb-3 w-50"
                  style="height: 350px; resize: none;"><%=dto.getContent()%></textarea>
        <input type="submit" value="글수정" class="btn btn-secondary">
        <a href="#" class="btn btn-secondary">리스트</a>
        <a href="#" class="btn btn-secondary">글삭제</a>
        <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
            첨부파일 보기
        </button>
    </form>
    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">첨부파일 리스트</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <%
                        if(!Objects.equals(filelist[0], "0"))
                        {
                            for(int i = 0; i < filelist.length; i++)
                            {
                                out.println("<a href='#'>" + filelist[i] + "(" + filesize[i] + " byte)</a><br>");
                            }
                        }
                        else
                        {
                            out.println("파일없음");
                        }
                    %>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">모두 받기</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%--Footer--%>
</body>
</html>
