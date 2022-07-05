<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <%@include file="resources/includes/link.jsp"%>
    <link rel="stylesheet" href="resources/css/common.css">
</head>
<body>
<div class="container-md" style="width:400px; height:400px; margin:200px auto;">
    <div class="row m-3" id="logo">
        <div class="col" style="text-align: center">
            <span style="font-size: 2.5rem">LOGIN</span>
        </div>
    </div>
    <div class="row m-3">
        <input type="text" name="userid" class="form-control" placeholder="아이디를 입력하세요">
    </div>
    <div class="row m-3">
        <input type="password" name="pwd" class="form-control" placeholder="패스워드를 입력하세요">
    </div>
    <div class="row m-3">
        <input type="submit" value="로그인" class="btn btn-primary">
    </div>
    <div class="row m-3">
        <a href="/MemberJoin.do" class="btn btn-primary">회원가입</a>
    </div>
</div>
</body>
</html>
