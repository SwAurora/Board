<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <%@ include file="/resources/includes/link.jsp" %>
    <link rel="stylesheet" href="/resources/css/common.css">
</head>
<body>
<%
    String msg = request.getParameter("msg");
    if(msg != null)
    {
%>
<script>
    alert("<%=msg%>");
</script>
<%
    }
%>
<div class="container-md" style="width:50%; margin:170px auto; text-align: center;">
    <h1 class="mb-4">회원가입</h1>
    <form action="/MemberJoin.do" method="post" onsubmit="return check()">
        <input type="email" name="email" placeholder="example@example.com" class="form-control m-2">
        <input type="password" name="pwd" placeholder="Enter Password" class="form-control m-2">
        <input name="addr1" placeholder="Enter Address1" class="form-control m-2">
        <input name="addr2" placeholder="Enter Address2" class="form-control m-2">
        <input type="submit" class="btn btn-primary w-50 m-2" value="가입">
        <input type="reset" value="초기화" class="btn btn-primary w-50 m-2">
        <a href="/" class="btn btn-primary w-50 m-2">이전</a>
        <input type="hidden" name="flag" value="true">
    </form>
</div>
<script>
    function check()
    {
        let form = document.forms;
        if(form[0].email.value === "" || form[0].pwd.value === "")
        {
            alert("아이디와 비밀번호는 필수적으로 입력해야합니다.")
            return false;
        }
        return true;
    }
</script>
</body>
</html>
