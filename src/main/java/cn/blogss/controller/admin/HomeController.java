package cn.blogss.controller.admin;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.annotation.AccessLimit;
import cn.blogss.common.util.pojo.Message;
import cn.blogss.service.HomeService;
import cn.blogss.service.VisitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/admin/")
public class HomeController {
    @Autowired
    private HomeService homeService;
    
    /*查询不同状态的新闻总数*/
    @RequestMapping(value = "home/selectNewsCountByStatus",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Map<String,Object> selectNewsCountByStatus(){
        Map<String, Object> map = new HashMap<String, Object>();
        List<?> list  = homeService.selectNewsCountByStatus();
        map.put("list",list);
        map.put("msg",new Message());
        return map;
    }

//    根据日期分组查询新闻发表数量(前天，昨天，今天)
    @RequestMapping(value = "home/selectNewsCountByDate", method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Map<String, Object> selectNewsCountByDate(@RequestParam(value = "status") String status,
            @RequestParam(value = "qiantian") String qiantian,
            @RequestParam(value = "today") String today)
            throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        if (status != "" && status != null) {
            map.put("status", status);
        }
        if (qiantian != "" && qiantian != null) {
            map.put("qiantian", qiantian);
        }
        if (today != "" && today != null) {
            map.put("today", today);
        }
        List<?> list = homeService.selectNewsCountByDate(map);
        Map<String, Object> returnMap = new HashMap<String, Object>();
        returnMap.put("msg",new Message());
        returnMap.put("list", list);
        return returnMap;
    }

    //根据日期(年、月、日)分组查询访客数量
    @RequestMapping(value = "home/selectVisitCountByDate",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    @AccessLimit
    public Map<String, Object> selectBlogListByDate(@RequestParam(value="format") String format,
                                                    @RequestParam(value="yesterday") String yesterday,
                                                    @RequestParam(value="today") String today) throws Exception{
        Map<String, Object> map=new HashMap<String, Object>();
        if(format!=""&&format!=null){
            map.put("format", format);
        }
        if(yesterday!=""&&yesterday!=null){
            map.put("yesterday", yesterday);
        }
        if(today!=""&&today!=null){
            map.put("today", today);
        }
        List<?> list=homeService.selectVisitCountByDate(map);
        Map<String, Object> returnMap=new HashMap<String, Object>();
        returnMap.put("msg",new Message());
        returnMap.put("list", list);
        return returnMap;
    }
}
