package cn.yfyue.lxc.bll;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import cn.yfyue.comm.SetSys;
import cn.yfyue.sysauth.db.model.BjInitData;

@Component
public class ClassifyDataFindName {

	public String findName(String typeCode,String dataCode){
		List<BjInitData> dataList=SetSys.loadCatchInitData(typeCode);
		for(BjInitData data:dataList){
			if(data.getDataCode().equals(dataCode)){
				return data.getDataName();
			}
		}
		return null;
	}
}
