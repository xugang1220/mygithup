package cn.yfyue.lxc.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.yfyue.comm.ReturnJson;
import cn.yfyue.comm.SetSys;
import cn.yfyue.lxc.ajax.CodeToStr;

//配置数据接口
@Controller
public class SetSysController{
	
	@RequestMapping(value = "/setSys/loadInitData", method = { RequestMethod.GET})
    public @ResponseBody ReturnJson loadInitData(HttpServletResponse response){
		//跨域请求
		CodeToStr co=new CodeToStr();
		co.setScoreHttp(response);
		ReturnJson result = new ReturnJson();
        result.setObject(SetSys.loadCatchInitData(null));
        result.setState(0);
        result.setMessage("基础数据加载成功");
        return result;
    }

}
