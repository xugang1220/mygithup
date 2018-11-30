jQuery(function(){
	var bar = jQuery('.load_bar_1');
	var percent = jQuery('.load_num');
	jQuery('form[name=addImg]').ajaxForm({
		beforeSend: function() {
			var percentVal = '0%';
			bar.width(percentVal)
			percent.html(percentVal);
		},
		uploadProgress: function(event, position, total, percentComplete) {
			var percentVal = percentComplete + '%';
			bar.width(percentVal)
			percent.html(percentVal);
		},
		success: function() {
			var percentVal = '100%';
			bar.width(percentVal)
			percent.html(percentVal);
		},
		complete: function(xhr) {
			var url = xhr.responseText.toString();
			if(/(\.png|\.jpg|\.gif|\.JPG|\.JPEG)/.test(url)){	
				jQuery("#upImg").attr("src", url);
			}else if(url == 'null'){
				alert("图片服务器异常,请联系中心人员");			
			}else{
				alert("请上传图片");			
			}
		}
	}); 
})
