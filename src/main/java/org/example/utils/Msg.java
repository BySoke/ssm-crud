package org.example.utils;

import java.util.HashMap;
import java.util.Map;


public class Msg {

    //状态码
    private int code;

    //提示信息
    private String msg;

    //用户要返回给浏览器的数据
    private Map<String, Object> extend = new HashMap<>();

    public static Msg success() {
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("请求处理成功");
        return result;
    }

    public static Msg fail() {
        Msg result = new Msg();
        result.setCode(400);
        result.setMsg("请求处理失败");
        return result;
    }

    public Msg add(String key, Object value) {
        Map<String, Object> map = this.getExtend();
        map.put(key, value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }


}
