var images;

$(function(){
    var videoToken = null;
    //如果是房主
    if(ROOM_INFO.isOwner()){
        $(".example_video_1").hide();
        $(".hidden_area").show();
    }else{
        $(".example_video_1").show();
        $(".hidden_area").hide();
    }
    $("#camaraControl").click(function(){
        var _this = $("#camaraControl");
        if(_this.hasClass("on")){
            _this.removeClass("on");
            if(ROOM_INFO.isOwner()){
                $("#cameraPush").attr("src",basePath+"/simplest_as3_rtmp_streamer/rtmp_streamer.jsp?houseId="+ROOM_INFO.houseId+"&channelId="+ROOM_INFO.channelId);
                ajaxPost({"type":"UL036", "param":JSON.stringify({"houseToken":$("#houseToken").val(),"pullUrl":PULL_STREAM_ROUTE+ROOM_INFO.channelId+"/"+ROOM_INFO.houseId})},function(data){
                    videoToken = data.token
                    //开
                    sendNotification(messageFactory.OPEN_STREAM());
                });
            }else{
                $("#cameraPull").attr("src",basePath+"/rtmp_player/rtmp_player.jsp?houseId="+ROOM_INFO.houseId+"&channelId="+ROOM_INFO.channelId);
            }

        }else{
            _this.addClass("on");
            if(ROOM_INFO.isOwner()) {
                $("#cameraPush").attr("src","");
                ajaxGet({"type":"UL038", "videoToken":videoToken},function(data){
                    videoToken = null;
                    sendNotification(messageFactory.CLOSE_STREAM());
                });
            }else{
                $("#cameraPull").attr("src","");
            }
        }
    });
    if (!ROOM_INFO.isOwner()) {
        ajaxGet({"type": "UL039", "houseToken": $("#houseToken").val()}, function (data) {
            if (data != null && data.length > 0) {
                openPullStream();
            }
        });
    }
    $("#uploadDocumet").click(function(){
        $("#file").click();
        $(document).delegate('#file','change',function () {
            var fileContentType = $("#file").val().match(/^(.*)(\.)(.{1,8})$/)[3].toLowerCase(); //这个文件类型正则很有用：）
            if(fileContentType.indexOf('txt')>-1){
                $("#fileType").val(9);
            }else if(fileContentType.indexOf('doc')>-1 || fileContentType.indexOf('docx')>-1){
                $("#fileType").val(6);
            }else if(fileContentType.indexOf('xls')>-1 || fileContentType.indexOf('xlsx')>-1){
                $("#fileType").val(7);
            }else if(fileContentType.indexOf('pdf')>-1){
                $("#fileType").val(10);
            }else if(fileContentType.indexOf('ppt')>-1){
                $("#fileType").val(8);
            }
            var formData = new FormData($('#uploadform')[0]);
            $.ajax({
                url: SERVER_URL+'/upload',  //Server script to process data
                type: 'POST',
                //Ajax events
                //beforeSend: beforeSendHandler,
                //success: completeHandler,
                //error: errorHandler,
                // Form data
                data: formData,
                //Options to tell jQuery not to process data or worry about content-type.
                cache: false,
                contentType: false,
                processData: false,
                success:function (data) {
                	console.log(data);
                    var result = $.parseJSON(data);
                    if(result.serverStatus == 0){
                    	images = result.returnObject;
                        sendNotification(messageFactory.FILE($("#fileType").val(),result.returnObject[0].pic));
                        showDocsImages(result.returnObject);
                    }
                }
            });
        });
    });

    $("#uploadMovie").click(function(){
        $("#moviefile").click();
        $(document).delegate('#moviefile','change',function () {
            var fileContentType = $("#moviefile").val().match(/^(.*)(\.)(.{1,8})$/)[3]; //这个文件类型正则很有用：）
            var formData = new FormData($('#uploadformMovie')[0]);
            $.ajax({
                url: getVoiceUploadUrl(),  //Server script to process data
                type: 'POST',
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success:function (data) {
                    console.log(data);
                    ajaxGet({"type": "UL043", "encode": data}, function (data) {
                        console.log("点播地址："+data);
                        sendNotification(messageFactory.VEDIO(data));
                        playVideoFromUpload(data);
                    },function(result){
                        return result.returnValue;
                    });
                    /*var result = $.parseJSON(data);
                    if(result.serverStatus == 0){
                        sendNotification(messageFactory.FILE(result.type,result.returnValue));
                    }*/
                }
            });
        });
    });

});

function playVideoFromUpload(url){
    $("#videoIframe")[0].src= basePath+"/jslib/video-js/video.jsp?videoUrl="+url;
}

function uploadHTML5(data){
    ajaxPost({"type":"UL041", "param":JSON.stringify({"data":data})},function(filePath){
        console.log(filePath);
        sendNotification(messageFactory.FILE(1, filePath));
    },function(data){
    	return data.returnValue;
    });
}
function loadSuccess(){
    //console.log($("#uploadFrame").contents().find("pre"));
    //alert($("#uploadFrame").contents().find("pre").text());
}
function getVoiceUploadUrl(){
    if(NET_VOICE_URL == "") {
        jQuery.ajax({
            type: "GET",
            url: SERVER_URL + "/System/Upload/Path",
            dataType: "json",
            async: false,
            success: function (data) {
                NET_VOICE_URL = data.returnValue;
            }
        });
    }
    return NET_VOICE_URL;
}
function openPullStream(){
    $(".example_video_1").show();
    $("#cameraPull").attr("src",basePath+"/rtmp_player/rtmp_player.jsp?houseId="+ROOM_INFO.houseId+"&channelId="+ROOM_INFO.channelId);
}

function closePullStream(){
    $("#cameraPull").attr("src","");

}