package kr.yerina.service;

import kr.yerina.domain.Menu;
import kr.yerina.repository.MenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor=RuntimeException.class)
public class MenuService {

    @Autowired
    MenuRepository menuRepository;

    public void saveMenu(Menu menu) {
        menuRepository.save(menu);
    }

    public List<Menu> findMenus() {
        return menuRepository.findAll();
    }

    public Menu findOne(Integer menuSerial) {
        return menuRepository.findOne(menuSerial);
    }
}
