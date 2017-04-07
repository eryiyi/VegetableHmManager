package com.liangxunwang.unimanager.mvc;

import com.liangxunwang.unimanager.baiduyun.model.HttpRestResponse;
import com.liangxunwang.unimanager.model.CityObj;
import com.liangxunwang.unimanager.model.CountryObj;
import com.liangxunwang.unimanager.model.Emp;
import com.liangxunwang.unimanager.model.tip.DataTip;
import com.liangxunwang.unimanager.query.CityQuery;
import com.liangxunwang.unimanager.query.CountryQuery;
import com.liangxunwang.unimanager.service.ListService;
import com.liangxunwang.unimanager.service.ServiceException;
import com.liangxunwang.unimanager.util.Constants;
import com.liangxunwang.unimanager.util.ControllerConstants;
import cz.msebera.android.httpclient.HttpRequest;
import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Created by zhl on 2016/6/10.
 */
@Controller
public class ChinaAreaController  extends ControllerConstants {
    @Autowired
    @Qualifier("cityService")
    private ListService cityService;

    @RequestMapping("/getAllCitys")
    @ResponseBody
    public String getAllCitys(CityQuery query,HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<CityObj> listCitysAll = (List<CityObj>) cityService.list(query);
        try {
            DataTip tip = new DataTip();
            tip.setData(listCitysAll);
            return reBack(toJSONString(tip), request, response);
        }catch (ServiceException e){
            return toJSONString(ERROR_1);
        }
    }


    @Autowired
    @Qualifier("countryService")
    private ListService countryService;

    @RequestMapping("/getAllCountrys")
    @ResponseBody
    public String getAllCountrys(CountryQuery query,HttpServletRequest request, HttpServletResponse response){
        List<CountryObj> listsCountryAll = (List<CountryObj>) countryService.list(query);
        try {
            DataTip tip = new DataTip();
            tip.setData(listsCountryAll);
            return reBack(toJSONString(tip), request, response);
        }catch (ServiceException e){
            return toJSONString(ERROR_1);
        } catch (UnsupportedEncodingException e) {
            return toJSONString(ERROR_1);
        } catch (IOException e) {
            return toJSONString(ERROR_1);
        }
    }

}
