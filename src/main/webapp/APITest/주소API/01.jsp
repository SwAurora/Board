<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/resources/includes/link.jsp" %>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

<form class="row g-3">
    <div class="col-md-6">
        <label for="inputEmail4" class="form-label">Email</label>
        <input type="email" class="form-control" id="inputEmail4">
    </div>
    <div class="col-md-6">
        <label for="inputPassword4" class="form-label">Password</label>
        <input type="password" class="form-control" id="inputPassword4">
    </div>
    <div class="col-12">
        <label for="inputAddress" class="form-label">Address</label>
        <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
    </div>
    <div class="col-12">
        <label for="inputAddress2" class="form-label">Address 2</label>
        <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
    </div>
    <div class="col-md-4">
        <a href="javascript:test()" class="btn btn-primary">우편번호찾기</a>
    </div>
    <div class="col-md-4">
        <input type="text" class="form-control" id="inputZip" placeholder="ZIPCode">
    </div>
    <div class="col-12">
        <div class="form-check">
            <input class="form-check-input" type="checkbox" id="gridCheck">
            <label class="form-check-label" for="gridCheck">
                Check me out
            </label>
        </div>
    </div>
    <div class="col-12">
        <button type="submit" class="btn btn-primary">Sign in</button>
    </div>
</form>

<script>
    function test()
    {
        let addr1 = document.getElementById("inputAddress");
        let zipcode = document.getElementById("inputZip");
        new daum.Postcode({
            oncomplete: function(data)
            {
                if(data.userSelectedType === 'R')
                {
                    addr1.value = data.roadAddress;
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
