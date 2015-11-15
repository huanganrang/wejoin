$(function(){
    var videoToken = null;
    $("#camaraControl").click(function(){
        var _this = $("#camaraControl");
        if(_this.hasClass("on")){
            _this.removeClass("on");
            $(".example_video_1").hide();
            $(".hidden_area").show();
            $("#cameraPush").attr("src",basePath+"/simplest_as3_rtmp_streamer/rtmp_streamer.jsp?houseId="+ROOM_INFO.houseId+"&channelId="+ROOM_INFO.channelId);
            ajaxPost({"type":"UL036", "param":JSON.stringify({"houseToken":$("#houseToken").val(),"pullUrl":PULL_STREAM_ROUTE+ROOM_INFO.channelId+"/"+ROOM_INFO.houseId})},function(data){
                videoToken = data.token
                //开
                sendNotification(messageFactory.OPEN_STREAM());
            });
        }else{
            _this.addClass("on");
            $(".example_video_1").show();
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
            //TODO 自动播放
        }
    });
    //TODO 文件上传
    $("#uploadDocumet").click(function(){
        $("#file").click();
        $(document).delegate('#file','change',function () {
            var fileContentType = $("#file").val().match(/^(.*)(\.)(.{1,8})$/)[3]; //这个文件类型正则很有用：）

            $("#uploadform").submit();
        });
    });

});
function loadSuccess(){

}