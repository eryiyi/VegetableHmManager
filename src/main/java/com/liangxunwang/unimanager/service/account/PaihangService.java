package com.liangxunwang.unimanager.service.account;

import com.liangxunwang.unimanager.dao.PaihangObjDao;
import com.liangxunwang.unimanager.dao.RecordDao;
import com.liangxunwang.unimanager.model.PaihangObj;
import com.liangxunwang.unimanager.model.Record;
import com.liangxunwang.unimanager.mvc.vo.PaihangObjVO;
import com.liangxunwang.unimanager.mvc.vo.RecordVO;
import com.liangxunwang.unimanager.query.PaihangQuery;
import com.liangxunwang.unimanager.query.RecordQuery;
import com.liangxunwang.unimanager.service.*;
import com.liangxunwang.unimanager.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zhl on 2015/3/3.
 */
@Service("paihangService")
public class PaihangService implements ListService,DeleteService,ExecuteService,UpdateService,SaveService {
    @Autowired
    @Qualifier("paihangObjDao")
    private PaihangObjDao paihangObjDao;

    @Override
    public Object list(Object object) throws ServiceException {
        PaihangQuery query = (PaihangQuery) object;
        Map<String, Object> map = new HashMap<String, Object>();
        int index = (query.getIndex() - 1) * query.getSize();
        int size = query.getSize();

        map.put("index", index);
        map.put("size", size);

        if (!StringUtil.isNullOrEmpty(query.getIs_del())) {
            map.put("is_del", query.getIs_del());
        }

        if (!StringUtil.isNullOrEmpty(query.getKeyword())) {
            map.put("keyword", query.getKeyword());
        }

        //分地区管理
        if(!StringUtil.isNullOrEmpty(query.getMm_emp_provinceId())){
            map.put("mm_emp_provinceId", query.getMm_emp_provinceId());
        }
        if(!StringUtil.isNullOrEmpty(query.getMm_emp_cityId())){
            map.put("mm_emp_cityId", query.getMm_emp_cityId());
        }
        if(!StringUtil.isNullOrEmpty(query.getMm_emp_countryId())){
            map.put("mm_emp_countryId", query.getMm_emp_countryId());
        }

        List<PaihangObjVO> lists = paihangObjDao.listRecordVo(map);
        for (PaihangObjVO record : lists){
            if (!StringUtil.isNullOrEmpty(record.getMm_emp_cover())){
                if (record.getMm_emp_cover().startsWith("upload")){
                    record.setMm_emp_cover(Constants.URL+record.getMm_emp_cover());
                }else {
                    record.setMm_emp_cover(Constants.QINIU_URL + record.getMm_emp_cover());
                }
            }
//            record.setEnd_time(RelativeDateFormat.format(Long.parseLong(record.getEnd_time())));
            if(!StringUtil.isNullOrEmpty(record.getEnd_time())){
                record.setEnd_time(DateUtil.getDate(record.getEnd_time() , "yyyy-MM-dd"));
            }
        }
        long count = paihangObjDao.count(map);
        return new Object[]{lists, count};
    }


    @Override
    public Object delete(Object object) throws ServiceException {
        String mm_paihang_id = (String) object;
        paihangObjDao.deleteById(mm_paihang_id);
        return null;
    }

    @Override
    public Object execute(Object object) throws ServiceException {
        String mm_msg_id = (String) object;
        PaihangObj paihangObj = paihangObjDao.findById(mm_msg_id);
        if(!StringUtil.isNullOrEmpty(paihangObj.getEnd_time())){
            paihangObj.setEnd_time(DateUtil.getDate(paihangObj.getEnd_time() , "yyyy-MM-dd"));
        }
        return paihangObj;
    }

    @Override
    public Object update(Object object) {
        if (object instanceof PaihangObj){
            PaihangObj paihangObj = (PaihangObj) object;
            if(!StringUtil.isNullOrEmpty(paihangObj.getEnd_time())){
                paihangObj.setEnd_time(DateUtil.getMs(paihangObj.getEnd_time(), "yyyy-MM-dd") + "");
            }
            paihangObjDao.updateTop(paihangObj);
        }
        return null;
    }

    @Override
    public Object save(Object object) throws ServiceException {
        PaihangObj paihangObj = (PaihangObj) object;
        //先查询是否存在该用户 根据用户id
        PaihangObjVO paihangObjVO = paihangObjDao.findByEmpId(paihangObj.getMm_emp_id());
        if(paihangObjVO != null && !StringUtil.isNullOrEmpty(paihangObjVO.getMm_paihang_id())){
            //该用户已经添加到排行榜不能重复添加
            throw new ServiceException("Has_exist");
        }
        try {
            paihangObj.setMm_paihang_id(UUIDFactory.random());
            if(!StringUtil.isNullOrEmpty(paihangObj.getEnd_time())){
                paihangObj.setEnd_time(DateUtil.getMs(paihangObj.getEnd_time(), "yyyy-MM-dd") + "");
            }
            paihangObjDao.save(paihangObj);
        }catch (Exception e){
            throw new ServiceException(Constants.SAVE_ERROR);
        }
        return null;
    }
}
