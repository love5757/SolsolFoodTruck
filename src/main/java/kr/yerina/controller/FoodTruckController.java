package kr.yerina.controller;

import kr.yerina.domain.Truck;
import kr.yerina.service.MenuService;
import kr.yerina.service.TruckService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * Created by philip on 2015-12-15.
 */
@Controller
public class FoodTruckController {

    private static final Logger logger = LoggerFactory.getLogger(FoodTruckController.class);


    @Autowired
    TruckService truckService;
    @Autowired
    MenuService menuService;

    //TODO 이용 후기 등록(여유 되면 사진 업로드 까지)
    //TODO 여기요?  푸드 트럭이 왔으면 하는 곳
    //TODO 푸드 트럭 메뉴 어떻게 표시 할지(지도의 팝업 메뉴로 구성? 혹은 다른 영역)


    /**
     * 트럭의 현재 위치 정보 표시
     * @param model
     * @return
     */
    @RequestMapping(value = "/")
    public String foodTruckCurrentLocation(Model model) {
        logger.debug("FoodTruckCurrentLocation Call");
        model.addAttribute("foodTruck",truckService.findOne(1));
        logger.debug("model : "+model);
        //TODO 영업 종료 이면 위치 표시 하지 않고, 팝업창 뜨게 해야할듯 함.
        return "index";
    }

    /**
     * 현재 위치 정보 가져 오기
     * @param truck
     * @param model
     * @return
     */
    @RequestMapping(value = "/currentLocation")
    public String getLocation(Truck truck, Model model){
        logger.debug("CurrentLocation Call");
        return "currentLocation";
    }


    /**
     * 트럭 위치 정보 업데이트 프로세스
     * @param truck
     * @return
     */
    @RequestMapping(value = "/procLocation")
    @ResponseBody
    public Truck setLocation(Truck truck){
        Truck saveTruck = new Truck();
        //TODO 현재 솔소리 밖에 없으니까 ...
        //TODO 나중에 트럭이 추가 되면 전화번호 혹은 이메일로 해당 트럭에 정보 업데이트 해야함.
        saveTruck = truckService.findOne(1);

        if(!StringUtils.isEmpty(saveTruck)){
            saveTruck.setLatitude(truck.getLatitude());
            saveTruck.setLongitude(truck.getLongitude());
            saveTruck.setStatus(truck.getStatus());
            saveTruck.setStartDate(truck.getStartDate());
            saveTruck.setEndDate(truck.getEndDate());
            saveTruck.setUDate(new Date());
        }else{
            truck.setCDate(new Date());
            saveTruck = truck;
        }

        truckService.saveTruck(saveTruck);
        logger.debug("truck : "+truck);
        return truck;
    }



}
