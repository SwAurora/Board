<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--
Multipart
클라이언트에서 서버로 페이지 요청시 업로드 파일을 포함하는 경우에
Post방식으로 body에 파일들을 나누어서 처리해야함
이 때 여러 request에 나눠진 body들이 서버로 전달되기 위해서
multipart/form-data 옵션을 적용함
--%>
<form action="/upload3" method="post" enctype="multipart/form-data">
  Upload's file : <input type="file" name="test" multiple>
  <input type="submit" value="upload">
</form>
</body>
</html>
