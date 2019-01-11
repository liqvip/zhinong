package cn.blogss.controller.admin;/*
    create by LiQiang at 2018/4/22   
*/


import cn.blogss.common.util.Message;
import cn.blogss.common.util.Page;
import cn.blogss.pojo.Users;
import cn.blogss.service.UsersService;
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
public class UsersController {
    @Autowired
    HttpServletRequest request;
    @Autowired
    private UsersService usersService;

    @RequestMapping(value = "users",method = {RequestMethod.GET,RequestMethod.POST})
    public String usersList(@ModelAttribute Users users, Model model,
                              @RequestParam(value = "pageIndex",defaultValue = "1") String pageIndex){
        String submitUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+
                request.getContextPath()+"/admin/users?pageIndex={0}";
        
        if(StringUtils.isNotEmpty(users.getName()))
            submitUrl += "&name="+users.getName();
        if(StringUtils.isNotEmpty(users.getUsername()))
            submitUrl += "&username="+users.getUsername();
        if(StringUtils.isNotEmpty(users.getPhone()))
            submitUrl += "&username="+users.getUsername();
        if(users.getStatus() != null && users.getStatus().toString() != "")
            submitUrl += "&status="+users.getStatus();
        
        List<Users> usersList = usersService.selectUsersByPage(pageIndex, Page.pageSize,users);
        int totalNum = usersService.totRecord(users);
        Page page = new Page();
        page.setPageIndex(Integer.parseInt(pageIndex));
        page.setTotalNum(totalNum);
        page.setSubmitUrl(submitUrl);

        model.addAttribute("user",users);
        model.addAttribute("page",page);
        model.addAttribute("users",usersList);

        return  "admin/users/index";
    }


    //    用户添加
    @RequestMapping(value = "users/add",method = {RequestMethod.POST})
    @ResponseBody
    public  Message usersAdd(@ModelAttribute Users users){
        users.setCreatetime(new Date());
        usersService.add(users);
        return new Message();
    }


    //  删除单个用户
    @RequestMapping(value = "users/delOne",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Message usersDelOne(@RequestParam("id")String id){
        usersService.delOne(id);
        return new Message();
    }

    @RequestMapping(value = "users/delBatch",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Message usersDelBatch(@RequestParam("ids")String[] ids){
        usersService.delBatch(ids);
        return new Message();
    }

    //    用户修改
    @RequestMapping(value = "users/edit",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Message usersEdit(@ModelAttribute Users users){
        usersService.edit(users);
        return new Message();
    }

    @RequestMapping(value = "users/editShow",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Map<String,Object> editShow(String id){
        Map<String,Object> map = new HashMap<>();
        Users user = usersService.editShow(id);
        Message msg = new Message();
        map.put("user",user);
        map.put("msg",msg);
        return map;
    }
}
