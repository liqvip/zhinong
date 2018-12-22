package cn.blogss.controller.admin;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.Menu;
import cn.blogss.common.util.Page;
import cn.blogss.service.MenuService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminMenuController {
    @Autowired
    HttpServletRequest request;

    @Autowired
    private MenuService menuService;

//    后台菜单查看,分页
    @RequestMapping(value = "/menu",method = {RequestMethod.GET,RequestMethod.POST},
            produces = "application/json;" +
            "charset=utf-8")
    public String menuScan(@RequestParam(value = "pageIndex",required = false) String pageIndex,
                           @ModelAttribute Menu menu,Model model){
        if(pageIndex == null || pageIndex.equals(""))
            pageIndex = "1";

        Page page = new Page();
        String submitUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+
                    request.getContextPath()+"/admin/menu?pageIndex={0}&name="+menu.getName()+"&murl="+menu.getMurl();

        int totalNum = menuService.totRecord(menu);
        List<Menu> menuList = menuService.menuSelectAll(pageIndex,Page.pageSize,menu);

        page.setPageIndex(Integer.parseInt(pageIndex));
        page.setTotalNum(totalNum);
        page.setSubmitUrl(submitUrl);
        model.addAttribute("menu",menu);
        model.addAttribute("page",page);
        model.addAttribute("menus",menuList);

        return  "admin/menu/index";
    }

//    后台菜单删除
    @RequestMapping(value = "/menu/delBatch",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public String menuDelete(@RequestParam("ids")String[] ids){
        menuService.menuDelete(ids);
        Map<String,Object> map = new HashMap<>();
        map.put("success",true);
        ObjectMapper om = new ObjectMapper();
        String resStr = "";
        try {
            resStr = om.writeValueAsString(map);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return resStr;
    }

    //删除单个菜单
    @RequestMapping(value = "/menu/delOne",method = {RequestMethod.GET,RequestMethod.POST})
    public String menuDelete(@RequestParam("id")String id){
        menuService.menuDelOne(id);
        return "redirect:/admin/menu/scan";
    }

//    菜单信息修改
    @RequestMapping(value = "menu/modify",method = RequestMethod.POST)
    public void menuModify(HttpServletResponse response,@ModelAttribute Menu menu) throws IOException {
        menuService.menuModify(menu);
        response.setContentType("text/html;charset=utf=8");
        response.getWriter().write("success");

    }

//
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

    //    后台菜单添加
    @RequestMapping(value = "/menu/add",method = RequestMethod.POST,
            produces = "application/json;charset=utf-8")
    @ResponseBody
    public String menuAdd(@ModelAttribute Menu menu , @RequestAttribute("file")MultipartFile file) throws
            IOException {
        String str = menuService.menuAdd(menu);
        return  str;
    }
}
