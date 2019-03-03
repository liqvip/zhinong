package cn.blogss.controller.home;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.common.util.pojo.Message;
import cn.blogss.pojo.Slide;
import cn.blogss.service.SlideService;
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
public class SlideControllerHome {
    @Autowired
    private SlideService slideService;

    @RequestMapping(value = "slide/initAllSlide",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Map<String,Object> initAllSlide(){
        Map<String,Object> map = new HashMap<>();
        List<Slide> slides = slideService.selectSlide();
        map.put("msg",new Message());
        map.put("slides",slides);
        return map;
    }

}
