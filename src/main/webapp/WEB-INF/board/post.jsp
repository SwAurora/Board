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
                <li class="breadcrumb-item active" aria-current="page">글쓰기</li>
            </ol>
        </nav>
    </div>
    <h1>글쓰기</h1>
        <form action="/Board/post.do" method="post" enctype="multipart/form-data">
            <input name="title" class="form-control mb-3 w-50" placeholder="제목">
            <textarea name="content" class="form-control mb-3 w-50" style="height: 350px; resize: none;" placeholder="내용"></textarea>
            <input type="password" name="pwd" class="form-control mb-3 w-50" placeholder="비밀번호">
            <input type="file" name="files" class="form-control mb-3 w-50" multiple/>
            <input type="submit" value="글쓰기" class="btn btn-primary">
            <input type="hidden" name="flag" value="true">
            <a href="#" class="btn btn-secondary">처음으로</a>
        </form>
</div>
<%--Footer--%>
</body>
</html>
