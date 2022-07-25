<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<script>
    let addr;

    /*주소 API*/
    function test()
    {
        new daum.Postcode({
            oncomplete: function(data)
            {
                if(data.userSelectedType === 'R')
                {
                    addr = data.roadAddress;
                    test2();
                }
                else
                {
                    addr = data.jibunAddress;
                    test2();
                }
            }
        }).open();
    }
</script>
<a href="javascript:test()"
   style="width:80px;height:40px;line-height:40px;display:inline-block;text-align:center;color:#fff;background-color: dodgerblue;border-radius: 5px; text-decoration: none;">위치
    찾기</a>
<div id="map" style="width:500px;height:500px; margin-top: 20px;"></div>

<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=872e184b5a607e8396fb6def955628d1&libraries=services"></script>
<script>
    function test2()
    {
        let mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        // 지도를 생성합니다
        let map = new kakao.maps.Map(mapContainer, mapOption);

        // 주소-좌표 변환 객체를 생성합니다
        let geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색합니다
        geocoder.addressSearch(addr, function(result, status)
        {

            // 정상적으로 검색이 완료됐으면
            if(status === kakao.maps.services.Status.OK)
            {

                let coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                let marker = new kakao.maps.Marker({
                    map: map, position: coords
                });

                // 인포윈도우로 장소에 대한 설명을 표시합니다
                let infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">위치</div>'
                });
                infowindow.open(map, marker);

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            }
        });
    }
</script>
</body>
</html>