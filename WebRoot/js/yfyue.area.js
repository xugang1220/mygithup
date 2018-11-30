/*加载目录
   treeName     树的名称
   nameSelector 显示选择树形后的名称
   idSelector   记录选择树形后的编码或ID
*/
function loadYfyueArea(treeName,nameSelector,idSelector){
  SysAreaAjax.getAreaList(null, function (data) {
  	data = fjson(data);
  	if (data.state == 0) {
  		var json = data.object;
  		var str = JSON.stringify(json);
  		if (str.indexOf('[') != 0) {
  			json = JSON.parse('[' + str + ']')
  		}
  		//设置组织树
  		var setting = {
  			treeId : treeName + "AreaTree",
  			check : {
  				enable : true,
  				chkStyle : "radio",
  				radioType : "level"
  			},
  			data : {
  				key : {
  					name : "fullName"
  				}
  			},
  			callback : {
  				onCheck : function (event, treeId, treeNode, clickFlag) {
					//debugger;
					
  					$(nameSelector).val(treeNode.fullName);
  					if (idSelector != null) {
  						$(idSelector).val(treeNode.areaCode);
  					}
  					$('#J_AREA_TREE_' + treeName).attr("ztree hide");
  				}
  			}
  		};
  		var zNodes = json;
  		$.fn.zTree.init($("#J_AREA_TREE_" + treeName), setting, zNodes);
  	}else{
		$(this).alertmsg('info',data.message);
	}
  });
}