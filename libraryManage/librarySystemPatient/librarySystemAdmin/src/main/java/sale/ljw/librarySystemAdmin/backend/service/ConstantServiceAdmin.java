package sale.ljw.librarySystemAdmin.backend.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.github.pagehelper.PageInfo;
import sale.ljw.backend.form.EditConstant;
import sale.ljw.backend.form.QueryMessages;
import sale.ljw.backend.pojo.Constant;
import sale.ljw.common.common.http.ResponseResult;

import java.util.ArrayList;
import java.util.Map;

/**
 * @author 86155
 * @description 针对表【Constant】的数据库操作Service
 * @createDate 2022-10-17 16:27:38
 */
public interface ConstantServiceAdmin extends IService<Constant> {

    ResponseResult<ArrayList<Map<String, Object>>> getBookStatus();

    ResponseResult<PageInfo<Map<String, Object>>> findAllConstant(QueryMessages page);

    ResponseResult<String> editConstant(EditConstant editConstant);

    ResponseResult<ArrayList<Map<String, Object>>> findfloorStatus();

}
