package cn.blogss.serviceimpl;/*
 *Created by liqiang on 2018/12/6
 */

import cn.blogss.mapper.MenuMapper;
import cn.blogss.pojo.Menu;
import cn.blogss.service.MenuService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuMapper menuMapper;
    @Override
    public String selectMenuList(String id) {
        if(StringUtils.isEmpty(id) || id.equals("")){
            id = 0+"";
        }

        List<Menu> menus = menuMapper.selectMenuList(id);

        for(Menu menu:menus){
            int cnt = menuMapper.isParent(menu.getId());
            if(cnt == 0)
                menu.setIsParent(false);
        }

        ObjectMapper om = new ObjectMapper();
        String menuJson = "";

        try {
              menuJson = om.writeValueAsString(menus);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return menuJson;
    }

    @Override
    public String menuAdd(Menu menu) {
        return null;
    }

    @Override
    public List<Menu> menuSelectAll(String pageIndex, int pageSize, Menu menu) {
        return menuMapper.menuSelectAll((Integer.parseInt(pageIndex)-1)*pageSize,pageSize,menu);
    }

    @Override
    public void menuDelete(String[] ids) {

    }

    @Override
    public void menuModify(Menu menu) {

    }


    @Override
    public int totRecord(Menu menu) {
        return menuMapper.totRecord(menu);
    }

    @Override
    public void menuDelOne(String id) {

    }

    @Override
    public List<Menu> addShow() {
        return menuMapper.addShow();
    }

    @Override
    public Menu editShow(String id) {
        return menuMapper.editShow(id);
    }
}
