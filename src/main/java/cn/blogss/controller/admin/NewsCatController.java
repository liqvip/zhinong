package cn.blogss.controller.admin;/*
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
import java.util.List;

@Controller
@RequestMapping("/admin/")
public class NewsCatController {
    @Autowired
    HttpServletRequest request;
    @Autowired
    private NewsCatService newsCatService;

    @RequestMapping(value = "newsCat",method = {RequestMethod.GET,RequestMethod.POST})
    public String newsCatList(@ModelAttribute NewsCat newsCat,Model model,
                              @RequestParam(value = "pageIndex",defaultValue = "1") String pageIndex){
        List<NewsCat> newsCatList = newsCatService.selectNewsCatByPage(pageIndex, Page.pageSize,newsCat);
        String submitUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+
                request.getContextPath()+"/admin/newsCat?pageIndex={0}";

        if(!StringUtils.isEmpty(newsCat.getName()))
            submitUrl += "&name="+newsCat.getName();

        int totalNum = newsCatService.totRecord(newsCat);
        Page page = new Page();
        page.setPageIndex(Integer.parseInt(pageIndex));
        page.setTotalNum(totalNum);
        page.setSubmitUrl(submitUrl);
        model.addAttribute("newsCat",newsCat);
        model.addAttribute("page",page);
        model.addAttribute("newsCats",newsCatList);

        return  "admin/news/news_cat";
    }


    //    后台新闻分类添加
    @RequestMapping(value = "newsCat/add",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public  Message newsCatAdd(@ModelAttribute NewsCat newsCat){
        newsCat.setAddtime(new Date());
        newsCatService.add(newsCat);
        return new Message();
    }

    //  删除单个新闻分类
    @RequestMapping(value = "newsCat/delOne",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Message newsCatDelOne(@RequestParam("id")String id){
        newsCatService.delOne(id);
        return new Message();
    }

    @RequestMapping(value = "newsCat/delBatch",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Message newsCatDelBatch(@RequestParam("ids")String[] ids){
        newsCatService.delBatch(ids);
        return new Message();
    }

    //    新闻分类修改
    @RequestMapping(value = "newsCat/edit",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Message newsCatEdit(@ModelAttribute NewsCat newsCat){
        newsCat.setAddtime(new Date());
        newsCatService.edit(newsCat);
        return new Message();
    }
}
