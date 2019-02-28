package cn.blogss.controller.admin;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.common.util.pojo.Message;
import cn.blogss.common.util.pojo.Page;
import cn.blogss.pojo.RaiseOrders;
import cn.blogss.service.RaiseOrdersService;
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
public class RaiseOrdersController {
    @Autowired
    HttpServletRequest request;
    @Autowired
    private RaiseOrdersService raiseOrdersService;

    @RequestMapping(value = "raiseOrders",method = {RequestMethod.GET,RequestMethod.POST})
    public String raiseOrdersList(@ModelAttribute RaiseOrders raiseOrders,Model model,
                              @RequestParam(value = "pageIndex",defaultValue = "1") int pageIndex){
        List<RaiseOrders> raiseOrdersList = raiseOrdersService.selectRaiseOrdersByPage(pageIndex, Page.pageSize,raiseOrders);
        String submitUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+
                request.getContextPath()+"/admin/raiseOrders?pageIndex={0}";

        if(raiseOrders.getStatus() != null)
            submitUrl += "&status="+raiseOrders.getStatus();

        int totalNum = raiseOrdersService.totRecord(raiseOrders);
        Page page = new Page();
        page.setPageIndex(pageIndex);
        page.setTotalNum(totalNum);
        page.setSubmitUrl(submitUrl);
        model.addAttribute("raiseOrder",raiseOrders);
        model.addAttribute("page",page);
        model.addAttribute("raiseOrders",raiseOrdersList);

        return  "admin/raise_orders/index";
    }
    

    //  删除单个订单
    @RequestMapping(value = "raiseOrders/delOne",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Message raiseOrdersDelOne(@RequestParam("id")int id){
        raiseOrdersService.delOne(id);
        return new Message();
    }

    @RequestMapping(value = "raiseOrders/delBatch",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Message raiseOrdersDelBatch(@RequestParam("ids")String[] ids){
        raiseOrdersService.delBatch(ids);
        return new Message();
    }

    //    订单修改
    @RequestMapping(value = "raiseOrders/edit",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Message raiseOrdersEdit(@ModelAttribute RaiseOrders raiseOrders){
        raiseOrdersService.edit(raiseOrders);
        return new Message();
    }
}
