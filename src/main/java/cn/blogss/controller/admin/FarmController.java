package cn.blogss.controller.admin;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.Farm;
import cn.blogss.common.util.Page;
import cn.blogss.service.FarmService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class FarmController {
    @Autowired
    HttpServletRequest request;

    @Autowired
    private FarmService farmService;


//    后台农场添加
    @RequestMapping(value = "/farm/add",method = RequestMethod.POST,
            produces = "application/json;charset=utf-8")
    @ResponseBody
    public String farmAdd(@ModelAttribute Farm farm , @RequestAttribute("file")MultipartFile file) throws
            IOException {
        //农场头像处理
        if(!file.isEmpty()){
            String newFileName = System.currentTimeMillis()+file.getOriginalFilename();
            farm.setFarmImg(newFileName);
            System.out.println(request.getServletContext().getRealPath("images"));
            File newFile = new File(request.getServletContext().getRealPath("admin\\images\\farm"),newFileName);
            FileUtils.copyInputStreamToFile(file.getInputStream(),newFile);
        }

        //model处理
        String str = farmService.farmAdd(farm);
        return  str;
    }

//    后台农场查看,分页
    @RequestMapping(value = "/farm/scan",method = {RequestMethod.GET,RequestMethod.POST},
            produces = "application/json;" +
            "charset=utf-8")
    public String farmScan(@RequestParam(value = "pageIndex",required = false) String pageIndex,
                           @RequestParam(value = "farmName",required = false) String farmName,Model model){
        if(pageIndex == null || pageIndex.equals(""))
            pageIndex = "1";

        Page page = new Page();
        String submitUrl = "";
        if(farmName == null || farmName.equals("")){
            submitUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+
                    request.getContextPath()+"/admin/farm/scan?pageIndex={0}";
        }else{
            submitUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+
                    request.getContextPath()+"/admin/farm/scan?pageIndex={0}"+"&farmName="+farmName;
            request.setAttribute("farmName",farmName);
        }

        int totalNum = farmService.totRecord(farmName);
        List<Farm> farmList = farmService.farmSelectAll(pageIndex,Page.pageSize,farmName);

        page.setPageIndex(Integer.parseInt(pageIndex));
        page.setTotalNum(totalNum);
        page.setSubmitUrl(submitUrl);
        model.addAttribute("page",page);
        model.addAttribute("farmList",farmList);

        return  "admin/farm/index";
    }


//    后台农场删除
    @RequestMapping(value = "/farm/delBatch",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public String farmDelete(@RequestParam("ids")String[] ids){
        farmService.farmDelete(ids);
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

    //删除单个农场
    @RequestMapping(value = "/farm/delOne",method = {RequestMethod.GET,RequestMethod.POST})
    public String farmDelete(@RequestParam("id")String id){
        farmService.farmDelOne(id);
        return "redirect:/admin/farm/scan";
    }

//    农场信息修改
    @RequestMapping(value = "farm/modify",method = RequestMethod.POST)
    public void farmModify(HttpServletResponse response,@ModelAttribute Farm farm) throws IOException {
        farmService.farmModify(farm);
        response.setContentType("text/html;charset=utf=8");
        response.getWriter().write("success");

    }

}
