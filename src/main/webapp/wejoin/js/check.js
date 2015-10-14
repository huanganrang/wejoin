
// 密码校验，6-20位字母,数字组合
checkpassword = function(v){
   var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/;
   if(reg.test(v)) {
	  return true;
   }
   
   return false;
};

// 手机号校验
checkphone = function(v) {
	var reg = /^0{0,1}(13[0-9]|15[0-9]|18[0-9]|177)[0-9]{8}$/;
	if(reg.test(v)) {
		return true;
	}
	
	return false;
}

