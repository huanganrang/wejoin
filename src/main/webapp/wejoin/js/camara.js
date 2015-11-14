$(function(){
    $("#camaraControl").click(function(){
        var _this = $("#camaraControl");
        if(_this.hasClass("on")){
            _this.removeClass("on");
            $(".example_video_1").hide();
            $(".hidden_area").show();
            $("#cameraPush").attr("src",basePath+"/simplest_as3_rtmp_streamer/rtmp_streamer.jsp?houseId="+ROOM_INFO.houseId+"&channelId="+ROOM_INFO.channelId);
        }else{
            _this.addClass("on");
            $(".example_video_1").show();
            $(".hidden_area").hide();
            $("#cameraPush").attr("src","")
        }

    });
    var cavas = false;
    $(".cneter_menu").click(function(){
        if(cavas == true){
            $("#baibanqu").show();
            $("#drawer").hide();
            cavas = false;
        }else{
            $("#baibanqu").hide();
            $("#drawer").show();
            cavas = true;
        }
    })
});