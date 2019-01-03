package cn.blogss.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/admin/")
 // 获取服务器的特定目录下的图片
public class FileBrowseUtil {

    private static final String NEWS = "C:/upload/news";
    private static final String RAISE = "C:/upload/raise";
    private static final String SLIDE = "C:/upload/slide";

    @RequestMapping("getFileList")
    @ResponseBody
    protected Map<String,Object> getFileList(@RequestParam("dir")String dir) throws IOException{
        String filePath = "";
        Map<String,Object> map = new HashMap<>();
        ArrayList<String> fileList=new ArrayList<String>();
        if(StringUtils.isEmpty(dir)){
            map.put("success",false);
            map.put("msg","请求的文件不存在!");
            return map;
        }else if(dir.equals("news")){
            filePath = NEWS;
            fileList=getFiles(filePath,fileList);
        }else if(dir.equals("raise")){
            filePath = RAISE;
            fileList=getFiles(filePath,fileList);
        }else if(dir.equals("slide")){
            filePath = SLIDE;
            fileList=getFiles(filePath,fileList);
        }

        if(fileList.size()>0){
            map.put("success", true);
            map.put("msg","请求成功!");
            map.put("fileList", fileList);
        }else{
            map.put("success",false);
            map.put("msg","服务器图库为空，请上传！");
        }
        return map;
    }
    /**
     * 通过递归得到某一路径下所有的目录及其文件
     */
    public ArrayList<String> getFiles(String filePath,ArrayList<String> fileList) {
        ArrayList<String> fileListAll =fileList;
        File root = new File(filePath);
        File[] files = root.listFiles();
        String[] arr=new String[10];
        if(files!=null){
          for (File file : files) {
            if (file.isDirectory()) {
                //递归调用
                getFiles(file.getAbsolutePath(),fileListAll);
            } else {
                arr=file.getAbsolutePath().split(":");
                fileList.add(arr[1].replace("\\","/"));
            }
           }
        }
        return fileListAll;
    }
}
