<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Kakao 지도 시작하기</title>
</head>
<body>
<script>
    let latitude;
    let longitude;
    <%--현재위치 위도 경도 찾기--%>
    navigator.geolocation.getCurrentPosition(function(pos)
    {
        latitude = pos.coords.latitude;
        longitude = pos.coords.longitude;
    })
</script>
<div id="map" style="width:500px;height:400px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=872e184b5a607e8396fb6def955628d1"></script>
<script>
    let container = document.getElementById('map');
    let options = {
        center: new kakao.maps.LatLng(latitude, longitude), level: 3
    };

    let map = new kakao.maps.Map(container, options);
</script>
</body>
</html>