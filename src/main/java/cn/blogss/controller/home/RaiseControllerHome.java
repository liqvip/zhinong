package cn.blogss.controller.home;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.common.util.ConstantUtil;
import cn.blogss.common.util.enums.raise.KillStatEnum;
import cn.blogss.common.util.pojo.Message;
import cn.blogss.common.util.pojo.Page;
import cn.blogss.dto.raise.Exposer;
import cn.blogss.dto.raise.KillExecution;
import cn.blogss.dto.raise.KillResult;
import cn.blogss.exception.raise.KillCloseException;
import cn.blogss.exception.raise.KillDataRewriteException;
import cn.blogss.exception.raise.RepeatKillException;
import cn.blogss.pojo.Raise;
import cn.blogss.pojo.RaiseCat;
import cn.blogss.pojo.RaiseOrders;
import cn.blogss.pojo.Users;
import cn.blogss.service.FarmService;
import cn.blogss.service.RaiseOrdersService;
import cn.blogss.service.RaiseService;
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
@RequestMapping("/home/")
public class RaiseControllerHome {
    @Autowired
    RaiseService raiseService;
    @Autowired
    RaiseOrdersService raiseOrdersService;

    @Autowired
    HttpServletRequest request;

    @RequestMapping(value = "raise",method = {RequestMethod.GET,RequestMethod.POST})
    public String raiseList(@ModelAttribute Raise raise, Model model,
                            @RequestParam(value = "pageIndex",defaultValue = "1") String pageIndex){
        String submitUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+
                request.getContextPath()+"/home/raise?pageIndex={0}";

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

        return  "home/raise/index";
    }

    /*初始化首页推荐*/
    @RequestMapping(value = "raise/initRecommended",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Map<String,Object> initRecommended(){
        Map<String,Object> map = new HashMap<>();
        List<Raise> raises = raiseService.initRecommended();
        map.put("msg",new Message());
        map.put("raises",raises);
        return map;
    }

    //    select raise by id
    @RequestMapping(value = "raise/{id}/detail",method = {RequestMethod.POST,RequestMethod.GET})
    public String selectRaiseById(@PathVariable("id") Integer id,Model model){
        if(id == null)
            return "forward:/home/raise";

        Raise sraise = raiseService.selectRaiseById(id);
        if(sraise == null){
            return "forward:/home/raise";
        }
        List<?> raiseOrders = raiseOrdersService.queryByRaiseId(id);
        model.addAttribute("raiseOrders",raiseOrders);
        model.addAttribute("sraise",sraise);
        return "home/raise/detail";
    }

    @RequestMapping(value = "raise/{id}/exposer",method = {RequestMethod.POST})
    @ResponseBody
    public KillResult<Exposer> exposer(@PathVariable("id") Integer id){
        KillResult<Exposer> result;
        try {
            Exposer exposer = raiseService.exportKillUrl(id);
            result = new KillResult<>(true,exposer);
        }catch (Exception e){
            result = new KillResult<>(false,e.getMessage());
        }

        return result;
    }

    @RequestMapping(value = "raise/{md5}/execution",method = {RequestMethod.POST})
    @ResponseBody
    public KillResult<KillExecution> execute(@PathVariable("md5") String md5,
                                             HttpServletRequest request,RaiseOrders raiseOrders){
        KillResult<KillExecution> result;
        KillExecution execution;
        Users user = (Users)request.getSession().getAttribute(ConstantUtil.SESSION_NAME);
        raiseOrders.setUserId(user.getId());
        try {
            execution = raiseService.executeKill(md5,raiseOrders);
            result = new KillResult<>(true,execution);
        }catch (KillDataRewriteException e1){
            execution = new KillExecution(raiseOrders.getRaiseId(), KillStatEnum.DATA_REWRITE);
            result = new KillResult<>(true,execution);
        }catch (RepeatKillException e2){
            execution = new KillExecution(raiseOrders.getRaiseId(), KillStatEnum.REPEAT_KILL);
            result = new KillResult<>(true,execution);
        }catch (KillCloseException e3){
            execution = new KillExecution(raiseOrders.getRaiseId(), KillStatEnum.END);
            result = new KillResult<>(true,execution);
        }catch (Exception e){
            execution = new KillExecution(raiseOrders.getRaiseId(), KillStatEnum.INNER_ERROR);
            result = new KillResult<>(true,execution);
        }
        return result;
    }

    @RequestMapping(value = "raise/time/now",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public KillResult<Long> time(){
        Date now = new Date() ;
        return new KillResult<>(true,now.getTime());
    }

}
