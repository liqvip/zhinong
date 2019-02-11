package cn.blogss.controller.admin;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.common.util.pojo.Message;
import cn.blogss.common.util.pojo.Page;
import cn.blogss.pojo.RaiseCat;
import cn.blogss.service.RaiseCatService;
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
public class RaiseCatController {
    @Autowired
    HttpServletRequest request;
    @Autowired
    private RaiseCatService raiseCatService;

    @RequestMapping(value = "raiseCat",method = {RequestMethod.GET,RequestMethod.POST})
    public String raiseCatList(@ModelAttribute RaiseCat raiseCat,Model model,
                              @RequestParam(value = "pageIndex",defaultValue = "1") String pageIndex){
        List<RaiseCat> raiseCatList = raiseCatService.selectRaiseCatByPage(pageIndex, Page.pageSize,raiseCat);
        String submitUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+
                request.getContextPath()+"/admin/raiseCat?pageIndex={0}";

        if(!StringUtils.isEmpty(raiseCat.getName()))
            submitUrl += "&name="+raiseCat.getName();

        int totalNum = raiseCatService.totRecord(raiseCat);
        Page page = new Page();
        page.setPageIndex(Integer.parseInt(pageIndex));
        page.setTotalNum(totalNum);
        page.setSubmitUrl(submitUrl);
        model.addAttribute("raiseCat",raiseCat);
        model.addAttribute("page",page);
        model.addAttribute("raiseCats",raiseCatList);

        return  "admin/raise_cat/index";
    }


    //    后台农资分类添加
    @RequestMapping(value = "raiseCat/add",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public  Message raiseCatAdd(@ModelAttribute RaiseCat raiseCat){
        raiseCat.setAddtime(new Date());
        raiseCatService.add(raiseCat);
        return new Message();
    }

    //  删除单个农资分类
    @RequestMapping(value = "raiseCat/delOne",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Message raiseCatDelOne(@RequestParam("id")String id){
        raiseCatService.delOne(id);
        return new Message();
    }

    @RequestMapping(value = "raiseCat/delBatch",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Message raiseCatDelBatch(@RequestParam("ids")String[] ids){
        raiseCatService.delBatch(ids);
        return new Message();
    }

    //    农资分类修改
    @RequestMapping(value = "raiseCat/edit",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Message raiseCatEdit(@ModelAttribute RaiseCat raiseCat){
        raiseCat.setAddtime(new Date());
        raiseCatService.edit(raiseCat);
        return new Message();
    }
}
