/*
下拿数据
selectID 下拉对像 
selectName下拉名字 如性别
dataVal 当前下拉值 修改时指定当前值为选中状态
*/
function initTypeSelect(selectID,selectName,dataVal){    
   SysInitAjax.getInitTypeAllList(null, function (data) {
	alert(data);
  	data = fjson(data);
  	if (data.state == 0) {
  		var json = data.object;
  		var str = JSON.stringify(json);
  		if (str.indexOf('[') != 0) {
  			json = JSON.parse('[' + str + ']')
  		}
  		//下拿
		//debugger;
		if(isNonNull(json)){
			selectID.find("option").remove();
			selectID.append("<option value='0000'>"+selectName+"");
			for(var n=0;n<json.length;n++){
				 selectID.append("<option  value='"+json[n].typeCode+"'>"+json[n].typeName);
				 //selectID.selectpicker(json[n].typeCode,json[n].typeName);
				}
				
				//selectID.selectpicker('refresh');
			if(isNonNull(dataVal)){
				selectID.find("option[value='"+dataVal+"']").attr("selected",true);
			}
		}else{
		   selectID.append("<option value='0000'>"+selectName+"");
		}
  	}else{
		$(this).alertmsg('info',data.message);
	}
  });
}
/*
自己加载数据
*/
function initDataSelect(selectID,selectName,dataType,dataVal){    
   SysInitAjax.getInitDataAllList('typeCode='+dataType, function (data) {
  	data = fjson(data);
  	if (data.state == 0) {
  		var json = data.object;
  		var str = JSON.stringify(json);
  		if (str.indexOf('[') != 0) {
  			json = JSON.parse('[' + str + ']')
  		}
  		//下拿
		if(isNonNull(json)){
			selectID.find("option").remove();
			selectID.append("<option value='0000'>"+selectName+"");
			for(var n=0;n<json.length;n++){
				 selectID.append("<option  value='"+json[n].dataCode+"'>"+json[n].dataName);
				}
			if(isNonNull(dataVal)){
				selectID.find("option[value='"+dataVal+"']").attr("selected",true);
			}
		}else{
		   selectID.append("<option value='0000'>"+selectName+"");
		}
  	}else{
		$(this).alertmsg('info',data.message);
	}
  });
}
