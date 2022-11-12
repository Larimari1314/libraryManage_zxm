package sale.ljw.backend.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import sale.ljw.backend.pojo.Action;

/**
 * @author 86155
 * @description 针对表【Action】的数据库操作Mapper
 * @createDate 2022-10-17 15:29:15
 * @Entity generator.pojo.Action
 */
@Mapper
@Repository
public interface ActionMapper extends BaseMapper<Action> {

    int checkPermissions(String requestURI, String permission);
}




