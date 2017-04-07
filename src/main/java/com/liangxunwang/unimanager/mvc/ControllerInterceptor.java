package com.liangxunwang.unimanager.mvc;

import com.liangxunwang.unimanager.util.ControllerConstants;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 *
 */
public class ControllerInterceptor extends ControllerConstants implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        String uri = request.getRequestURI();
        Object account = request.getSession().getAttribute(ACCOUNT_KEY);

        if(uri.contains(".json")){
                return true;
        }

        if(uri.matches("(^/$)|(^/index\\.do$)|(^/adminLogin\\.do$)|(^/logout\\.do$)" +
                        "|(^/uploadImage\\.do$)" +
                        "|(^/uploadFileXls\\.do$)" +
                        "|(^/uploadUnCompressImage\\.do$)" +
                        "|(^/getMemberInfoById\\.do$)"+
                        "|(^/getMemberByMobile\\.do$)"+
                        "|(^/getCity\\.do$)"+
                        "|(^/getCountry\\.do$)"+
                        "|(^/getProvince\\.do$)"+
                        "|(^/memberRegister\\.do$)"+
                        "|(^/recordList\\.do$)"+
                        "|(^/sendRecord\\.do$)"+
                        "|(^/getRecordById\\.do$)"+
                        "|(^/viewRecord\\.do$)"+
                        "|(^/recordListById\\.do$)"+
                        "|(^/sendLocation\\.do$)"+
                        "|(^/getFuwuByLocationAndType\\.do$)"+
                        "|(^/getAboutUs\\.do$)"+
                        "|(^/suggest/addSuggest\\.do$)"+
                        "|(^/updatePwr\\.do$)"+
                        "|(^/updatePwrApp\\.do$)"+
                        "|(^/getEmpAd\\.do$)"+
                        "|(^/getNearby\\.do$)"+
                        "|(^/getTopMsg\\.do$)"+
                        "|(^/getVipList\\.do$)"+
                        "|(^/getLevelById\\.do$)"+
                        "|(^/saveReport\\.do$)"+
                        "|(^/getNearbyDistance\\.do$)"+
                        "|(^/webv/toIndex\\.do$)"+
                        "|(^/webvSell/toSell\\.do$)"+
                        "|(^/webvRecommend/toRecommend\\.do$)"+
                        "|(^/webvProfile/toProfile\\.do$)"+
                        "|(^/saveFavour\\.do$)"+
                        "|(^/getFavourById\\.do$)"+
                        "|(^/getKefuTel\\.do$)"+
                        "|(^/updatePushId\\.do$)"+
                        "|(^/getHotCitys\\.do$)"+
                        "|(^/webvLoginController/toLogin\\.do$)"+
                        "|(^/webvRegController/toReg\\.do$)"+
                        "|(^/webvFindPwrController/toFindPwr\\.do$)"+
                        "|(^/webvLoginController/login\\.do$)"+
                        "|(^/webvRecordController/toDetail\\.do$)"+
                        "|(^/webvRegController/empReg\\.do$)"+
                        "|(^/webvRegController/findPwr\\.do$)"+
                        "|(^/webvServiceController/toService\\.do$)"+
                        "|(^/webvUpdatePwrController/toFindPwr\\.do$)"+
                        "|(^/webvUpdatePwrController/findPwr\\.do$)"+
                        "|(^/webvSuggestController/toSuggest\\.do$)"+
                        "|(^/webvSuggestController/addSuggest\\.do$)"+
                        "|(^/webvNearbyController/nearby\\.do$)"+
                        "|(^/webvMineFavourController/favour\\.do$)"+
                        "|(^/webvAboutUsController/toAboutUs\\.do$)"+
                        "|(^/webvFuwuCenterController/toCenter\\.do$)"+
                        "|(^/webvReportController/toReport\\.do$)"+
                        "|(^/webvReportController/addReport\\.do$)"+
                        "|(^/webvSelectProvinceController/toSelectProvince\\.do$)"+
                        "|(^/webvSelectProvinceController/toSelectCity\\.do$)"+
                        "|(^/webvSelectProvinceController/toSelectArea\\.do$)"+
                        "|(^/webvKefuController/toKefu\\.do$)"+
                        "|(^/getFavourCount\\.do$)"+
                        "|(^/deleteFavour\\.do$)"+
                        "|(^/getLoginAd\\.do$)"+
                        "|(^/memberUpdateProfile\\.do$)"+
                        "|(^/getKefuWeixin\\.do$)"+
                        "|(^/getPaihangs\\.do$)"+
                        "|(^/saveGuanzhuArea\\.do$)"+
                        "|(^/getGuanzhuArea\\.do$)"+
                        "|(^/getNotices\\.do$)"+
                        "|(^/getNoticesDetail\\.do$)"+
                        "|(^/addCompanyLocation\\.do$)"+
                        "|(^/getFuwuType\\.do$)"+

                        "|(^/webvWeixinController/toKefu\\.do$)"+
                        "|(^/webvNoticeController/list\\.do$)"+
                        "|(^/webvNoticeController/toDetail\\.do$)"+
                        "|(^/webvAddRecordController/toAddRecord\\.do$)"+
                        "|(^/webvAddRecordController/addRecord\\.do$)"+
                        "|(^/webvTopController/toTop\\.do$)"+
                        "|(^/webvLoginController/toQuite\\.do$)"+
                        "|(^/webvGuanzhuController/toGuanzhu\\.do$)"+
                        "|(^/webvGuanzhuController/guanzhu\\.do$)"+
                        "|(^/webvGuanzhuController/webvGetGuanzhu\\.do$)"+
                        "|(^/webvGuanzhuController/guanzhuArea\\.do$)"+
                        "|(^/webvGuanzhuController/saveGuanzhuArea\\.do$)"+
                        "|(^/pictureUploadController/uploadPic\\.do$)"+
                        "|(^/webvProfile/webMemberUpdateProfile\\.do$)"+
                        "|(^/webvProfile/toUpdateProfile\\.do$)"+
                        "|(^/webvHotController/toIndex\\.do$)"+
                        "|(^/webvHotSController/toSell\\.do$)"+
                        "|(^/webvShangquanController/toShangquan\\.do$)"+
                        "|(^/toShareMp\\.do$)"+
                        "|(^/uploadCover\\.do$)"+


                        "|(^/hmtIndex/toIndex\\.do$)"+
                        "|(^/netLoginController/toLogin\\.do$)"+
                        "|(^/netLoginController/login\\.do$)"+
                        "|(^/netLoginController/toQuite\\.do$)"+
                        "|(^/netRegController/toReg\\.do$)"+
                        "|(^/netRegController/empReg\\.do$)"+
                        "|(^/netRecordController/toDetail\\.do$)"+
                        "|(^/netTopController/toTop\\.do$)"+
                        "|(^/netServiceController/toService\\.do$)"+
                        "|(^/netCenterController/toCenter\\.do$)"+
                        "|(^/netAddRecordController/toAddRecord\\.do$)"+
                        "|(^/netAddRecordController/addRecord\\.do$)"+
                        "|(^/netKefuController/toKefu\\.do$)"+
                        "|(^/netAboutUsController/toAboutUs\\.do$)"+
                        "|(^/netAboutUsController/toXieyie\\.do$)"+
                        "|(^/netAboutUsController/toLegal\\.do$)"+
                        "|(^/netAboutUsController/toLink\\.do$)"+
                        "|(^/netAboutUsController/toPrivacy\\.do$)"+
                        "|(^/netWeixinController/toKefu\\.do$)"+
                        "|(^/netNoticeController/list\\.do$)"+
                        "|(^/netNoticeController/toDetail\\.do$)"+
                        "|(^/netMineFavourController/favour\\.do$)"+
                        "|(^/netNearbyController/nearby\\.do$)"+
                        "|(^/netFuwuCenterController/toCenter\\.do$)"+
                        "|(^/netUpdatePwrController/toFindPwr\\.do$)"+
                        "|(^/netUpdatePwrController/findPwr\\.do$)"+
                        "|(^/netCenterController/toAddArea\\.do$)"+
                        "|(^/netCenterController/toGuanzhu\\.do$)"+
                        "|(^/netCenterController/toSelectArea\\.do$)"+

                        "|(^/netGuanzhuController/webvGetGuanzhu\\.do$)"+
                        "|(^/netGuanzhuController/toGuanzhu\\.do$)"+
                        "|(^/netGuanzhuController/guanzhuArea\\.do$)"+
                        "|(^/netGuanzhuController/saveGuanzhuArea\\.do$)"+

                        "|(^/netProfileController/toProfile\\.do$)"+
                        "|(^/netProfileController/webMemberUpdateProfile\\.do$)"+
                        "|(^/netProfileController/toUpdateProfile\\.do$)"+

                        "|(^/netSelectProvinceController/toSelectProvince\\.do$)"+
                        "|(^/netSelectProvinceController/toSelectCity\\.do$)"+
                        "|(^/netSelectProvinceController/toSelectArea\\.do$)"+

                        "|(^/getAllCitys\\.do$)"+
                        "|(^/getAllCountrys\\.do$)"+
                        "|(^/orderSave\\.do$)"+
                        "|(^/getNetwwwObjByType\\.do$)"+
                        "|(^/orderUpdate\\.do$)"+
                        "|(^/orderSaveWx\\.do$)"+
                        "|(^/orderSaveWxFk\\.do$)"+
                        "|(^/getVersionCode\\.do$)"+

                        "|(^/memberLogin\\.do$)"

        ) || account != null) {
            return true;
        }

        if("true".equals(request.getParameter("j"))) {
            PrintWriter out = response.getWriter();
            out.print(toJSONString(TIMEOUT));
            out.close();
        } else {
            request.getRequestDispatcher("/WEB-INF/session.jsp").forward(request, response);
            return false;
        }
        return true;
    }
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
