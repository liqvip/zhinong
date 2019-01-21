package cn.blogss.controller.home;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.common.util.pojo.Message;
import cn.blogss.common.util.pojo.Page;
import cn.blogss.pojo.NewsCat;
import cn.blogss.service.NewsCatService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/home/")
public class NewsCatControllerHome {
    @Autowired
    HttpServletRequest request;
    @Autowired
    private NewsCatService newsCatService;

    @RequestMapping(value = "newsCat/initAllNewsType",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Map<String,Object> initAllNewsType(){
        Map<String,Object> map = new HashMap<>();
        List<NewsCat> newsCats = newsCatService.selectNewsType();
        map.put("msg",new Message());
        map.put("newsCats",newsCats);
        return map;
    }
}
