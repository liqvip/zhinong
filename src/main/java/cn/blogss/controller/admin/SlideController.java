package cn.blogss.controller.admin;/*
    create by LiQiang at 2018/4/22   
*/


import cn.blogss.common.util.pojo.Message;
import cn.blogss.common.util.pojo.Page;
import cn.blogss.pojo.Slide;
import cn.blogss.service.SlideService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping("/admin/")
public class SlideController {
    @Autowired
    HttpServletRequest request;
    @Autowired
    private SlideService slideService;

    @RequestMapping(value = "slide",method = {RequestMethod.GET,RequestMethod.POST})
    public String slideList(@ModelAttribute Slide slide, Model model,
                              @RequestParam(value = "pageIndex",defaultValue = "1") String pageIndex){
        String submitUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+
                request.getContextPath()+"/admin/slide?pageIndex={0}";

        List<Slide> slideList = slideService.selectSlideByPage(pageIndex, Page.pageSize);
        int totalNum = slideList.size();
        Page page = new Page();
        page.setPageIndex(Integer.parseInt(pageIndex));
        page.setTotalNum(totalNum);
        page.setSubmitUrl(submitUrl);

        model.addAttribute("page",page);
        model.addAttribute("slides",slideList);

        return  "admin/slide/index";
    }


    //    后台幻灯片添加
    @RequestMapping(value = "slide/add",method = {RequestMethod.POST})
    @ResponseBody
    public  Message slideAdd(@ModelAttribute Slide slide){
        slide.setAddtime(new Date());
        slideService.add(slide);
        return new Message();
    }


    //  删除单个幻灯片
    @RequestMapping(value = "slide/delOne",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Message slideDelOne(@RequestParam("id")String id){
        slideService.delOne(id);
        return new Message();
    }

    @RequestMapping(value = "slide/delBatch",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Message slideDelBatch(@RequestParam("ids")String[] ids){
        slideService.delBatch(ids);
        return new Message();
    }

    //    幻灯片修改
    @RequestMapping(value = "slide/edit",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Message slideEdit(@ModelAttribute Slide slide){
        slideService.edit(slide);
        return new Message();
    }
    

    @RequestMapping(value = "slide/addShow",method = {RequestMethod.POST,RequestMethod.GET})
    public String addShow(){
        return "admin/slide/add_edit";
    }

    @RequestMapping(value = "slide/editShow",method = {RequestMethod.POST,RequestMethod.GET})
    public String editShow(Model model,String id){
        Slide slide = slideService.editShow(id);
        model.addAttribute("slide",slide);
        return "admin/slide/add_edit";
    }

    @RequestMapping(value = "slide/uploadPic",method = {RequestMethod.POST})
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
                    String filePath = "C:/upload/slide/"+df.format(new Date())+"/"+newFileName;
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
