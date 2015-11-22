var PULL_STREAM_ROUTE = "rtmp://s2.weiqu168.com/live/";
var PUSH_STREAM_ROUTE = "";
var SERVER_URL = "http://139.196.34.76:8080";
var NET_VOICE_URL = "";

/**
 * 通用ajax请求
 * @param parameter
 * @param success
 */
function ajaxGet(parameter,success){
    $.ajax({
        type: "GET",
        url: base+"api/apiCommon/doGet",
        data: parameter,
        dataType:"json",
        success:function (data) {
            if(data.obj) {
                console.log(data.obj);
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
function ajaxGetSync(parameter,success){
    $.ajax({
        type: "GET",
        url: base+"api/apiCommon/doGet",
        data: parameter,
        dataType:"json",
        async: false,
        success:function (data) {
            if(data.obj) {
                console.log(data.obj);
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
            console.log(data.obj);
            var result = $.parseJSON(data.obj);
            if(result.serverStatus == 0) {
            	if(callData){
            		success(callData(result));
            	}else{
            		success(result.returnObject);
            	}
                
            } else {
                alert(result.returnMessage);
            }
        }
    });
}
/**
 *
 * @param parameter
 * @param success
 * @param callData
 */
function ajaxPost(parameter,success,callData){
    $.ajax({
        type: "POST",
        url: base+"api/apiCommon/doPost",
        data: parameter,
        dataType:"json",
        success:function (data) {
            console.log(data.obj);
            var result = $.parseJSON(data.obj);
            if(result.serverStatus == 0) {
                if(callData){
                    success(callData(result));
                }else{
                    success(result.returnObject);
                }

            } else {
                alert(result.returnMessage);
            }
        }
    });
}
