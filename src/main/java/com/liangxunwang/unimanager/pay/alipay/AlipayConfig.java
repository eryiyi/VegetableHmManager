package com.liangxunwang.unimanager.pay.alipay;

/**
 * Created by zhl on 2016/7/27.
 */
public class AlipayConfig {
    //↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
    // 合作身份者ID，以2088开头由16位纯数字组成的字符串
    public static String partner = "2088421398530212";
    // 商户的私钥
    public static String private_key = "\n" +
            "MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBALfaqiOS8fV3U8l3" +
            "HX3cOy3cRjuLFpIMBQOcNeF3XmJ75XDBXajdKdxYTJ/23j7UKBUTeJyUMgFdehwK" +
            "PyyuDCOfggOszqdd8LC15nj+yXzatwXQ8E3aA77NWaNxGKw23JN7Q8XVIhXWuHKi" +
            "guTM4HdsJ3RSHhSfaQpbZQVxVpgBAgMBAAECgYAFp9RUA9Etm94X9HITzRKE9qGy" +
            "czTeiUAePE/r/6AHp4gHT+txplwDSzQQN6fehug0vcSYDHb9U8LN2gLXfQMih/9g" +
            "R714MgY0CYocfGw/JQkqa60YsAzVMfqFUQv+QNxe5CYMHSz62YVbzqFE5/4+u2dc" +
            "kzwgsnwS+Wtjk+OAAQJBAOzvjqtqe7ju5WDJZCiCc95tlBfY9Ve8nIqP8m5V5rf4" +
            "h54SyV2zWhI9ieUUixZyBTwMVFfZ+aVMwyEFwMGJzaECQQDGpbkuYB18k09tusrd" +
            "S6lUoODarSQLvE8cOILX7YbpOWlCJstLnHHMlKUvlIEr316tTOfGXgTN0nEyc/eS" +
            "dO5hAkEAq/GNT8iO0L5Np9d+4AcLnzdWaZgBNBKkZ8ne3UNpk8jAYm6vw1gM3X/b" +
            "OmuWJEvKkLFB5B9DlDoIwUYzhEBFAQJAeyohiQl6/tRvOP/J7C+PS7N79tnHMaeN" +
            "/VdkePEC5vP7uVJIVhcnz8qSKNAQztzt3NGEG1AL9nl2SevxIlNxwQJBAN6kNRO9" +
            "uoD6yZjb7CSVyrV7Os/V6I792jI6vHGwuFifSHGiRL7JWGdloH2N7iQhm0nPliSD" +
            "iqfFZ83jNeETt7w=";

    // 支付宝的公钥，无需修改该值
    public static String ali_public_key  = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB";

    //↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑


    // 调试用，创建TXT日志文件夹路径
    public static String log_path = "D:\\";

    // 字符编码格式 目前支持 gbk 或 utf-8
    public static String input_charset = "utf-8";

    // 签名方式 不需修改
    public static String sign_type = "RSA";
}
