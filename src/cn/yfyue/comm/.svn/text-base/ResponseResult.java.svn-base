package cn.yfyue.comm;

import java.util.regex.Pattern;

/**
 * Created by Administrator on 2018/1/4.
 */
public class ResponseResult {

    public static final   int CODE_SUCCESS = 200;
    public static final   int CODE_FAIL = 400;
    public static final   int CODE_EXCEPTION = 500;
    public static final String NOT_LOGIN = "请登录后，再操作";
    public static final String LOGIN_FAILURE = "登陆失败";
    public static final String LOGIN_SUCCESS = "登陆成功";
    public static final String PARAM_IS_NULL = "参数为空";
    public static final String MESSAGE_SERVER = "服务器忙，响应超时";
    public static final String OPERATE_SUCCESS = "操作成功";
    public static final String OPERATE_FAILURE = "操作失败";
    public static final String QUERY_FAILURE = "查询失败";
    public static final String PARAMETER_FAILURE = "参数异常";
    public static final Pattern PATTERN_MOBILE = Pattern.compile("^[1][3,4,5,6,7,8,9][0-9]{9}$"); //验证手机号
    public static final Pattern PATTERN_NUMBER = Pattern.compile("^[0-9]{6}$"); //数字验证码
    /**
     * 响应码
     */
    public int code ;

    /**
     * 文本信息
     */
    public String message;

    /**
     * 结构化信息
     */
    public Object data;

    public ResponseResult(){

    }

    public ResponseResult(int code, String message, Object object){
        this.code = code ;
        this.message = message;
        this.data = object;
    }

    @Override
    public String toString() {
        return JsonUtil.toJson(this);
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public void setSuccess(String message){
        this.message = message;
        this.code = CODE_SUCCESS;
    }

    public void setSuccess(int code,String message){
        this.message = message;
        this.code = code;
    }


    public void setSuccess(Object object){
        this.data = object;
        this.code = CODE_SUCCESS;
    }

    public void setFailure(String message) {
        this.message = message;
        this.code = CODE_FAIL;
    }

    public void setException(String message) {
        this.message = message;
        this.code = CODE_EXCEPTION;
    }

    public void setFailure(Object object) {
        this.data = object;
        this.code = CODE_FAIL;
    }

    public void notLogin() {
        this.message = NOT_LOGIN;
        this.code = CODE_FAIL;
    }

    public void loginFailure() {
        this.code = CODE_FAIL;
        this.message = LOGIN_FAILURE;
    }



}
