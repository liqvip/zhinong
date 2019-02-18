package cn.blogss.controller.home;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.service.RaiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
@Controller
@RequestMapping("/home")
public class RaiseControllerHome {
    @Autowired
    RaiseService raiseService;

    @Autowired
    HttpServletRequest request;

}
