package cn.blogss.controller;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.service.HomeRaiseService;
import cn.blogss.service.RaiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
@Controller
@RequestMapping("/home")
public class RaiseHomeController {
    @Autowired
    HomeRaiseService homeRaiseService;

    @Autowired
    HttpServletRequest request;

    @Autowired
    private RaiseService raiseService;

    //    农资查看
    @RequestMapping(value = "/raise/{pageNow}",method = RequestMethod.GET)
    public String raisePage(@PathVariable String pageNow, Model model){
        String cid = request.getParameter("cid");
        homeRaiseService.raiseList(pageNow,model,cid);
        return "home/raise/raise";
    }

    //    农资详情
    @RequestMapping("/raise/raise_detail/{raiseId}")
    public String raiseDetail(@PathVariable int raiseId,Model model){
        homeRaiseService.raiseDetail(raiseId,model);
        return "home/raise/raise_detail";
    }

}
