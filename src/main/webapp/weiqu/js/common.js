var PULL_STREAM_ROUTE = "rtmp://s2.weiqu168.com/live/";
var PUSH_STREAM_ROUTE = "";
var SERVER_URL = "http://139.196.34.76:8080";
var NET_VOICE_URL = "";

/**
 * 通用ajax请求
 * @param parameter
 * @param success
 */
function ajaxGet(parameter,success,callData){
    $.ajax({
        type: "GET",
        url: base+"api/apiCommon/doGet",
        data: parameter,
        dataType:"json",
        success:function (data) {
            weiquDebug(parameter,data);
            if(data.obj) {
                var json = JSON.parse(data.obj);
                if(json.serverStatus == 0) {
                    if(callData){
                        success(callData(json));
                    }else{
                        success(json.returnObject);
                    }
                } else {
                    // 登录失败
                    alert(json.returnMessage);
                }
            } else {
                //alert("登录失败");
            }

        }
    });
}
function ajaxGetSync(parameter,success){
    $.ajax({
        type: "GET",
        url: base+"api/apiCommon/doGet",
        data: parameter,
        dataType:"json",
        async: false,
        success:function (data) {
            weiquDebug(parameter,data);
            if(data.obj) {
                var json = JSON.parse(data.obj);
                if(json.serverStatus == 0) {
                    success(json.returnObject);
                } else {
                    // 登录失败
                    alert(json.returnMessage);
                }
            } else {
                //alert("登录失败");
            }

        }
    });
}
/**
 * ajaxPost
 * @param parameter
 * @param success
 */
function ajaxPostSync(parameter,success,callData){
    $.ajax({
        type: "POST",
        url: base+"api/apiCommon/doPost",
        data: parameter,
        dataType:"json",
        async: false,
        success:function (data) {
            weiquDebug(parameter,data);
            var result = $.parseJSON(data.obj);
            if(result.serverStatus == 0) {
            	if(callData){
            		success(callData(result));
            	}else{
                    if(success)
                        success(result.returnObject);
            	}
            } else {
                alert(result.returnMessage);
            }
        }
    });
}

function weiquDebug(parameter,data){
    if(!ACTION_MAP)return;
    var cfg = ACTION_MAP[parameter.type];
    if(!cfg)return;

    var map = {
        apiName:cfg.description,
        apiCfg:cfg,
        request:parameter,
        response:data
    }
    try {
        map.responseJson = $.parseJSON(data.obj);
    }catch(e){

    }
    console.log(map);
}

/**
 *
 * @param parameter
 * @param success
 * @param callData
 */
function ajaxPost(parameter,success,callData){
    console.log(parameter.type);
    $.ajax({
        type: "POST",
        url: base+"api/apiCommon/doPost",
        data: parameter,
        dataType:"json",
        success:function (data) {
            weiquDebug(parameter,data);
            var result = $.parseJSON(data.obj);
            if(result.serverStatus == 0) {
                if(callData){
                    success(callData(result));
                }else{
                    if(success)
                    success(result.returnObject);
                }

            } else {
                alert(result.returnMessage);
            }
        }
    });
}

var Util = {}
// 密码校验，6-20位字母,数字组合
Util.checkpassword = function(v){
    var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/;
    if(reg.test(v)) {
        return true;
    }

    return false;
};

// 手机号校验
Util.checkphone = function(v) {
    var reg = /^0{0,1}(13[0-9]|15[0-9]|18[0-9]|177)[0-9]{8}$/;
    if(reg.test(v)) {
        return true;
    }
    return false;
}
