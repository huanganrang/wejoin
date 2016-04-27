function pushStart(){
    $house.video.isStartPush = true;
}
(function (house) {
    var cfg = house.cfg;
    var footerObj = $(".footer")[0];
    var video = function(){
        this.container = $('.aside .video:eq(0)');
        this.containerActive = $(".main .active-video .video");

        this.icon = Util.cloneDom(this.container.children(),{});
        this.videoIframe = $('<iframe width="100%" height="100%" frameborder="no" scrolling="no"></iframe>');
        this.isOpen = false;
        this.changerBtn = $(footerObj).find(".camera");
        var _this = this;
        var methods = {
            init:function(){
                console.log(this);
                if (cfg.owner) {
                    this.videoIframe.attr("src", base + "simplest_as3_rtmp_streamer/rtmp_streamer.jsp?houseId=" + cfg.houseId + "&channelId=" + cfg.channelId);
                } else {
                    this.videoIframe.attr("src", base + "rtmp_player/rtmp_player.jsp?houseId=" + cfg.houseId + "&channelId=" + cfg.channelId);
                }
                this.initDrag();
            },
            clear:function(obj){
                obj.children().remove();
            },
            initDrag:function(){
                /** 左侧侧边栏 */
                var mainLeftObj = $(".main .aside.left")[0];
                var activeVideObj = $(".main .active-video")[0];
                ;(function(){


                    var activeVideoRelatedObj = null;

                    /** 放大视频 */
                    var videoToggleObjs = $(mainLeftObj).find(".videos .toggle");
                    videoToggleObjs.bind("click", function(e){
                        e.target.parentElement.style.display = "none";
                        if(null != activeVideoRelatedObj)
                            activeVideoRelatedObj.style.display = "block";

                        /* 视频切换 */
                        activeVideObj.style.display = "block";
                        var containerActive = _this.containerActive;
                        containerActive.css("height","100%");
                        containerActive.children().remove();
                        activeVideoRelatedObj = e.target.parentElement;
                        _this.clear(containerActive);
                        if(_this.isOpen) {
                            containerActive.append(_this.videoIframe);
                            setTimeout(function () {
                                //if($house.video.isStartPush) {
                                var domJar = _this.videoIframe[0];
                                if (domJar.contentWindow.setObjectSize) {
                                    domJar.contentWindow.setObjectSize(containerActive.width() * 2, containerActive.height() * 2);
                                }
                                //}
                            }, 10000);
                        }else{
                            containerActive.append(Util.cloneDom(_this.icon,{}));
                        }
                    })

                    /** 恢复视频 */
                    $(activeVideObj).find(".toggle").bind("click", function(){
                        if(null != activeVideoRelatedObj){
                            activeVideoRelatedObj.style.display = "block";
                            _this.clear(_this.container);
                            if(_this.isOpen){
                                _this.container.append(_this.videoIframe);
                            }else{
                                _this.container.append(Util.cloneDom(_this.icon,{}));
                            }
                        }

                        activeVideObj.style.display = "none";

                        activeVideoRelatedObj = null;

                    });
                })();

                /** 展开的视频允许鼠标拖动 */
                ;(function(){
                    var lastX = 0, lastY = 0;
                    var isDragging = false;

                    var style = function(obj){
                        return obj.currentStyle? obj.currentStyle: window.getComputedStyle(obj, null);
                    };

                    $(activeVideObj).bind("mousedown", function(e){
                        e.preventDefault();

                        lastX = e.screenX;
                        lastY = e.screenY;
                        isDragging = true;

                        document.documentElement.style.cursor = "move";
                    });
                    $(document).bind("mousemove", function(e){
                        if(!isDragging)
                            return;

                        var offsetX = e.screenX - lastX,
                            offsetY = e.screenY - lastY;

                        var left = activeVideObj.offsetLeft, top = activeVideObj.offsetTop;
                        activeVideObj.style.marginLeft = 0;
                        activeVideObj.style.marginTop = 0;
                        activeVideObj.style.left = (left + offsetX) + "px";
                        activeVideObj.style.top = (top + offsetY) + "px";

                        lastX = e.screenX;
                        lastY = e.screenY;

                        //e.preventDefault();
                    });
                    $(document).bind("blur mouseup", function(e){
                        //e.preventDefault();

                        isDragging = false;
                        document.documentElement.style.cursor = "auto";
                    });
                })();

                /** 视频控制 */
                ;(function(){
                    var cameraObj = _this.changerBtn;
                    cameraObj.addClass("disabled");
                    $(cameraObj).bind("click", function(){
                        var chart = house.chart;
                        var isDisabled = !cameraObj.hasClass("disabled");
                        if(isDisabled){
                            chart.sendText(chart.messageFactory.CLOSE_STREAM());
                            house.video.close();
                        }else{
                            chart.sendText(chart.messageFactory.OPEN_STREAM());
                            house.video.play();

                        }
                    });
                })();
            },
            //播放
            play:function(){
                this.isOpen = true;
                this.container.children().remove();
                this.changerBtn.removeClass("disabled");
                this.container.append(this.videoIframe);
            },
            //关闭
            close:function(){
                this.isOpen = false;
                this.changerBtn.addClass("disabled");
                this.container.children().remove();
                this.container.append(Util.cloneDom(this.icon,{}))
            }
        }
        for(var key in methods){
            this[key] =  methods[key];
        }
        this.init();
    }
    $house.video = new video();
    /*var images;
    var uploadTag = "";
    $(function () {
        var videoToken = null;
        //如果是房主
        if (ROOM_INFO.isOwner()) {
            $(".example_video_1").hide();
            $(".hidden_area").show();
        } else {
            $(".example_video_1").show();
            $(".hidden_area").hide();
        }
        $("#camaraControl").click(function () {
            var _this = $("#camaraControl");
            if (_this.hasClass("on")) {
                _this.removeClass("on");
                if (ROOM_INFO.isOwner()) {
                    $("#cameraPush").attr("src", basePath + "/simplest_as3_rtmp_streamer/rtmp_streamer.jsp?houseId=" + ROOM_INFO.houseId + "&channelId=" + ROOM_INFO.channelId);
                    ajaxPost({
                        "type": "UL036",
                        "param": JSON.stringify({
                            "houseToken": $("#houseToken").val(),
                            "pullUrl": PULL_STREAM_ROUTE + ROOM_INFO.channelId + "/" + ROOM_INFO.houseId
                        })
                    }, function (data) {
                        videoToken = data.token
                        //开
                        sendNotification(messageFactory.OPEN_STREAM());
                    });
                } else {
                    $("#cameraPull").attr("src", basePath + "/rtmp_player/rtmp_player.jsp?houseId=" + ROOM_INFO.houseId + "&channelId=" + ROOM_INFO.channelId);
                }

            } else {
                _this.addClass("on");
                if (ROOM_INFO.isOwner()) {
                    $("#cameraPush").attr("src", "");
                    ajaxGet({"type": "UL038", "videoToken": videoToken}, function (data) {
                        videoToken = null;
                        sendNotification(messageFactory.CLOSE_STREAM());
                    });
                } else {
                    $("#cameraPull").attr("src", "");
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
        $("#uploadDocumet").click(function () {
            if (!ROOM_INFO.isOwner()) {
                alert("您不是房主身份，不能使用文件上传功能！");
                return;
            }
            uploadTag = "document";
            showdhdBox();
            uploadOpenTag = true;
        });
        $("#fileUpload").click(function () {
            if (!$("#up").is(":hidden")) return;
            if ("document" == uploadTag)
                $("#file").click();
            else {
                $("#moviefile").click();
            }
        });

        $("#uploadMovie").click(function () {
            uploadTag = "movie";
            showdhdBox();
            uploadOpenTag = true;

        });


    });
    function uploadMovie() {
        var fileContentType = $("#moviefile").val().match(/^(.*)(\.)(.{1,8})$/)[3]; //这个文件类型正则很有用：）
        var formData = new FormData($('#uploadformMovie')[0]);
        $.ajax({
            url: getVoiceUploadUrl(),  //Server script to process data
            type: 'POST',
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            success: function (data) {
                console.log(data);
                uploadComplete();
                ajaxGet({"type": "UL043", "encode": data}, function (data) {
                    console.log("点播地址：" + data);
                    sendNotification(messageFactory.VEDIO(data));
                    playVideoFromUpload(data);
                }, function (result) {
                    return result.returnValue;
                });
                /!*var result = $.parseJSON(data);
                 if(result.serverStatus == 0){
                 sendNotification(messageFactory.FILE(result.type,result.returnValue));
                 }*!/
            },
            error: function () {
                alert("上传失败");
                uploadComplete();
            }
        });
    }

    function playVideoFromUpload(url) {
        $("#videoIframe")[0].src = basePath + "/jslib/video-js/video.jsp?videoUrl=" + url;
    }

    function uploadHTML5(data) {
        ajaxPost({"type": "UL041", "param": JSON.stringify({"data": data})}, function (filePath) {
            console.log(filePath);
            sendNotification(messageFactory.FILE(1, filePath));
        }, function (data) {
            return data.returnValue;
        });
    }

    function loadSuccess() {
        //console.log($("#uploadFrame").contents().find("pre"));
        //alert($("#uploadFrame").contents().find("pre").text());
    }

    function getVoiceUploadUrl() {
        if (NET_VOICE_URL == "") {
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

    function openPullStream() {
        $(".example_video_1").show();
        $("#cameraPull").attr("src", basePath + "/rtmp_player/rtmp_player.jsp?houseId=" + ROOM_INFO.houseId + "&channelId=" + ROOM_INFO.channelId);
    }

    function closePullStream() {
        $("#cameraPull").attr("src", "");

    }

    function fileUpload() {
        var fileContentType = $("#file").val().match(/^(.*)(\.)(.{1,8})$/)[3].toLowerCase(); //这个文件类型正则很有用：）
        if (fileContentType.indexOf('txt') > -1) {
            $("#fileType").val(9);
        } else if (fileContentType.indexOf('doc') > -1 || fileContentType.indexOf('docx') > -1) {
            $("#fileType").val(6);
        } else if (fileContentType.indexOf('xls') > -1 || fileContentType.indexOf('xlsx') > -1) {
            $("#fileType").val(7);
        } else if (fileContentType.indexOf('pdf') > -1) {
            $("#fileType").val(10);
        } else if (fileContentType.indexOf('ppt') > -1) {
            $("#fileType").val(8);
        }
        var formData = new FormData($('#uploadform')[0]);
        $.ajax({
            url: SERVER_URL + '/upload',  //Server script to process data
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
            success: function (data) {
                console.log(data);
                var result = $.parseJSON(data);
                if (result.serverStatus == 0) {
                    uploadComplete();
                    images = result.returnObject;
                    sendNotification(messageFactory.FILE($("#fileType").val(), result.returnObject[0].pic));
                    showDocsImages(result.returnObject);
                }
            },
            error: function () {
                alert("上传失败");
                uploadComplete();
            }

        });
    }

    function uploadComplete() {
        document.getElementById("percent").value = "100%";
        $(".windows").hide();
        bar = 0;
        line = "||";
        amount = "";
        document.getElementById("up").style.display = "none";
        document.getElementById("b").disabled = false;
        uploadOpenTag = false;
    }

    var bar = 0;
    var line = "||";
    var amount = "";
    $(function () {
        document.getElementById("up").style.display = "none";
    });
    var uploadOpenTag = true;

    function upload() {
        if (uploadTag == "document") {
            fileUpload();
        } else {
            uploadMovie();
        }
        count();
    }

    function count() {
        if (!uploadOpenTag) return;
        var f;
        if ("document" == uploadTag)
            f = document.getElementById("file");
        else {
            f = document.getElementById("moviefile");
        }
        var b = document.getElementById("b");
        b.disabled = true;
        if (f.value == "") {
            b.disabled = false;
            alert("请添加上传文件");
            return false;
        }
        document.getElementById("up").style.display = "inline";
        bar = bar + 2;
        amount = amount + line;
        document.getElementById("chart").value = amount;
        document.getElementById("percent").value = bar + "%";
        if (bar < 98) {
            setTimeout("count()", 200);
        } else {
            document.getElementById("percent").value = "99%";
        }
    }*/
})($house);
