package cn.blogss.controller.admin;/*
    create by LiQiang at 2018/4/22   
*/


import cn.blogss.common.util.pojo.Message;
import cn.blogss.common.util.pojo.Page;
import cn.blogss.pojo.Link;
import cn.blogss.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;


@Controller
@RequestMapping("/admin/")
public class LinkController {
    @Autowired
    HttpServletRequest request;
    @Autowired
    private LinkService linkService;

    @RequestMapping(value = "link",method = {RequestMethod.GET,RequestMethod.POST})
    public String linkList(@ModelAttribute Link link, Model model,
                              @RequestParam(value = "pageIndex",defaultValue = "1") String pageIndex){
        String submitUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+
                request.getContextPath()+"/admin/link?pageIndex={0}";
        
        if(link.getName() != null && link.getName() != "")
            submitUrl += "&name="+link.getName();
        if(link.getStatus() != null && link.getStatus().toString() != "")
            submitUrl += "&status="+link.getStatus();

        List<Link> linkList = linkService.selectLinkByPage(pageIndex, Page.pageSize,link);
        int totalNum = linkService.totRecord(link);
        Page page = new Page();
        page.setPageIndex(Integer.parseInt(pageIndex));
        page.setTotalNum(totalNum);
        page.setSubmitUrl(submitUrl);

        model.addAttribute("link",link);
        model.addAttribute("page",page);
        model.addAttribute("links",linkList);

        return  "admin/link/index";
    }


    //    友情链接添加
    @RequestMapping(value = "link/add",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public  Message linkAdd(@ModelAttribute Link link){
        link.setAddtime(new Date());
        linkService.add(link);
        return new Message();
    }


    //  删除单个友情链接
    @RequestMapping(value = "link/delOne",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Message linkDelOne(@RequestParam("id")String id){
        linkService.delOne(id);
        return new Message();
    }

    @RequestMapping(value = "link/delBatch",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Message linkDelBatch(@RequestParam("ids")String[] ids){
        linkService.delBatch(ids);
        return new Message();
    }

    //    友情链接修改
    @RequestMapping(value = "link/edit",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Message linkEdit(@ModelAttribute Link link){
        linkService.edit(link);
        return new Message();
    }

    @RequestMapping(value = "link/editShow",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Map<String,Object> editShow(String id){
        Map<String,Object> map = new HashMap<>();
        Link link = linkService.editShow(id);
        Message msg = new Message();
        map.put("link",link);
        map.put("msg",msg);
        return map;
    }
}
