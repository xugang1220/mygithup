package cn.yfyue.sysauth.ajax;

import jajax.annotation.AjaxClass;
import jajax.annotation.AjaxParam;
import java.util.List;
import javax.servlet.ServletRequest;

import org.springframework.web.context.ContextLoader;

import cn.yfyue.comm.Auth;
import cn.yfyue.comm.F;
import cn.yfyue.comm.L;
import cn.yfyue.comm.ReturnJson;
import cn.yfyue.comm.SetSys;
import cn.yfyue.sysauth.bll.Init;
import cn.yfyue.sysauth.db.model.BjInitData;
import cn.yfyue.sysauth.db.model.BjInitType;

@AjaxClass(value="SysInitAjax")
public class SysInitAjax{
	
private Init init=ContextLoader.getCurrentWebApplicationContext().getBean(Init.class);		

//类型列表
public String getInitTypeList(@AjaxParam("qkey") String qkey,
		@AjaxParam("page") String page,
		@AjaxParam("rows") String rows,
		ServletRequest request) {
	List dataList = null;
	ReturnJson returnJson=new ReturnJson();
	int nPage = F.fPage(page);
	int nRowNum=F.fRow(rows);	
	qkey=F.isNull(qkey);
	try {
		if (Auth.isAuth(request)) {
			
		// 取最大行数
		dataList = init.getInitTypeList(qkey, (nPage-1)* nRowNum, nRowNum);
		returnJson.setState(0);
		returnJson.setMessage("操作成功");
		returnJson.setObject(dataList);
		}else{
			returnJson.setState(-1);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return returnJson.getJson();
}	
//统计
public String getInitTypeCount(@AjaxParam("qkey") String qkey,
		ServletRequest request) {
    //L.printRequest(Thread.currentThread() .getStackTrace(), request);
	ReturnJson returnJson=new ReturnJson();
    int dataTotalRowNum=0;
    qkey=F.isNull(qkey);
	try {
		if (Auth.isAuth(request)) {
			
		// 取最大行数
		dataTotalRowNum = init.getInitTypeCount(qkey);
		returnJson.setState(0);
		returnJson.setMessage("操作成功");
		returnJson.setObject(dataTotalRowNum);
		}else{
			returnJson.setState(-1);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return returnJson.getJson();
}
//配置数据列表
public String getInitDataList(@AjaxParam("qkey") String qkey,
		@AjaxParam("typeCode") String typeCode,
		@AjaxParam("page") String page,
		@AjaxParam("rows") String rows,
		ServletRequest request) {
	List dataList = null;
	ReturnJson returnJson=new ReturnJson();
	int nPage = F.fPage(page);
	int nRowNum=F.fRow(rows);	
	qkey=F.isNull(qkey);
	typeCode=F.isNull(typeCode);
	//L.printRequest(null, request);
	try {
		if (Auth.isAuth(request)) {
			
			dataList = init.getInitDataList(typeCode, qkey, (nPage-1)* nRowNum, nRowNum);
			returnJson.setState(0);
			returnJson.setMessage("操作成功");
			returnJson.setObject(dataList);
		}else{
			returnJson.setState(-1);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return returnJson.getJson();
}
//配置数据统计
public String getInitDataCount(@AjaxParam("qkey") String qkey,
		@AjaxParam("typeCode") String typeCode,
		ServletRequest request) {
  ReturnJson returnJson=new ReturnJson();
  int dataTotalRowNum=0;
  qkey=F.isNull(qkey);
  typeCode=F.isNull(typeCode);
  try{
	 if (Auth.isAuth(request)) {
		
		// 取最大行数
		dataTotalRowNum = init.getInitDataCount(typeCode, qkey);
		returnJson.setState(0);
		returnJson.setMessage("操作成功");
		returnJson.setObject(dataTotalRowNum);
	   }else{
		   returnJson.setState(-1);
		   returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return returnJson.getJson();
}

//添加类型
public String addInitType(@AjaxParam("typeName") String typeName,
		@AjaxParam("typeCode") String typeCode, ServletRequest request) {
	ReturnJson returnJson=new ReturnJson();
	typeName = F.isNull(typeName);
	typeCode = F.isNull(typeCode);
	if(typeCode!=null){
		typeCode=typeCode.toUpperCase();
	}
	BjInitType bjInitType = null;
	try {
		if (Auth.isAuth(request)) {
			
		  if(typeName!=null && typeCode!=null){	
			if (init.isInitTypeCode(typeCode) == 0) {
				bjInitType = new BjInitType();
				bjInitType.setTypeCode(typeCode);
				bjInitType.setTypeName(typeName);
				bjInitType.setTypeState("0");
				if (init.addInitType(bjInitType) > 0) {
					returnJson.setState(0);
					returnJson.setMessage("添加成功");
				} else {
					returnJson.setState(-1);
					returnJson.setMessage("添加类型编码,保存失败");
				}
			} else {
				returnJson.setState(-1);
				returnJson.setMessage("类型编码已存在");
			}
		  }else{
			  returnJson.setState(-1);
			  returnJson.setMessage("对不起!数据格式错误");  
		  }
		} else {
			returnJson.setState(-1);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	L.opLog(Thread.currentThread() .getStackTrace(), request, "添加数据类型", returnJson.getMessage());
	return returnJson.getJson();
}
//取单个类型
public String getInitTypeInfo(
		 @AjaxParam("initTypeId") String initTypeId,
		ServletRequest request) {
	ReturnJson returnJson=new ReturnJson();
	initTypeId = F.isNull(initTypeId);
	BjInitType bjInitType = null;
	try {
		if (Auth.isAuth(request)) {
		  if(initTypeId!=null){	
			
			bjInitType=init.getInitTypeInfo(initTypeId);
			if(bjInitType!=null){
				returnJson.setState(0);
				returnJson.setMessage("查询成功");
				returnJson.setObject(bjInitType);
			}else{
				returnJson.setState(-1);
				returnJson.setMessage("对不起!获取数据失败");
			}
		  }else{
			  returnJson.setState(-1);
			  returnJson.setMessage("对不起!数据格式错误");  
		  }
		} else {
			returnJson.setState(-1);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return returnJson.getJson();
}
//更新
public String upInitType(@AjaxParam("initTypeId") String initTypeId,
		@AjaxParam("typeName") String typeName, ServletRequest request) {
	ReturnJson returnJson=new ReturnJson();
	typeName = F.isNull(typeName);
	initTypeId = F.isNull(initTypeId);
	BjInitType bjInitType = null;
	try {
		if (Auth.isAuth(request)) {
			
		  if(typeName!=null && initTypeId!=null){	
				bjInitType = new BjInitType();
				bjInitType.setTypeName(typeName);
				bjInitType.setInitTypeId(initTypeId);
				if (init.upInitType(bjInitType) > 0) {
					returnJson.setState(0);
					returnJson.setMessage("更新成功");
				} else {
					returnJson.setState(-1);
					returnJson.setMessage("更新数据,保存失败");
				}
			} else {
				returnJson.setState(-1);
				returnJson.setMessage("类型编码已存在");
			}
		} else {
			returnJson.setState(-1);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	L.opLog(Thread.currentThread() .getStackTrace(), request, "更新数据类型", returnJson.getMessage());
	return returnJson.getJson();
}
//删除
public String delInitType(
		 @AjaxParam("initTypeId") String initTypeId,
		ServletRequest request) {
	ReturnJson returnJson=new ReturnJson();
	initTypeId = F.isNull(initTypeId);
	BjInitType bjInitType = null;
	try {
		if (Auth.isAuth(request)) {
		  if(initTypeId!=null){	
			
			bjInitType=init.getInitTypeInfo(initTypeId);
			if(bjInitType!=null){
              if(init.getInitTypeIsChild(bjInitType.getTypeCode())==0){
            	  if(init.delInitType(initTypeId)>0){
            		  returnJson.setState(0);
            		  returnJson.setMessage("数据删除成功");  
            	  }else{
            		  returnJson.setState(-1);
            		  returnJson.setMessage("对不起!删除失败");  
            	  }
              }else{
            	  returnJson.setState(-1);
            	  returnJson.setMessage("对不起!还配置有数据,暂不能删除");  
              }
			}else{
				returnJson.setState(-1);
				returnJson.setMessage("对不起!获取数据失败");
			}
		  }else{
			  returnJson.setState(-1);
			  returnJson.setMessage("对不起!数据格式错误");  
		  }
		} else {
			returnJson.setState(-1);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	L.opLog(Thread.currentThread() .getStackTrace(), request, "删除数据类型", returnJson.getMessage());
	return returnJson.getJson();
}
//添加数据
public String addInitData(@AjaxParam("dataCode")String dataCode,
		 @AjaxParam("dataName")String dataName,
		 @AjaxParam("dataTypeCode")String dataTypeCode,
		ServletRequest request) {
	L.printRequest(null, request);
	ReturnJson returnJson=new ReturnJson();
	//typeCode = F.isNull(typeCode);
	dataCode = F.isNull(dataCode);
	dataName = F.isNull(dataName);
	BjInitData bjInitData=null;
	try {
		if (Auth.isAuth(request)) {
		  if(dataTypeCode!=null && dataCode!=null && dataName!=null){	
			if(dataCode!=null){
			  dataCode=dataCode.toUpperCase();
			}  
			bjInitData=new BjInitData();
			bjInitData.setDataCode(dataTypeCode+"_"+dataCode);
			bjInitData.setDataState("0");
			bjInitData.setTypeCode(dataTypeCode);
			bjInitData.setDataName(dataName);
			
			if(init.addInitData(bjInitData)>0){
				returnJson.setState(0);
				returnJson.setMessage("数据添加成功");	
			}else{
				returnJson.setState(-1);
				returnJson.setMessage("对不起!数据保存失败");	
			}

		  }else{
			  returnJson.setState(-1);
			  returnJson.setMessage("对不起!数据格式错误");  
		  }
		} else {
			returnJson.setState(-1);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	L.opLog(Thread.currentThread() .getStackTrace(), request, "添加数据", returnJson.getMessage());
	return returnJson.getJson();
}
//取单个数据
public String getInitDataInfo(@AjaxParam("initDataId") String initDataId,
		ServletRequest request) {
	ReturnJson returnJson=new ReturnJson();
	initDataId = F.isNull(initDataId);
	BjInitData bjInitData = null;
	try {
		if (Auth.isAuth(request)) {
		  if(initDataId!=null){	
			bjInitData=init.getInitDataInfo(initDataId);
			if(bjInitData!=null){
				returnJson.setState(0);
				returnJson.setMessage("查询成功");
				returnJson.setObject(bjInitData);
			}else{
				returnJson.setState(-1);
				returnJson.setMessage("对不起!获取数据失败");
			}
		  }else{
				returnJson.setState(-1);
				returnJson.setMessage("对不起!数据格式错误");  
		  }
		} else {
			returnJson.setState(-1);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return returnJson.getJson();
}
//更新
public String upInitData(@AjaxParam("initDataId") String initDataId,
		@AjaxParam("dataName") String dataName, 
		ServletRequest request) {
	ReturnJson returnJson=new ReturnJson();
	dataName = F.isNull(dataName);
	initDataId = F.isNull(initDataId);
	BjInitData bjInitData = null;
	try {
		if (Auth.isAuth(request)) {
			
		  if(initDataId!=null && dataName!=null){	
			  bjInitData = new BjInitData();
			  bjInitData.setInitDataId(initDataId);
			  bjInitData.setDataName(dataName);
				if (init.upInitData(bjInitData)> 0) {
					returnJson.setState(0);
					returnJson.setMessage("更新成功");
				} else {
					returnJson.setState(-1);
					returnJson.setMessage("更新数据,保存失败");
				}
			} else {
				returnJson.setState(-1);
				returnJson.setMessage("类型编码已存在");
			}
		} else {
			returnJson.setState(-1);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	L.opLog(Thread.currentThread() .getStackTrace(), request, "更新数据", returnJson.getMessage());
	return returnJson.getJson();
}
//禁用
public String delInitData(@AjaxParam("initDataId") String initDataId,
		ServletRequest request) {
	ReturnJson returnJson=new ReturnJson();
	initDataId = F.isNull(initDataId);
	try {
		if (Auth.isAuth(request)) {
		  if(initDataId!=null){	
			
           	  if(init.delInitData(initDataId)>0){
     				returnJson.setState(0);
     				returnJson.setMessage("数据删除成功");  
           	  }else{
   				returnJson.setState(-1);
     			returnJson.setMessage("对不起!删除失败");  
           	  }
		  }else{
				returnJson.setState(-1);
				returnJson.setMessage("对不起!数据格式错误");  
		  }
		} else {
			returnJson.setState(-1);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	L.opLog(Thread.currentThread() .getStackTrace(), request, "禁用数据", returnJson.getMessage());
	return returnJson.getJson();
}

//类型列表
public String getInitTypeAllList(ServletRequest request) {
	List dataList = null;
	ReturnJson returnJson=new ReturnJson();
	try {
		if (Auth.isAuth(request)) {
		// 取最大行数
		dataList = init.getInitTypeList(null, 0, 10000);
		returnJson.setState(0);
		returnJson.setMessage("操作成功");
        returnJson.setObject(dataList);
		}else{
			returnJson.setState(-1);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return returnJson.getJson();
}

//配置数据列表
public String LoadInitData(@AjaxParam("typeCode") String typeCode,
		ServletRequest request) {
	List<BjInitData> dataList = null;
	ReturnJson returnJson=new ReturnJson();
	typeCode=F.isNull(typeCode);
	try {
		if (Auth.isAuth(request)) {
		  
		  dataList = SetSys.loadCatchInitData(typeCode);
		  returnJson.setState(0);
		  returnJson.setMessage("操作成功");
          returnJson.setObject(dataList);
		}else{
			returnJson.setState(-1);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return returnJson.getJson();
}
}
