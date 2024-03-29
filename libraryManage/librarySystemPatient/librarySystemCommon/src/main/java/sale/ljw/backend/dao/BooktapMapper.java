package sale.ljw.backend.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import sale.ljw.backend.pojo.Booktap;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Map;

/**
 * @author 86155
 * @description 针对表【bookTap】的数据库操作Mapper
 * @createDate 2022-10-17 16:22:46
 * @Entity sale.ljw.backend.pojo.Booktap
 */
@Mapper
@Repository
public interface BooktapMapper extends BaseMapper<Booktap> {
    @MapKey(value = "id")
    ArrayList<Map<String,Object>> queryBookmarksByBookId(String userId,String bookId);
    @MapKey(value = "tagId")
    ArrayList<Map<String,Object>> queryBookDetailsTag(String bookId);
    @MapKey(value = "tapId")
    ArrayList<Map<String,Object>> queryBookTapByTapId(Integer tapId);

    Integer addTapByBookList(Integer tagId, HashSet<Integer> bookId);
}




