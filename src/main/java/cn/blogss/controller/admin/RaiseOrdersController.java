package cn.blogss.controller.admin;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.common.util.pojo.Message;
import cn.blogss.common.util.pojo.Page;
import cn.blogss.service.RaiseOrdersService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/admin/")
public class RaiseOrdersController {
    @Autowired
    HttpServletRequest request;
    @Autowired
    private RaiseOrdersService raiseOrdersService;

    @RequestMapping(value = "order",method = {RequestMethod.GET,RequestMethod.POST})
    public String raiseOrdersList(@RequestParam(value = "username",required = false)String username,
                                  @RequestParam(value = "pageIndex",defaultValue = "1") int pageIndex,
                                  Model model){
        List<?> raiseOrdersList = raiseOrdersService.selectRaiseOrdersByPage(pageIndex, Page.pageSize,username);
        String submitUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+
                request.getContextPath()+"/admin/order?pageIndex={0}";

        if(StringUtils.isNotEmpty(username))
            submitUrl += "&username="+username;

        int totalNum = raiseOrdersService.totRecord(username);
        Page page = new Page();
        page.setPageIndex(pageIndex);
        page.setTotalNum(totalNum);
        page.setSubmitUrl(submitUrl);
        model.addAttribute("username",username);
        model.addAttribute("page",page);
        model.addAttribute("raiseOrders",raiseOrdersList);

        return  "admin/raise_orders/index";
    }
    

    //  删除单个订单
    @RequestMapping(value = "order/delOne",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Message raiseOrdersDelOne(@RequestParam("id")int id){
        raiseOrdersService.delOne(id);
        return new Message();
    }

    @RequestMapping(value = "order/delBatch",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Message raiseOrdersDelBatch(@RequestParam("ids")String[] ids){
        raiseOrdersService.delBatch(ids);
        return new Message();
    }
}
