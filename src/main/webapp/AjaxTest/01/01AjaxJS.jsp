<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Ajax XMLHttpRequest</title>
    <script>
        function sendRequest(url, tag)
        {
            let httpRequest;

            function createRequest()
            {
                return new XMLHttpRequest();
            }

            function receiveResponse()
            {
                // XMLHttpRequest 객체의 현재 상태가 요청 완료이고, 서버에 문서가 존재하면 받은 데이터를 출력함.
                if(httpRequest.readyState === XMLHttpRequest.DONE && httpRequest.status === 200)
                {
                    document.getElementById(tag).innerHTML = httpRequest.responseText;
                }
            }

            httpRequest = createRequest(); // XMLHttpRequest 객체를 생성함.
            httpRequest.onreadystatechange = receiveResponse; // XMLHttpRequest 객체의 현재 상태를 파악함.
            // GET 방식의 비동기식 요청으로 Http 요청을 생성함.
            httpRequest.open("GET", url, true);
            httpRequest.send();			// Http 요청을 보냄.
        }
    </script>
</head>
<body>
<h1>XMLHttpRequest 테스트</h1>
<style>
    div
    {
        width: 300px;
        height: 300px;
        border: 1px solid gray;
        margin: 10px;
    }
</style>
<div>
    <button onclick="sendRequest('page1.jsp?userid=Hong', 'test1')">버튼</button>
    <p id="test1"></p>
</div>
<div>
    <button onclick="sendRequest('page2.jsp?userid=Kim', 'test2')">버튼</button>
    <p id="test2"></p>
</div>
</body>
</html>