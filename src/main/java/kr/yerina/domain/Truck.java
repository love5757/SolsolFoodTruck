package kr.yerina.domain;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

/**
 * Created by philip on 2015-12-15.
 */
@Data
@Entity
public class Truck {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Integer truckSerial;    //트럭 시리얼
    private String name;            //트럭 이름(ex)솔소리푸드트럭)
    private String owner;           //트럭 소유주(이름)
    private String latitude;        //위도
    private String longitude;       //경도
    private String telephoneNumber; //트럭 전화번호
    private String status;          //트럭 상태 (준비중, 영업중, 종료)
    private String startDate;       //시작 시간(22:00)
    private String endDate;         //종료 시간(24:00)
    private Date cDate;             //생성 시간
    private Date uDate;             //업데이트 시간

}
