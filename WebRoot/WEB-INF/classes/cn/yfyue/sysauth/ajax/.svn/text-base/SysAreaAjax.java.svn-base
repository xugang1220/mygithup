package cn.yfyue.sysauth.ajax;

import java.util.List;

import jajax.annotation.AjaxClass;
import jajax.annotation.AjaxParam;

import javax.servlet.ServletRequest;

import org.springframework.web.context.ContextLoader;

import cn.yfyue.comm.Auth;
import cn.yfyue.comm.F;
import cn.yfyue.comm.L;
import cn.yfyue.comm.ReturnJson;
import cn.yfyue.sysauth.bll.Area;
import cn.yfyue.sysauth.db.model.BjArea;
import cn.yfyue.sysauth.wrap.AreaUtil;

@AjaxClass(value="SysAreaAjax")
public class SysAreaAjax{
	
	private Area area = ContextLoader.getCurrentWebApplicationContext().getBean(Area.class);
	
	// 取列表
	public String getAreaList(@AjaxParam("areaCode") String areaCode, ServletRequest request) {
		L.printRequest(null, request);
		ReturnJson returnJson = new ReturnJson();
		List<BjArea> dataList = null;
		areaCode = F.isNull(areaCode);
		try {
			if (Auth.isAuth(request)) {
				// 取最大行数
				dataList = area.getAreaList(areaCode);
				returnJson.setState(0);
				returnJson.setMessage("操作成功");
				returnJson.setObject(AreaUtil.getAreaChildNodes(dataList, areaCode));
			} else {
				returnJson.setState(-1);
				returnJson.setMessage("请登录,再操作");
			}
		} catch (Exception e) {
			returnJson.setState(-1);
			returnJson.setMessage(e.toString());
			e.printStackTrace();
		}
		return returnJson.getJson();
	}

	// 添加一级
	public String addOneArea(@AjaxParam("areaCode") String areaCode, @AjaxParam("areaName") String areaName,
			ServletRequest request) {
		L.printRequest(null, request);
		ReturnJson returnJson = new ReturnJson();
		areaCode = F.isNull(areaCode);
		areaName = F.isNull(areaName);
		BjArea bjArea = null;
		String levelStr = "1";
		String fullNameStr = "";
		String supperCode = "0";
		try {
			if (Auth.isAuth(request)) {
				if (areaCode != null && areaName != null) {
					// 入库
					if (area.isAreaCode(areaCode) == 0) {
						bjArea = new BjArea();
						bjArea.setAreaCode(areaCode);
						bjArea.setAreaLevel(F.StrToInt(levelStr));
						bjArea.setAreaName(areaName);
						bjArea.setFullName(fullNameStr + areaName);
						bjArea.setSupperCode(supperCode);
						if (area.addArea(bjArea) > 0) {
							returnJson.setState(0);
							returnJson.setMessage("添加成功");
						} else {
							returnJson.setState(-1);
							returnJson.setMessage("对不起!数据保存失败");
						}
					} else {
						returnJson.setState(-1);
						returnJson.setMessage("对不起!地区编码已存在,请编辑其它编码");
					}
				} else {
					returnJson.setState(-1);
					returnJson.setMessage("对不起!数据格式错误");
				}
			} else {
				returnJson.setState(-1);
				returnJson.setMessage("请登录,再操作");
			}
		} catch (Exception e) {
			returnJson.setState(-1);
			returnJson.setMessage(e.toString());
			e.printStackTrace();
		}
		L.opLog(Thread.currentThread().getStackTrace(), request, "添加省级地区", returnJson.getMessage());
		return returnJson.getJson();
	}

	// 添加
	public String addArea(@AjaxParam("areaCode") String areaCode, @AjaxParam("supperCode") String supperCode,
			@AjaxParam("areaName") String areaName, ServletRequest request) {
		L.printRequest(null, request);
		ReturnJson returnJson = new ReturnJson();
		areaCode = F.isNull(areaCode);
		supperCode = F.isNull(supperCode);
		areaName = F.isNull(areaName);
		BjArea superiorArea = null;
		BjArea bjArea = null;
		String levelStr = "1";
		int nOpFlag = 0;
		String fullNameStr = "";
		try {
			if (Auth.isAuth(request)) {
				if (areaCode != null && supperCode != null && areaName != null) {
					superiorArea = area.getAreaInfo(supperCode);
					if (superiorArea != null) {
						if (superiorArea.getAreaLevel() != null) {
							if ((superiorArea.getAreaLevel() + 1) < 7) {
								levelStr = "" + (superiorArea.getAreaLevel() + 1);
								supperCode = superiorArea.getAreaCode();
								fullNameStr = superiorArea.getFullName();
								nOpFlag = 0;
							} else {
								nOpFlag = -1;
								returnJson.setState(-1);
								returnJson.setMessage("对不起!只支持6层结构[省,市,县,镇,村,组]");
							}
						} else {
							nOpFlag = -1;
							returnJson.setState(-1);
							returnJson.setMessage("对不起!获取数据异常");
						}
					} else {
						nOpFlag = -1;
						returnJson.setState(-1);
						returnJson.setMessage("对不起!获取数据失败");
					}

					if (nOpFlag == 0) {
						// 入库
						if (area.isAreaCode(supperCode + areaCode) == 0) {
							bjArea = new BjArea();
							bjArea.setAreaCode(supperCode + areaCode);
							bjArea.setAreaLevel(F.StrToInt(levelStr));
							bjArea.setAreaName(areaName);
							bjArea.setFullName(fullNameStr + areaName);
							bjArea.setSupperCode(supperCode);

							if (area.addArea(bjArea) > 0) {
								returnJson.setState(0);
								returnJson.setMessage("添加成功");
							} else {
								returnJson.setState(-1);
								returnJson.setMessage("对不起!数据保存失败");
							}
						} else {
							returnJson.setState(-1);
							returnJson.setMessage("对不起!地区编码已存在,请编辑其它编码");
						}
					}
				} else {
					returnJson.setState(-1);
					returnJson.setMessage("对不起!数据格式错误");
				}
			} else {
				returnJson.setState(-1);
				returnJson.setMessage("请登录,再操作");
			}
		} catch (Exception e) {
			returnJson.setState(-1);
			returnJson.setMessage(e.toString());
			e.printStackTrace();
		}
		L.opLog(Thread.currentThread().getStackTrace(), request, "添加地区", returnJson.getMessage());
		return returnJson.getJson();
	}

	// 取单个类型
	public String getAreaInfo(@AjaxParam("areaCode") String areaCode, ServletRequest request) {
		L.printRequest(null, request);
		ReturnJson returnJson = new ReturnJson();
		BjArea bjArea = null;
		areaCode = F.isNull(areaCode);
		try {
			if (Auth.isAuth(request)) {
				if (areaCode != null) {
					bjArea = area.getAreaInfo(areaCode);
					if (bjArea != null) {
						returnJson.setState(0);
						returnJson.setMessage("操作成功");
						returnJson.setObject(bjArea);
					} else {
						returnJson.setState(-1);
						returnJson.setMessage("对不起!数据获取失败");
					}
				} else {
					returnJson.setState(-1);
					returnJson.setMessage("对不起!数据格式错误");
				}

			} else {
				returnJson.setState(-1);
				returnJson.setMessage("请登录,再操作");
			}
		} catch (Exception e) {
			returnJson.setState(-1);
			returnJson.setMessage(e.toString());
			e.printStackTrace();
		}
		return returnJson.getJson();
	}

	// 更新
	public String upArea(@AjaxParam("areaCode") String areaCode, @AjaxParam("areaName") String areaName,
			ServletRequest request) {
		L.printRequest(null, request);
		ReturnJson returnJson = new ReturnJson();
		areaCode = F.isNull(areaCode);
		areaName = F.isNull(areaName);
		BjArea superiorArea = null;
		BjArea bjArea = null;
		String fullNameStr = "";
		try {
			if (Auth.isAuth(request)) {
				if (areaCode != null && areaName != null) {
					bjArea = area.getAreaInfo(areaCode);
					if (bjArea != null) {
						if (bjArea.getSupperCode() != null && bjArea.getSupperCode().equals("0")) {
							fullNameStr = "";
						} else {
							superiorArea = area.getAreaInfo(bjArea.getSupperCode());
							if (superiorArea != null) {
								fullNameStr = superiorArea.getFullName();
							} else {
								returnJson.setState(-1);
								returnJson.setMessage("对不起!获取上级地区信息失败");
							}
						}
						// 更新
						bjArea = new BjArea();
						bjArea.setAreaCode(areaCode);
						bjArea.setAreaName(areaName);
						bjArea.setFullName(fullNameStr + areaName);
						if (area.upArea(bjArea) > 0) {
							returnJson.setState(0);
							returnJson.setMessage("地区数据更新成功");
						} else {
							returnJson.setState(-1);
							returnJson.setMessage("对不起!数据保存失败");
						}
					} else {
						returnJson.setState(-1);
						returnJson.setMessage("对不起!获取地区信息失败");
					}
				} else {
					returnJson.setState(-1);
					returnJson.setMessage("对不起!数据格式错误");
				}

			} else {
				returnJson.setState(-1);
				returnJson.setMessage("请登录,再操作");
			}
		} catch (Exception e) {
			returnJson.setState(-1);
			returnJson.setMessage(e.toString());
			e.printStackTrace();
		}
		L.opLog(Thread.currentThread().getStackTrace(), request, "更新地区", returnJson.getMessage());
		return returnJson.getJson();
	}

	// 删除
	public String delArea(@AjaxParam("areaCode") String areaCode, ServletRequest request) {
		L.printRequest(null, request);
		ReturnJson returnJson = new ReturnJson();
		areaCode = F.isNull(areaCode);
		try {
			if (Auth.isAuth(request)) {
				if (areaCode != null) {
					if (area.getAreaIsChild(areaCode) == 0) {
						if (area.delArea(areaCode) > 0) {
							returnJson.setState(0);
							returnJson.setMessage("地区已删除");
						} else {
							returnJson.setState(-1);
							returnJson.setMessage("对不起,地区删除失败");
						}
					} else {
						returnJson.setState(-1);
						returnJson.setMessage("对不起,有下级地区,暂不能删除");
					}
				} else {
					returnJson.setState(-1);
					returnJson.setMessage("对不起!数据格式错误");
				}

			} else {
				returnJson.setState(-1);
				returnJson.setMessage("请登录,再操作");
			}
		} catch (Exception e) {
			returnJson.setState(-1);
			returnJson.setMessage(e.toString());
			e.printStackTrace();
		}
		L.opLog(Thread.currentThread().getStackTrace(), request, "删除地区", returnJson.getMessage());
		return returnJson.getJson();
	}
	// 取省目录列表
	public String getFirstAreaList(ServletRequest request) {
		ReturnJson returnJson = new ReturnJson();
		List<BjArea> dataList = null;
		try {
			if (Auth.isAuth(request)) {
				dataList = area.getFirstAreaList();
				returnJson.setState(0);
				returnJson.setMessage("操作成功");
				returnJson.setObject(AreaUtil.getAreaChildNodes(dataList, null));
			} else {
				returnJson.setState(-997);
				returnJson.setMessage("请登录,再操作");
			}
		} catch (Exception e) {
			returnJson.setState(-1);
			returnJson.setMessage(e.toString());
			e.printStackTrace();
		}
		return returnJson.getJson();
	}
}
