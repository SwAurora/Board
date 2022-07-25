<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <%@ include file="/resources/includes/link.jsp" %>
    <link rel="stylesheet" href="/resources/css/common.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
        <div class="row">
            <div class="col-md-3 ms-2">
                <input type="text" id="zipcode" name="zipcode" placeholder="zipcode" class="form-control">
            </div>
            <div class="col-md-4">
                <a href="javascript:enterAddr()" class="btn btn-primary">우편번호 검색</a>
            </div>
        </div>
        <input name="addr1" id ="addr1" placeholder="Enter Address1" class="form-control m-2">
        <input name="addr2" placeholder="Enter Address2" class="form-control m-2">
        <input type="submit" class="btn btn-primary w-50 m-2" value="가입">
        <input type="reset" value="초기화" class="btn btn-primary w-50 m-2">
        <a href="/index.do" class="btn btn-primary w-50 m-2">이전</a>
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

    function enterAddr()
    {
        let addr1 = document.getElementById("addr1");
        let zipcode = document.getElementById("zipcode");
        new daum.Postcode({
            oncomplete: function(data)
            {
                if(data.userSelectedType === 'R')
                {
                    addr1.value = data.roadAddress + " (" + data.buildingName + ")";
                }
                else
                {
                    addr1.value = data.jibunAddress;
                }
                zipcode.value = data.zonecode;
            }
        }).open();
    }
</script>
</body>
</html>
