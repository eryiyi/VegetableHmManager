package com.liangxunwang.unimanager.service.account;


import com.liangxunwang.unimanager.dao.EmpDao;
import com.liangxunwang.unimanager.model.Emp;
import com.liangxunwang.unimanager.service.SaveService;
import com.liangxunwang.unimanager.service.ServiceException;
import com.liangxunwang.unimanager.util.Constants;
import com.liangxunwang.unimanager.util.UUIDFactory;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by zhl on 2015/6/11.
 */
@Service("dataService")
public class DataService implements SaveService{

    @Autowired
    @Qualifier("empDao")
    private EmpDao empDao;

    public Object save(Object object) throws ServiceException {
        List<Emp> dataList = new ArrayList<Emp>();
        String filePath = (String) object;
        DataFormatter formatter = new DataFormatter();
        String account = filePath.substring(filePath.lastIndexOf("/")+1, filePath.lastIndexOf("."));
        try {
            InputStream inputStream = new FileInputStream(new File(filePath));
            HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
            HSSFSheet sheet = workbook.getSheetAt(0);
            Iterator<Row> rowIterator = sheet.rowIterator();
            while (rowIterator.hasNext()){
                Emp data = new Emp();
                Row row = rowIterator.next();
                if (row.getRowNum()>0) {
                    Iterator<Cell> cellIterator = row.cellIterator();
                    while (cellIterator.hasNext()) {
                        Cell cell = cellIterator.next();
                        switch (cell.getColumnIndex()) {
                            case 0:
                                data.setMm_emp_mobile(formatter.formatCellValue(cell));
                                break;
                            case 1:
                                data.setMm_emp_nickname(cell.getStringCellValue());
                                break;
//                            case 2:
//                                data.setMm_emp_card(formatter.formatCellValue(cell));
//                                break;
                            case 2:
                                data.setMm_emp_password(cell.getStringCellValue());
                                break;
                            case 3:
                                data.setMm_emp_type(formatter.formatCellValue(cell));
                                break;
                            case 4:
                                data.setMm_emp_company(cell.getStringCellValue());
                                break;
                            case 5:
                                data.setMm_emp_company_type(formatter.formatCellValue(cell));
                                break;
                            case 6:
                                data.setMm_emp_company_address(cell.getStringCellValue());
                                break;
                            case 7:
                                data.setMm_emp_company_detail(cell.getStringCellValue());
                                break;
                            case 8:
                                data.setMm_emp_company_url(cell.getStringCellValue());
                                break;
                            case 9:
                                data.setMm_emp_provinceId(formatter.formatCellValue(cell));
                                break;
                            case 10:
                                data.setMm_emp_cityId(formatter.formatCellValue(cell));
                                break;
                            case 11:
                                data.setMm_emp_countryId(formatter.formatCellValue(cell));
                                break;
                            case 12:
                                data.setMm_emp_regtime(formatter.formatCellValue(cell));
                                break;
                            case 13:
                                data.setMm_emp_beizhu(cell.getStringCellValue());
                                break;
                            case 14:
                                data.setMm_emp_msg_num(formatter.formatCellValue(cell));
                                break;
                            case 15:
                                data.setIs_login(formatter.formatCellValue(cell));
                                break;
                            case 16:
                                data.setIs_fabugongying(formatter.formatCellValue(cell));
                                break;
                            case 17:
                                data.setIs_fabuqiugou(formatter.formatCellValue(cell));
                                break;
                            case 18:
                                data.setIs_fabuqiugou_see(formatter.formatCellValue(cell));
                                break;
                            case 19:
                                data.setIs_fabugongying_see(formatter.formatCellValue(cell));
                                break;
                            case 20:
                                data.setIs_see_all(formatter.formatCellValue(cell));
                                break;
                            case 21:
                                data.setIs_use(formatter.formatCellValue(cell));
                                break;
                            case 22:
                                data.setIs_pic(formatter.formatCellValue(cell));
                                break;
                            case 23:
                                data.setIs_chengxin(formatter.formatCellValue(cell));
                                break;
                            case 24:
                                data.setIs_miaomu(formatter.formatCellValue(cell));
                                break;
                            case 25:
                                data.setIscheck(formatter.formatCellValue(cell));
                                break;
                        }
                    }
                    data.setMm_emp_id(UUIDFactory.random());
                    data.setMm_emp_cover(Constants.COVER_DEFAULT);//头像
                    data.setMm_level_id("358b1e94e2274685b0badf41e22b85c8");//默认VIP1
                    dataList.add(data);
                }
            }
            empDao.saveList(dataList);
            File file = new File(filePath);
            file.delete();
        } catch (Exception e) {
            throw new ServiceException("SAVE_ERROR");
        }
        return null;
    }

}
