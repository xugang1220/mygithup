//跳转
function yfyue_bjui_pagin_go(pageID,pNum,loadData)
{ 
	jQuery("#"+pageID).val(pNum);
	loadData();
}
//输入框跳转
function yfyue_bjui_pagin_goto(pageID,loadData){
	jQuery("#"+pageID).val(jQuery("#goto_"+pageID).val());
	loadData();
}
//更新行数
function yfyue_bjui_chang_row(rowId,loadData){
	jQuery("#"+rowId).val(jQuery("#page_size_"+rowId).val());
	loadData();
}
//分页
function yfyue_bjui_pagin(totalRow,dispDiv,pageId,rowsId,loadDataFunc){
	//debugger;
	dispDiv.html("");
	var maxCount=parseInt(totalRow);
	var myPage=parseInt(jQuery("#"+pageId).val());
	var pageRow=parseInt(jQuery("#"+rowsId).val());
    if(isNull(maxCount)){
		maxCount=0;
	}
    if(isNull(myPage)){
		myPage=1;
	}	
    if(isNull(pageRow)){
		pageRow=20;
	}
	var maxPage = 0;
	maxPage = maxCount%pageRow==0?maxCount/pageRow:parseInt(maxCount/pageRow) + 1;
	//alert("myPage->"+myPage+" pageRow->"+pageRow +" maxPage->"+maxPage);
	var divHtml = "";
	var upPage = "";// 上页
	var downPage = "";// 下页
	var firstPage = "";// 第一页
	var secondPage = "";// 第二页
	var sPageStr = "";// 中前段
	var ePageStr = "";// 中后段
	var endPage="";//最后一页
	var gotoStr = "";// 跳转
	var myPageStr = "";
	var skip="1";
	if(myPage<=maxPage){
		skip=myPage;
	  }else{
		skip=maxPage;  
	 }
	  gotoStr ="<li class=\"jumpto\"> <span class=\"p-input\"> <input class=\"form-control input-sm-pages\" type=\"text\" size=\"2.6\" id=\"goto_"+pageId+"\" value=\""+skip+"\" title=\"输入跳转页码，回车确认\"> </span> <a class=\"goto\" onclick=\"yfyue_bjui_pagin_goto('"+pageId+"',"+loadDataFunc+");\" href=\"javascript:;\" title=\"跳转\"><i class=\"fa fa-chevron-right\"></i></a> </li>";	
	if ((myPage - 1) >= 1) {
	   upPage = " <li class=\"j-prev\"><a onclick=\"yfyue_bjui_pagin_go('"+pageId+"',"+(myPage-1)+","+loadDataFunc+")\" class=\"previous\" href=\"javascript:;\">上一页<i class=\"fa fa-backward\"></i> </a><span class=\"previous\" style=\"display:none;\"><i class=\"fa fa-backward\"></i>上一页</span></li> ";
	} else {
	   upPage = " <li class=\"j-prev disabled\"><a class=\"previous\" href=\"javascript:;\" style=\"display: none;\"><i class=\"fa fa-backward\"></i> 上一页</a> <span class=\"previous\"><i class=\"fa fa-backward\"></i> 上一页</span></li> ";
	}
	if (myPage + 1 <= maxPage) {
		downPage = "<li class=\"j-next\"><a onclick=\"yfyue_bjui_pagin_go('"+pageId+"',"+(myPage+1)+","+loadDataFunc+")\"  class=\"next\" href=\"javascript:;\">下一页 <i class=\"fa fa-forward\"></i></a><span class=\"next\" style=\"display: none;\">下一页 <i class=\"fa fa-forward\"></i></span></li>";
	} else {
		downPage ="<li class=\"j-next disabled\"><a class=\"next\" href=\"javascript:;\">下一页 <i class=\"fa fa-forward\"></i></a><span class=\"next\" style=\"display: none;\">下一页 <i class=\"fa fa-forward\"></i></span></li>";
	}	
	//全显示
	if (maxPage <= 6) {
		for (var i = 1; i <= maxPage; i++) {
			if (i == myPage) {
				sPageStr = sPageStr + "<li class=\"selected j-num\"><a href=\"javascript:;\">"+i+"</a></li>";
			} else {
				sPageStr = sPageStr + "<li class=\"j-num\"><a onclick=\"yfyue_bjui_pagin_go('"+pageId+"',"+i+","+loadDataFunc+")\"  href=\"javascript:;\">"+i+"</a></li>";
			}
		}
	} else {
		 endPage = "<li class=\"j-num\"><a onclick=\"yfyue_bjui_pagin_go('"+pageId+"',"+maxPage+","+loadDataFunc+")\"   href=\"javascript:;\">尾页</a></li>";
		if (myPage < 5) {
			for (var j = 1; j <= 6; j++) {
				if (j == myPage) {
					sPageStr = sPageStr + "<li class=\"selected j-num\"><a href=\"javascript:;\">"+j+"</a></li>";
				} else {
					sPageStr = sPageStr + "<li class=\"j-num\"><a  onclick=\"yfyue_bjui_pagin_go('"+pageId+"',"+j+","+loadDataFunc+")\" href=\"javascript:;\">"+j+"</a></li>";
				}
			}
			sPageStr = sPageStr + "<li class=\"j-num disabled\"><a href=\"javascript:;\">...</a></li>";
		} else {
		    firstPage = "<li class=\"j-num\"><a onclick=\"yfyue_bjui_pagin_go('"+pageId+"',1,"+loadDataFunc+")\" href=\"javascript:;\">1</a></li>";
			if (myPage > 5) {
				secondPage = "<li class=\"j-num\"><a onclick=\"yfyue_bjui_pagin_go('"+pageId+"',2,"+loadDataFunc+")\" href=\"javascript:;\">2</a></li>";
			}	
			for (var k = 1; k <= 2; k++) {
			  if ((myPage + k) <= maxPage) {
			    ePageStr = ePageStr + "<li class=\"j-num\"> <a onclick=\"yfyue_bjui_pagin_go('"+pageId+"',"+(myPage+k)+","+loadDataFunc+")\" href=\"javascript:;\">"+ (myPage+k)+"</a></li>";
			      }
			   }
		    if (myPage + 2 < maxPage) {
				ePageStr = ePageStr + "<li class=\"j-num disabled\"><a href=\"javascript:;\">...</a></li>";
			}
			// 前段
			sPageStr = sPageStr + "<li class=\"j-num disabled\"><a href=\"javascript:;\">...</a></li>";
			for (var l = 2; l >0; l--) {
			  if((myPage - l)<maxPage){
				 if ((myPage - l) > 1) {
					sPageStr = sPageStr + "<li class=\"j-num\"><a onclick=\"yfyue_bjui_pagin_go('"+pageId+"',"+(myPage-l)+","+loadDataFunc+")\" href=\"javascript:;\">"+(myPage-l)+"</a></li>";
				  }
				}else{
				   if ((maxPage - l) > 1) {
					sPageStr = sPageStr + "<li class=\"j-num\"><a onclick=\"yfyue_bjui_pagin_go('"+pageId+"',"+(myPage-l)+","+loadDataFunc+")\" href=\"javascript:;\">"+(maxPage-l)+"</a></li>";
				  }
				}
			}
			// 自己
			if(myPage<=maxPage){
				myPageStr = "<li class=\"j-num disabled\"><a href=\"javascript:;\">"+myPage+"</a></li>";			
			}
		}
	}
   if (maxPage > 1) {
	  divHtml = "<div class=\"pages\"><span>每页&nbsp;</span><div class=\"selectPagesize\"><select onchange=\"yfyue_bjui_chang_row('"+rowsId+"',"+loadDataFunc+")\"  id=\"page_size_"+rowsId+"\"><option value=\"20\">20</option><option value=\"40\">40</option><option value=\"60\">60</option><option value=\"100\">100</option></select></div><span>行&nbsp;总计"+maxPage+"页&nbsp;"+maxCount+"行</span></div><div class=\"pagination-box\"><ul class=\"pagination\">";
	  divHtml = divHtml + upPage + firstPage + secondPage + sPageStr
					+ myPageStr + ePageStr + downPage + endPage+gotoStr;
	  divHtml = divHtml +"</ul></div>";
	  dispDiv.html(divHtml);
	  jQuery("#page_size_"+rowsId).find("option[value='"+jQuery("#"+rowsId).val()+"']").attr("selected",true);
   }
}

//分页
function yfyue_bjui_pagin2(totalRow,dispDiv,pageId,rowsId,loadDataFunc){
	//debugger;
	dispDiv.html("");
	var maxCount=parseInt(totalRow);
	var myPage=parseInt(jQuery("#"+pageId).val());
	var pageRow=parseInt(jQuery("#"+rowsId).val());
    if(isNull(maxCount)){
		maxCount=0;
	}
    if(isNull(myPage)){
		myPage=1;
	}	
    if(isNull(pageRow)){
		pageRow=10;
	}
	var maxPage = 0;
	maxPage = maxCount%pageRow==0?maxCount/pageRow:parseInt(maxCount/pageRow) + 1;
	//alert("myPage->"+myPage+" pageRow->"+pageRow +" maxPage->"+maxPage);
	var divHtml = "";
	var upPage = "";// 上页
	var downPage = "";// 下页
	var firstPage = "";// 第一页
	var secondPage = "";// 第二页
	var sPageStr = "";// 中前段
	var ePageStr = "";// 中后段
	var endPage="";//最后一页
	var gotoStr = "";// 跳转
	var myPageStr = "";
	var skip="1";
	if(myPage<=maxPage){
		skip=myPage;
	  }else{
		skip=maxPage;  
	 }
	  gotoStr ="<li class=\"jumpto\"> <span class=\"p-input\"> <input class=\"form-control input-sm-pages\" type=\"text\" size=\"2.6\" id=\"goto_"+pageId+"\" value=\""+skip+"\" title=\"输入跳转页码，回车确认\"> </span> <a class=\"goto\" onclick=\"yfyue_bjui_pagin_goto('"+pageId+"',"+loadDataFunc+");\" href=\"javascript:;\" title=\"跳转\"><i class=\"fa fa-chevron-right\"></i></a> </li>";	
	if ((myPage - 1) >= 1) {
	   upPage = " <li class=\"j-prev\"><a onclick=\"yfyue_bjui_pagin_go('"+pageId+"',"+(myPage-1)+","+loadDataFunc+")\" class=\"previous\" href=\"javascript:;\">上一页<i class=\"fa fa-backward\"></i> </a><span class=\"previous\" style=\"display:none;\"><i class=\"fa fa-backward\"></i>上一页</span></li> ";
	} else {
	   upPage = " <li class=\"j-prev disabled\"><a class=\"previous\" href=\"javascript:;\" style=\"display: none;\"><i class=\"fa fa-backward\"></i> 上一页</a> <span class=\"previous\"><i class=\"fa fa-backward\"></i> 上一页</span></li> ";
	}
	if (myPage + 1 <= maxPage) {
		downPage = "<li class=\"j-next\"><a onclick=\"yfyue_bjui_pagin_go('"+pageId+"',"+(myPage+1)+","+loadDataFunc+")\"  class=\"next\" href=\"javascript:;\">下一页 <i class=\"fa fa-forward\"></i></a><span class=\"next\" style=\"display: none;\">下一页 <i class=\"fa fa-forward\"></i></span></li>";
	} else {
		downPage ="<li class=\"j-next disabled\"><a class=\"next\" href=\"javascript:;\">下一页 <i class=\"fa fa-forward\"></i></a><span class=\"next\" style=\"display: none;\">下一页 <i class=\"fa fa-forward\"></i></span></li>";
	}	
	//全显示
	if (maxPage <= 4) {
		for (var i = 1; i <= maxPage; i++) {
			if (i == myPage) {
				sPageStr = sPageStr + "<li class=\"selected j-num\"><a href=\"javascript:;\">"+i+"</a></li>";
			} else {
				sPageStr = sPageStr + "<li class=\"j-num\"><a onclick=\"yfyue_bjui_pagin_go('"+pageId+"',"+i+","+loadDataFunc+")\"  href=\"javascript:;\">"+i+"</a></li>";
			}
		}
	} else {
		 endPage = "<li class=\"j-num\"><a onclick=\"yfyue_bjui_pagin_go('"+pageId+"',"+maxPage+","+loadDataFunc+")\"   href=\"javascript:;\">尾页</a></li>";
		if (myPage < 3) {
			for (var j = 1; j <= 4; j++) {
				if (j == myPage) {
					sPageStr = sPageStr + "<li class=\"selected j-num\"><a href=\"javascript:;\">"+j+"</a></li>";
				} else {
					sPageStr = sPageStr + "<li class=\"j-num\"><a  onclick=\"yfyue_bjui_pagin_go('"+pageId+"',"+j+","+loadDataFunc+")\" href=\"javascript:;\">"+j+"</a></li>";
				}
			}
			sPageStr = sPageStr + "<li class=\"j-num disabled\"><a href=\"javascript:;\">...</a></li>";
		} else {
		    firstPage = "<li class=\"j-num\"><a onclick=\"yfyue_bjui_pagin_go('"+pageId+"',1,"+loadDataFunc+")\" href=\"javascript:;\">1</a></li>";
			if (myPage > 3) {
				secondPage = "<li class=\"j-num\"><a onclick=\"yfyue_bjui_pagin_go('"+pageId+"',2,"+loadDataFunc+")\" href=\"javascript:;\">2</a></li>";
			}	
			for (var k = 1; k <= 2; k++) {
			  if ((myPage + k) <= maxPage) {
			    ePageStr = ePageStr + "<li class=\"j-num\"> <a onclick=\"yfyue_bjui_pagin_go('"+pageId+"',"+(myPage+k)+","+loadDataFunc+")\" href=\"javascript:;\">"+ (myPage+k)+"</a></li>";
			      }
			   }
		    if (myPage + 2 < maxPage) {
				ePageStr = ePageStr + "<li class=\"j-num disabled\"><a href=\"javascript:;\">...</a></li>";
			}
			// 前段
			sPageStr = sPageStr + "<li class=\"j-num disabled\"><a href=\"javascript:;\">...</a></li>";
			for (var l = 2; l >0; l--) {
			  if((myPage - l)<maxPage){
				 if ((myPage - l) > 1) {
					sPageStr = sPageStr + "<li class=\"j-num\"><a onclick=\"yfyue_bjui_pagin_go('"+pageId+"',"+(myPage-l)+","+loadDataFunc+")\" href=\"javascript:;\">"+(myPage-l)+"</a></li>";
				  }
				}else{
				   if ((maxPage - l) > 1) {
					sPageStr = sPageStr + "<li class=\"j-num\"><a onclick=\"yfyue_bjui_pagin_go('"+pageId+"',"+(myPage-l)+","+loadDataFunc+")\" href=\"javascript:;\">"+(maxPage-l)+"</a></li>";
				  }
				}
			}
			// 自己
			if(myPage<=maxPage){
				myPageStr = "<li class=\"j-num disabled\"><a href=\"javascript:;\">"+myPage+"</a></li>";			
			}
		}
	}
   if (maxPage > 1) {
	  divHtml = "<div class=\"pages\"></div><div class=\"pagination-box\"><ul class=\"pagination\">";
	  divHtml = divHtml + upPage + firstPage + secondPage + sPageStr
					+ myPageStr + ePageStr + downPage + endPage+gotoStr;
	  divHtml = divHtml +"</ul></div>";
	  dispDiv.html(divHtml);
	  //jQuery("#page_size_"+rowsId).find("option[value='"+jQuery("#"+rowsId).val()+"']").attr("selected",true);
   }
}