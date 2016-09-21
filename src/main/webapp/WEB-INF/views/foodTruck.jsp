<%--
  Created by IntelliJ IDEA.
  User: philip
  Date: 2015-12-15
  Time: 오후 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>푸드 트럭 위치 정보 beta</title>

</head>

<link rel="stylesheet" href="/static/css/truck.css" />
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=cd58f70ff6ed64d060401f079ccf2b8b"></script>

<div id="map" style="width:100%;height:100%;"></div>
<script>
    var mapContainer = document.getElementById('map'), // 지도의 중심좌표
            mapOption = {
                center: new daum.maps.LatLng(${foodTruck.latitude}, ${foodTruck.longitude}), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

    var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 지도에 마커를 표시합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: new daum.maps.LatLng(${foodTruck.latitude}, ${foodTruck.longitude})
    });

    // 커스텀 오버레이에 표시할 컨텐츠 입니다
    // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
    // 별도의 이벤트 메소드를 제공하지 않습니다
    var content = '<div class="wrap">' +
            '    <div class="info">' +
            '        <div class="title">' +
            '            솔소리 푸드 트럭(튀김전문)' +
            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
            '        </div>' +
            '        <div class="body">' +
            '            <div class="img">' +
            '                <img src="/static/images/logo.png" width="73" height="70">' +
            '           </div>' +
            '            <div class="desc">' +
            '                <div class="desc2">영업 상태 : ${foodTruck.status} </div>' +
            '                <div class="desc1 desc2">전화번호 : ${foodTruck.telephoneNumber} </div>' +
            '                <div class="desc1 desc2">운영시간 : ${foodTruck.startDate} ~ ${foodTruck.endDate}</div>' +
            '            </div>' +
            '            <div>' +
            '               <table>' +
            '                   <tr>' +
            '                       <th>메뉴</th>' +
            '                       <th>가격</th>' +
            '                   </tr>' +
            '                   <tr>' +
            '                       <td>순살 치킨(닭강정)</td>' +
            '                       <td>(오리지널/허니갈릭) 中/8,000원   大/12,000원</td>' +
            '                   </tr>' +
            '                   <tr>' +
            '                       <td>안심스틱(4개)</td>' +
            '                       <td>3,000원</td>' +
            '                   </tr>' +
            '                   <tr>' +
            '                       <td>왕새우 튀김(개당)</td>' +
            '                       <td>1,500원</td>' +
            '                   </tr>' +
            '                   <tr>' +
            '                       <td>춘권(개당)</td>' +
            '                       <td>(고구마/피자) 1,500원</td>' +
            '                   </tr>' +
            '                   <tr>' +
            '                       <td>오뎅(개당)</td>' +
            '                       <td>500원</td>' +
            '                   </tr>' +
            '               </table>' +
            '            </div>' +
            '        </div>' +
            '    </div>' +
            '</div>';

    // 마커 위에 커스텀오버레이를 표시합니다
    // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
    var overlay = new daum.maps.CustomOverlay({
        content: content,
        map: map,
        position: marker.getPosition()
    });

    // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
    daum.maps.event.addListener(marker, 'click', function() {
        overlay.setMap(map);
    });

    // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다
    function closeOverlay() {
        overlay.setMap(null);
    }
</script>


<body>




</body>
</html>
