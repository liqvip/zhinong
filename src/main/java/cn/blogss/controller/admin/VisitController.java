package cn.blogss.controller.admin;/*
    create by LiQiang at 2018/4/22   
*/


import cn.blogss.common.util.pojo.Message;
import cn.blogss.common.util.pojo.Page;
import cn.blogss.pojo.Visit;
import cn.blogss.service.VisitService;
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
@RequestMapping("/admin/")
public class VisitController {
    @Autowired
    HttpServletRequest request;
    @Autowired
    private VisitService visitService;

    @RequestMapping(value = "visit",method = {RequestMethod.GET,RequestMethod.POST})
    public String visitList(@ModelAttribute Visit visit, Model model,
                              @RequestParam(value = "pageIndex",defaultValue = "1") String pageIndex){
        String submitUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+
                request.getContextPath()+"/admin/visit?pageIndex={0}";
        
        if(StringUtils.isNotEmpty(visit.getIp()))
            submitUrl += "&ip="+visit.getIp();
        if(StringUtils.isNotEmpty(visit.getPlatformtype()))
            submitUrl += "&platformtype="+visit.getPlatformtype();
        
        List<Visit> visitList = visitService.selectVisitByPage(pageIndex, Page.pageSize,visit);
        int totalNum = visitService.totRecord(visit);
        Page page = new Page();
        page.setPageIndex(Integer.parseInt(pageIndex));
        page.setTotalNum(totalNum);
        page.setSubmitUrl(submitUrl);

        model.addAttribute("visit",visit);
        model.addAttribute("page",page);
        model.addAttribute("visits",visitList);

        return  "admin/visit/index";
    }

}
