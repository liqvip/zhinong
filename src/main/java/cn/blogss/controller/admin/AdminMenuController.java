package cn.blogss.controller.admin;/*
    create by LiQiang at 2018/4/22   
*/
import cn.blogss.pojo.Menu;
import cn.blogss.common.util.pojo.Page;
import cn.blogss.common.util.pojo.Message;
import cn.blogss.service.MenuService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
@RequestMapping("/admin/")
public class AdminMenuController {
    @Autowired
    HttpServletRequest request;

    @Autowired
    private MenuService menuService;

//    后台菜单查看,分页
    @RequestMapping(value = "menu",method = {RequestMethod.GET,RequestMethod.POST},
            produces = "application/json;" +
            "charset=utf-8")
    public String menuScan(@RequestParam(value = "pageIndex",defaultValue = "1") String pageIndex,
                           @ModelAttribute Menu menu,Model model){
        List<Menu> menuList = menuService.selectMenuByPage(pageIndex,Page.pageSize,menu);
        String submitUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+
                request.getContextPath()+"/admin/menu?pageIndex={0}";

        if(StringUtils.isNotEmpty(menu.getName()))
            submitUrl += "&name="+menu.getName();
        if(StringUtils.isNotEmpty(menu.getMurl()))
            submitUrl += "&murl="+menu.getMurl();

        int totalNum = menuService.totRecord(menu);
        Page page = new Page();
        page.setPageIndex(Integer.parseInt(pageIndex));
        page.setTotalNum(totalNum);
        page.setSubmitUrl(submitUrl);
        model.addAttribute("menu",menu);
        model.addAttribute("page",page);
        model.addAttribute("menus",menuList);

        return  "admin/menu/index";
    }

    //    后台菜单添加
    @RequestMapping(value = "menu/add",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public  Message menuAdd(@ModelAttribute Menu menu){
        menuService.add(menu);
        return new Message();
    }

    //  菜单批量删除
    @RequestMapping(value = "menu/delBatch",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Message menuDelete(@RequestParam("ids")String[] ids){
        menuService.delBatch(ids);
        return new Message();
    }

    //  删除单个菜单
    @RequestMapping(value = "menu/delOne",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Message menuDelete(@RequestParam("id")String id){
        menuService.delOne(id);
        return new Message();
    }

    //    菜单修改
    @RequestMapping(value = "menu/edit",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Message menuModify(@ModelAttribute Menu menu){
        menuService.edit(menu);
        return new Message();
    }


    @RequestMapping(value = "menu/addShow",method = {RequestMethod.POST,RequestMethod.GET})
    public String addShow(Model model){
        List<Menu> menu = menuService.addShow();
        model.addAttribute("menus",menu);
        return "admin/menu/add_edit";
    }

    @RequestMapping(value = "menu/editShow",method = {RequestMethod.POST,RequestMethod.GET})
    public String editShow(Model model,String id){
        Menu smenu = menuService.editShow(id);
        List<Menu> menus = menuService.addShow();
        model.addAttribute("smenu",smenu);
        model.addAttribute("menus",menus);
        return "admin/menu/add_edit";
    }



}
