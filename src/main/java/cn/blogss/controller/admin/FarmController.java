package cn.blogss.controller.admin;/*
    create by LiQiang at 2018/4/22   
*/


import cn.blogss.common.util.pojo.Message;
import cn.blogss.common.util.pojo.Page;
import cn.blogss.pojo.Farm;
import cn.blogss.service.FarmService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;


@Controller
@RequestMapping("/admin/")
public class FarmController {
    @Autowired
    HttpServletRequest request;
    @Autowired
    private FarmService farmService;

    @RequestMapping(value = "farm",method = {RequestMethod.GET,RequestMethod.POST})
    public String farmList(@ModelAttribute Farm farm, Model model,
                              @RequestParam(value = "pageIndex",defaultValue = "1") String pageIndex){
        String submitUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+
                request.getContextPath()+"/admin/farm?pageIndex={0}";
        if(StringUtils.isNotEmpty(farm.getName()))
            submitUrl += "&name="+farm.getName();
        
        List<Farm> farmList = farmService.selectFarmByPage(pageIndex, Page.pageSize,farm);
        int totalNum = farmService.totRecord(farm);
        Page page = new Page();
        page.setPageIndex(Integer.parseInt(pageIndex));
        page.setTotalNum(totalNum);
        page.setSubmitUrl(submitUrl);
        
        model.addAttribute("farm",farm);
        model.addAttribute("page",page);
        model.addAttribute("farms",farmList);

        return  "admin/farm/index";
    }


    //    后台农场添加
    @RequestMapping(value = "farm/add",method = {RequestMethod.POST})
    @ResponseBody
    public  Message farmAdd(@ModelAttribute Farm farm){
        farm.setAddtime(new Date());
        farmService.add(farm);
        return new Message();
    }


    //  删除单个农场
    @RequestMapping(value = "farm/delOne",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Message farmDelOne(@RequestParam("id")String id){
        farmService.delOne(id);
        return new Message();
    }

    @RequestMapping(value = "farm/delBatch",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Message farmDelBatch(@RequestParam("ids")String[] ids){
        farmService.delBatch(ids);
        return new Message();
    }

    //    农场修改
    @RequestMapping(value = "farm/edit",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Message farmEdit(@ModelAttribute Farm farm){
        farmService.edit(farm);
        return new Message();
    }
    

    @RequestMapping(value = "farm/addShow",method = {RequestMethod.POST,RequestMethod.GET})
    public String addShow(){
        return "admin/farm/add_edit";
    }

    @RequestMapping(value = "farm/editShow",method = {RequestMethod.POST,RequestMethod.GET})
    public String editShow(Model model,String id){
        Farm farm = farmService.editShow(id);
        model.addAttribute("farm",farm);
        return "admin/farm/add_edit";
    }

    @RequestMapping(value = "farm/uploadPic",method = {RequestMethod.POST})
    @ResponseBody
    public Message uploadPic(@RequestParam("file") MultipartFile[] files) throws IOException {
        if(files != null && files.length > 0){
            for(int i = 0;i<files.length;i++){
                if(files[i].getOriginalFilename().trim() != ""){
                    String fileName = files[i].getOriginalFilename();
                    String fileBaseName = fileName.substring(0,fileName.indexOf("."));
                    String fileExt = fileName.substring(fileName.indexOf(".")+1).toUpperCase();
                    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                    String newFileName = df.format(new Date())+new Random().nextInt(10000)+"."+fileExt;
                    String filePath = "C:/upload/farm/"+df.format(new Date())+"/"+newFileName;
                    File localFile = new File(filePath);
                    if(!localFile.exists()){
                        localFile.mkdirs();
                    }
                    files[i].transferTo(localFile);
                }
            }
            return new Message(true,"上传成功");
        }else{
            return new Message(false,"上传失败");
        }
    }
}
