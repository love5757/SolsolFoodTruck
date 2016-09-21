package kr.yerina.domain;

import lombok.Data;

import javax.persistence.*;

/**
 * Created by philip on 2015-12-15.
 */
@Data
@Entity
public class Menu {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Integer menuSerial;     //메뉴 일련 번호
    private Integer truckSerial;    //트럭 일련 번호
    private String name;            //메뉴 이름
    private Integer price;          //메뉴 가격
    private String desction;        //메뉴 설명

}
