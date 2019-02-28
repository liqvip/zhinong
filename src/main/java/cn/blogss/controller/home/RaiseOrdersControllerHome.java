package cn.blogss.controller.home;/*
    create by LiQiang at 2018/4/22   
*/
import cn.blogss.common.util.pojo.Message;
import cn.blogss.pojo.RaiseOrders;
import cn.blogss.service.RaiseOrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/home/")
public class RaiseOrdersControllerHome {
    @Autowired
    private RaiseOrdersService raiseOrdersService;


    @RequestMapping(value = "raiseOrders/edit",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Message raiseOrdersEdit(@ModelAttribute RaiseOrders raiseOrders){
        raiseOrdersService.edit(raiseOrders);
        return new Message();
    }
}
