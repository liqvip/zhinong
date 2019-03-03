package cn.blogss.controller.home;/*
    create by LiQiang at 2018/4/22   
*/


import cn.blogss.common.util.pojo.Message;
import cn.blogss.pojo.Link;
import cn.blogss.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/home/")
public class LinkControllerHome {
    @Autowired
    private LinkService linkService;

    @RequestMapping(value = "link/initAllLink",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Map<String,Object> initAllLink(){
        Map<String,Object> map = new HashMap<>();
        List<Link> links = linkService.selectLink();
        Message msg = new Message();
        map.put("links",links);
        map.put("msg",msg);
        return map;
    }
}
