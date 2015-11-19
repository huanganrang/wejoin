$(function(){
    var videoToken = null;
    $("#camaraControl").click(function(){
        var _this = $("#camaraControl");
        if(_this.hasClass("on")){
            _this.removeClass("on");
            $(".example_video_1").hide();
            $(".hidden_area").show();
            $("#cameraPush").attr("src",basePath+"/simplest_as3_rtmp_streamer/rtmp_streamer.jsp?houseId="+ROOM_INFO.houseId+"&channelId="+ROOM_INFO.channelId);
            $("#cameraPull").attr("src","")
            ajaxPost({"type":"UL036", "param":JSON.stringify({"houseToken":$("#houseToken").val(),"pullUrl":PULL_STREAM_ROUTE+ROOM_INFO.channelId+"/"+ROOM_INFO.houseId})},function(data){
                videoToken = data.token
                //开
                sendNotification(messageFactory.OPEN_STREAM());
            });
        }else{
            _this.addClass("on");
            $(".example_video_1").show();
            $("#cameraPull").attr("src",basePath+"/rtmp_player/rtmp_player.jsp?houseId="+ROOM_INFO.houseId+"&channelId="+ROOM_INFO.channelId);
            $(".hidden_area").hide();
            $("#cameraPush").attr("src","")
            ajaxGet({"type":"UL038", "videoToken":videoToken},function(data){
                videoToken = null;
                sendNotification(messageFactory.CLOSE_STREAM());
            });
        }
    });
    ajaxGet({"type":"UL039", "houseToken":$("#houseToken").val()},function(data){
        if(data!=null&&data.length>0){
        	 $(".example_video_1").show();
             $("#cameraPull").attr("src",basePath+"/rtmp_player/rtmp_player.jsp?houseId="+ROOM_INFO.houseId+"&channelId="+ROOM_INFO.channelId);
        }
    });
    //TODO 文件上传
    $("#uploadDocumet").click(function(){
        $("#file").click();
        $(document).delegate('#file','change',function () {
            var fileContentType = $("#file").val().match(/^(.*)(\.)(.{1,8})$/)[3]; //这个文件类型正则很有用：）
            if(fileContentType.indexOf('.txt')>-1){
                $("#fileType").val(9);
            }else if(fileContentType.indexOf('.doc')>-1){
                $("#fileType").val(6);
            }else if(fileContentType.indexOf('.xls')>-1){
                $("#fileType").val(7);
            }
            //TODO 其他的待定
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
                    var result = $.parseJSON(data);
                    if(result.serverStatus == 0){
                        sendNotification(messageFactory.FILE(result.type,result.returnValue));
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
                    /*var result = $.parseJSON(data);
                    if(result.serverStatus == 0){
                        sendNotification(messageFactory.FILE(result.type,result.returnValue));
                    }*/
                }
            });
        });
    });

});

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