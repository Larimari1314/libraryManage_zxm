package sale.ljw.librarySystemReader.backend.service;

import com.baomidou.mybatisplus.extension.service.IService;
import sale.ljw.backend.pojo.Booktap;
import sale.ljw.common.common.http.ResponseResult;

/**
 * @author 86155
 * @description 针对表【bookTap】的数据库操作Service
 * @createDate 2022-10-17 16:22:46
 */
public interface BooktapServiceReader extends IService<Booktap> {

    ResponseResult<String> addBookmark(String bookId, String value, String token);
}
