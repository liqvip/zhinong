package cn.blogss.controller.admin;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.common.util.pojo.Message;
import cn.blogss.common.util.pojo.Page;
import cn.blogss.pojo.Farm;
import cn.blogss.pojo.Raise;
import cn.blogss.pojo.RaiseCat;
import cn.blogss.service.FarmService;
import cn.blogss.service.RaiseService;
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
import java.util.*;


@Controller
@RequestMapping("/admin/")
public class RaiseController {
    @Autowired
    HttpServletRequest request;
    @Autowired
    private RaiseService raiseService;
    @Autowired
    private FarmService farmService;

    @RequestMapping(value = "raise",method = {RequestMethod.GET,RequestMethod.POST})
    public String raiseList(@ModelAttribute Raise raise, Model model,
                           @RequestParam(value = "pageIndex",defaultValue = "1") String pageIndex){
        String submitUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+
                request.getContextPath()+"/admin/raise?pageIndex={0}";

        if(!StringUtils.isEmpty(raise.getName()))
            submitUrl += "&name="+raise.getName();
        if(raise.getCatId() != null)
            submitUrl += "&catId="+raise.getCatId();
        if(raise.getStatus() != null)
            submitUrl += "&status="+raise.getStatus();

        List<Raise> raiseList = raiseService.selectRaiseByPage(pageIndex, Page.pageSize,raise);
        List<RaiseCat> raiseCats = raiseService.addShow();
        int totalNum = raiseService.totRecord(raise);
        Page page = new Page();
        page.setPageIndex(Integer.parseInt(pageIndex));
        page.setTotalNum(totalNum);
        page.setSubmitUrl(submitUrl);

        model.addAttribute("sraise",raise);
        model.addAttribute("raiseCats",raiseCats);
        model.addAttribute("page",page);
        model.addAttribute("raise",raiseList);

        return  "admin/raise/index";
    }


    //    后台农资添加
    @RequestMapping(value = "raise/add",method = {RequestMethod.POST})
    @ResponseBody
    public  Message raiseAdd(@ModelAttribute Raise raise){
        raiseService.add(raise);
        return new Message();
    }


    //  删除单个农资
    @RequestMapping(value = "raise/delOne",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Message raiseDelOne(@RequestParam("id")String id){
        raiseService.delOne(id);
        return new Message();
    }

    @RequestMapping(value = "raise/delBatch",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Message raiseDelBatch(@RequestParam("ids")String[] ids){
        raiseService.delBatch(ids);
        return new Message();
    }

    //    农资修改
    @RequestMapping(value = "raise/edit",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Message raiseEdit(@ModelAttribute Raise raise){
        raiseService.edit(raise);
        return new Message();
    }

    @RequestMapping(value = "raise/addShow",method = {RequestMethod.POST,RequestMethod.GET})
    public String addShow(Model model){
        List<RaiseCat> raiseCats = raiseService.addShow();
        List<Farm> farms = farmService.raiseAddShow();
        model.addAttribute("raiseCats",raiseCats);
        model.addAttribute("farms",farms);
        return "admin/raise/add_edit";
    }

    @RequestMapping(value = "raise/editShow",method = {RequestMethod.POST,RequestMethod.GET})
    public String editShow(Model model,String id){
        Raise sraise = raiseService.editShow(id);
        List<RaiseCat> raiseCats = raiseService.addShow();
        List<Farm> farms = farmService.raiseAddShow();
        model.addAttribute("sraise",sraise);
        model.addAttribute("raiseCats",raiseCats);
        model.addAttribute("farms",farms);
        return "admin/raise/add_edit";
    }

    @RequestMapping(value = "raise/uploadPic",method = {RequestMethod.POST})
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
                    String filePath = "C:/upload/raise/"+df.format(new Date())+"/"+newFileName;
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
