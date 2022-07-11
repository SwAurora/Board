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
    <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item active" aria-current="page">공지사항</li>
      </ol>
    </nav>
    <h1>공지사항</h1>
    <a href="/Notice/post.do">글쓰기</a>
  </div>
  <%--Footer--%>
</div>
</body>
</html>
