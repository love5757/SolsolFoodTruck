package kr.yerina.service;

import kr.yerina.domain.Truck;
import kr.yerina.repository.TruckRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor=RuntimeException.class)
public class TruckService {

    @Autowired
    TruckRepository truckRepository;

    public void saveTruck(Truck truck) {
        truckRepository.save(truck);
    }

    public List<Truck> findTrucks() {
        return truckRepository.findAll();
    }

    public Truck findOne(Integer truckSerial) {
        return truckRepository.findOne(truckSerial);
    }
}
