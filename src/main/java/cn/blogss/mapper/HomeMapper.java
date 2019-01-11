package cn.blogss.mapper;

import java.util.List;
import java.util.Map;

public interface HomeMapper {

    List<?> selectNewsCountByStatus();

    List<?> selectNewsCountByDate(Map<String, Object> map);
}