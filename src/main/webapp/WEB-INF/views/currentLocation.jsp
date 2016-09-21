<%--
  Created by IntelliJ IDEA.
  User: philip
  Date: 2015-12-15
  Time: 오후 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>현재 위치 정보 얻기 beta</title>
</head>

<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<script>

    $(document).ready(function() {

    });

    function getLocation(){
        if (navigator.geolocation){
            navigator.geolocation.getCurrentPosition(showPosition,showError);
        }else{
            $("#locationStatus").text("Geolocation is not supported by this browser.");
        }
    }
    function showPosition(position){
        $("#latitude").val(position.coords.latitude);
        $("#longitude").val(position.coords.longitude);
    }

    function showError(error){
        switch(error.code){
            case error.PERMISSION_DENIED:
                $("#locationStatus").text("User denied the request for Geolocation.");//사용자가 위치정보에 대한 요청을 거부했을 때.
                break;
            case error.POSITION_UNAVAILABLE:
                $("#locationStatus").text("Location information is unavailable."); //위치정보 사용이 불가능할 때(주로 PC에서 볼 때)
                break;
            case error.TIMEOUT:
                $("#locationStatus").text("The request to get user location timed out.");//시간초과
                break;
            case error.UNKNOWN_ERROR:
                $("#locationStatus").text("An unknown error occurred.");//알 수 없는 에러
                break;
        }
    }

    function defaultValue(){
        $("#latitude").val("");
        $("#longitude").val("");
        $("#truckStatus").val("");
        $("#startDate").val("");
        $("#endDate").val("");
    }

    function sendLocationInfo(){
        if( !isNull($("#latitude").val()) && !isNull($("#longitude").val()) ){
            $.post( "/procLocation", $("#form").serialize())
             .done(function(data){
                alert("저장 완료");
                 var url ="/";
                 $(location).attr('href',url);
              })
             .fail(function(){
                 alert("error 관리자에게 문의 하세요.");
             })
        }else{
            alert("위치 정보 가져오기 버튼을 눌러 주세요.");
        }
    }

</script>


<html>
<body>

1. 아래 버튼을 누르면 현재 위도, 경도 값을 가져 오게 됩니다.<br>
<button type="button" onclick="getLocation()">나의 위치 정보 가져오기</button>

<p id="locationStatus"></p>
<form id="form" name="form" method="post" onsubmit="return false;">
    <br>위도 : <input type="text" id="latitude" name="latitude" size="20">
    <br>경도 : <input type="text" id="longitude" name="longitude" size="20">

    <br>
    <br>
    2. 트럭의 상태를 선택 하세요.
    <br>
    트럭 상태 선택 :
    <select name ="status" id="truckStatus">
        <option value="">선택</option>
        <option value="오픈 준비중">준비중</option>
        <option value="절찬 영업중">절찬 영업중</option>
        <option value="종료">종료</option>
    </select>

    <br>
    <br>
    3. 영업 시간 입력
    <br>
    영업 시간(나중에 시간 선택 할 수 있게 변경 예정)
    <p>시작 : <input type="text" name="startDate" id="startDate" placeholder="ex) 20:00">  종료 : <input type="text" name="endDate" id="endDate" placeholder="ex) 24:00"></p>


</form>

4. 모든 값 입력 후 전송 하기 버튼을 누르면 저장 됩니다.
<br><br><button type="button" onclick="sendLocationInfo()">전송</button>

</body>
</html>