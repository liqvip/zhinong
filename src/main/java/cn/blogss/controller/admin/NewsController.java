package cn.blogss.controller.admin;/*
    create by LiQiang at 2018/4/22   
*/


import cn.blogss.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class NewsController {
    @Autowired
    private NewsService newsService;

}
