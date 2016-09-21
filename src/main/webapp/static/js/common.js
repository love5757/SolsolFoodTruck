/**
 * Created by philip on 2015-12-16.
 */
/**
 * Input 전화번호 자동 하이픈("-") 표시
 * @param str
 * @returns {*}
 */
function autoHypenCompanyNum(str){
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';

    if( str.length < 4){
        return str;
    }else if( str.length < 11){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 2);
        tmp += '-';
        tmp += str.substr(5);
    }

    return tmp;
}

/**
 * 날짜 형식 변경
 * 	사용법 :
 *	today = new Date();
 *	today.format("yyyy.MM.dd"));
 *  ()안에 원하는 날짜형식을 넣는다. 예) yyyy-MM-dd
 * @param f
 * @returns {*}
 */
Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";

    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;

    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "dd": return d.getDate().zf(2);
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
        }
    });
};
String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};

/**
 * Input only Number
 * @param event
 * @returns {boolean}
 */
function onlyNumber(event){
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )
        return;
    else
        return false;
}
/**
 *  Input 문자 입력시 삭제 하기
 * @param event
 */
function removeChar(event) {
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) {
        return;
    }else{
        event.target.value = event.target.value.replace(/[^0-9]/g, "");
    }
}

function onlyEngNum(event, obj) {
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    var regType1 = /^[A-Za-z0-9+]*$/;
    if ( keyID == 8 || keyID == 16 || keyID == 37 || keyID == 39 ) {
        return;
    } else if (!regType1.test(obj)) {
        event.target.value = event.target.value.replace(/[^a-z0-9]/gi,'');
    } else {
        return;
    }
}

/**
 * Object Null Check
 * @param obj
 * @returns {boolean}
 */
function isNull(obj) {
    return (typeof obj != "undefined" && obj != null && $.trim(obj) != "" && obj.length > 0) ? false : true;
}

/**
 * 윈도우 팝업
 * @param Url
 * @param Name
 * @param Pw
 * @param Ph
 * @param Opt
 * @constructor
 */
function WindowPopUp(Url, Name, Pw, Ph, Opt)
{
    //스크린 중앙 위치 구하기
    PosLeft = (screen.width-Pw)/2;
    PosTop = (screen.height-Ph)/2;
    var OptV = '';
    if (Opt == 1) {OptV=',toolbar=no,location=no,directories=no,status=no,menuBar=no,scrollBars=no,resizable=no';} //모든조건 no
    else if (Opt == 2){OptV=',toolbar=no,location=no,directories=no,status=no,menuBar=no,scrollBars=no,resizable=auto';} //사이즈조절만 가능
    else if (Opt == 3){OptV=',toolbar=no,location=no,directories=no,status=no,menuBar=no,scrollBars=yes,resizable=no';} //스크롤바만 가능
    else if (Opt == 9){OptV=',toolbar=yes,location=yes,directories=yes,status=yes,menuBar=yes,scrollBars=yes,resizable=yes';} //풀옵
    else if (Opt == 11){OptV=',top='+PosTop+',left='+PosLeft+',toolbar=no,location=no,directories=no,status=no,menuBar=no,scrollBars=no,resizable=no';} //1+스크린중앙

    var Option='width=' + Pw + ',height=' + Ph + OptV;

    winup = window.open(Url, Name, Option);

}

/**
 * 메모리 purge
 * 참고 - http://taegon.kim/archives/1044
 * 참고 - http://www.phpschool.com/gnuboard4/bbs/board.php?bo_table=tipntech&wr_id=71441&sca=&sfl=wr_subject%7C%7Cwr_content&stx=%B8%DE%B8%F0%B8%AE&sop=and&page=2
 * @param d
 */
function purge(d) {

    if(typeof d != "undefined"){
        var a = d.attributes, i, l, n;

        if (a) {
            l = a.length;
            for (i = 0; i < l; i += 1) {
                n = a[i].name;

                if (typeof d[n] === 'function') {
                    d[n] = null;
                }
            }
        }

        a = d.childNodes;

        if (a) {
            l = a.length;

            for (i = 0; i < l; i += 1) {
                purge(d.childNodes[i]);
            }
        }
    }
}