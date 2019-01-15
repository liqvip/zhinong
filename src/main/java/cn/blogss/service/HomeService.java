package cn.blogss.service;/*
    create by LiQiang at 2018/4/22   
*/

import java.util.List;
import java.util.Map;

public interface HomeService {
    List<?> selectNewsCountByStatus();

    List<?> selectNewsCountByDate(Map<String, Object> map);

    List<?>  selectVisitCountByDate(Map<String, Object> map);
}
