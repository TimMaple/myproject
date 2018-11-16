package com.yuan.myproject.utils;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * 这是http请求的工具类
 * abstract是因为我不想让它实例化
 */
public abstract class HttpClientUtils {
    /**
     * 创建一个get请求
     * @param url
     * @return
     */
    public static String get(String url){
        String result="";
        try {
            //创建一个httpClient对象
            HttpClient httpClient = HttpClients.createDefault();
            //创建一个httpResponse对象 （用来获取响应结果）
            HttpResponse httpResponse = null;

            //创建一个httpGet对象
            HttpGet httpGet = new HttpGet(url);
            //设置头
            httpGet.setHeader("user-agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36");
            //执行访问
            httpResponse= httpClient.execute(httpGet);
            //获取响应结果
            HttpEntity httpEntity=httpResponse.getEntity();
            //将结果转成String对象
            result=EntityUtils.toString(httpEntity);

           // System.out.println(result);
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 创建一个post请求
     * @param url
     * @param list
     * @return
     */
    public static String post(String url, Map<String,String> params){
        String result="";
        try {
            //创建httpClient对象
            HttpClient httpClient = HttpClients.createDefault();
            //创建一个httpResponse对象
            HttpResponse httpResponse = null;
            //创建一个httpPost对象
            HttpPost httpPost = new HttpPost(url);//创建一个用户
            //设置头
            httpPost.setHeader("user-agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36");

            //额外设置参数
//            BasicNameValuePair userName = new BasicNameValuePair("userName", "wangWu123");//用户名
//            BasicNameValuePair password = new BasicNameValuePair("password", "123456");//密码
//            BasicNameValuePair phone = new BasicNameValuePair("phone", "13489765678");//电话号
//            BasicNameValuePair email = new BasicNameValuePair("email", "58758@qq.com");//邮件地址
            //将参数放到集合里面
//            List<BasicNameValuePair> list = new ArrayList<>();
//            list.add(userName);
//            list.add(password);
//            list.add(phone);
//            list.add(email);
            List<BasicNameValuePair> list = new ArrayList<>();
            Iterator<Map.Entry<String,String>> iterator=params.entrySet().iterator();
            while (iterator.hasNext()){
                Map.Entry<String,String> entry=iterator.next();
                BasicNameValuePair param=new BasicNameValuePair(entry.getKey(),entry.getValue());
                list.add(param);
            }

            //设置参数到httpPost对象里面
            httpPost.setEntity(new UrlEncodedFormEntity(list, "utf-8"));

            httpResponse=httpClient.execute(httpPost);
            //获取httpEntity
            HttpEntity httpEntity=httpResponse.getEntity();
            //将httpResponse转成String
             result=EntityUtils.toString(httpEntity);

            //System.out.println(result);

        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }
}
