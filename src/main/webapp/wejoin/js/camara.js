$(function(){
    $("#camaraControl").click(function(){
        var _this = $("#camaraControl");
        if(_this.hasClass("on")){
            _this.removeClass("on");
            $(".example_video_1").hide();
            $(".hidden_area").show();
            $("#cameraPush").attr("src",basePath+"/simplest_as3_rtmp_streamer/rtmp_streamer.jsp?houseId="+ROOM_INFO.houseId+"&channelId="+ROOM_INFO.channelId);
            //开
            sendNotification(messageFactory.OPEN_STREAM());
        }else{
            _this.addClass("on");
            $(".example_video_1").show();
            $(".hidden_area").hide();
            $("#cameraPush").attr("src","")
            //关
            sendNotification(messageFactory.CLOSE_STREAM());
        }

    });
});