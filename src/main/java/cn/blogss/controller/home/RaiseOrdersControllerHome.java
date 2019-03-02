package cn.blogss.controller.home;/*
    create by LiQiang at 2018/4/22   
*/
import cn.blogss.common.util.ConstantUtil;
import cn.blogss.common.util.pojo.Message;
import cn.blogss.pojo.RaiseOrders;
import cn.blogss.pojo.Users;
import cn.blogss.service.RaiseOrdersService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/home/")
public class RaiseOrdersControllerHome {
    @Autowired
    private RaiseOrdersService raiseOrdersService;

    @RequestMapping(value = "user/order",method = {RequestMethod.POST,RequestMethod.GET})
    public String order(Model model){
        /*用户订单*/
        List<RaiseOrders> raiseOrders = raiseOrdersService.queryByUserId();
        model.addAttribute("raiseOrders",raiseOrders);
        return "home/user/user_order";
    }

    @RequestMapping(value = "user/{id}/orderdetail",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Map<String,Object> orderDetail(@PathVariable("id")Integer id){
        Map<String,Object> map = new HashMap<>();
        RaiseOrders raiseOrders = raiseOrdersService.orderDetail(id);
        map.put("msg",new Message());
        map.put("raiseOders",raiseOrders);
        return map;
    }


    @RequestMapping(value = "user/edit",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Message raiseOrdersEdit(@ModelAttribute RaiseOrders raiseOrders){
        raiseOrdersService.edit(raiseOrders);
        return new Message();
    }

}
