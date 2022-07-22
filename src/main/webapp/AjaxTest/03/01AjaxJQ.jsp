<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Ajax XMLHttpRequest</title>
    <!-- JQ -->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<script>
    function sendRequest(URL, TAG)
    {
        $.ajax
        ({
            url: URL, // 요청 URL
            type:"GET",  // 요청 Method
            dataType:"html", // html(기본), XML , JSON 설정
            // timeout:1000, // 시간 설정
            // data:{"param":"value"}, // 파라미터
            error:function(request, status, error)
            {
                alert("code : " + request.status + "\nstatus : " + status + "\nerror : " + error);
            },
            success:function(result)
            {
                alert("성공!\n" + result);
                $("#" + TAG).html(result);
            }
        });
    }
</script>
<h1>XMLHttpRequest 테스트</h1>
<style>
    div
    {
        margin: 50px;
        width: 1000px;
        height: 400px;
        overflow: auto;
    }
</style>
<div>
    <button onclick="sendRequest('page1.jsp', 'test1')">버튼</button>
    <p id="test1"></p>
</div>
<div>
    <button onclick="sendRequest('page2.jsp', 'test2')">버튼</button>
    <p id="test2"></p>
</div>
</body>
</html>