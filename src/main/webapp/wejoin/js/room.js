var conn = null;
var wechat = null;
var users = []; // 缓存用户，获取昵称
var huanxinUid;
$(function () {
    $.base64.utf8encode = true;
    huanxinUid = $("#huanxinUid").val();
    if ($("#userToken").val() == '') {
        window.location.href = '../login.jsp';
    }
    if (!$.cookie($("#houseToken").val())) {
        window.location.href = 'home.jsp';
    }
    initMembersList();
    wechat = new WeChat();
    wechat.init();
    connInit();
    loginHx();
    getUserByHuanxinuid($("#huanxinUid").val());

    /*$(window).bind('beforeunload', function() {
     if (conn) {
     conn.clear();
     conn.onClosed();
     }
     //  调用退出接口
     $.ajax({
     type: "POST",
     url: base+"api/apiCommon/doPost", // HouseUser/HouseUser
     data: {"type":"UL031", "param":JSON.stringify({"houseToken":$("#houseToken").val(),"userToken":$("#userToken").val()})},
     dataType:"json",
     success:function (data) {
     }
     });
     $.cookie($("#houseToken").val(), null);
     });*/

});

function connInit() {
    conn = new Easemob.im.Connection();
    var filters = new Array();
    //通知过滤器，模仿过滤器来做，后续还要改进
    filters.push({
        mapper: function (message) {
            var data = $.parseJSON(message.data);
            return data.type != undefined && data.type != 30 && data.type != 3;
        },
        handle: function (message) {
            var data = $.parseJSON(message.data);
            if(excutors[data.type])
            excutors[data.type](data);
        }
    });

    filters.push({
        mapper: function (message) {
            var data = $.parseJSON(message.data);
            return message.from != huanxinUid && data.type != undefined && data.type == 30;
        },
        handle: function (message) {
            //var data  =  $.parseJSON(message.data);
        	var user = getUserInfo(message);
        	user.content = user.content.data;
            wechat._displayNewMsg(user);
        }
    });

    conn.init({
        onOpened: function () {
            console.log("成功登录");
            conn.setPresence();
            sendNotification(messageFactory.JOIN_ROOM(huanxinUid));
        },
        onTextMessage: function (message) {
            console.log("收到文本消息：" + JSON.stringify(message));
            message.data = $.base64.atob(message.data, true);
            if (message.from != huanxinUid) {
	            //1、通知消息
	            for (var i = 0; i < filters.length; i++) {
	                var filter = filters[i];
	                console.log(filter.mapper(message));
	                if (filter.mapper(message)) {
	                    filter.handle(message);
	                    break;
	                }
	            }
            }
        },
        //收到表情消息时的回调方法
        onEmotionMessage: function (message) {
            console.log("收到表情消息：" + JSON.stringify(message));
            if (message.from != huanxinUid) {
                wechat._displayNewMsg(getUserInfo(message));
            }
        },
        //当连接关闭时的回调方法
        onClosed: function () {

        }
    });
}

function getUserInfo(message) {
    var user = getUserInfoByFrom(message.from,message);
    user.content = message;
    return user;
}

function getUserInfoByFrom(from,message) {
    var userIcon = "images/tx.gif";
    var fromUsername = from;
    console.log(users);
    if(message){
        var data = $.parseJSON(message.data);
        fromUsername = data.myname;
        userIcon = data.myicon||userIcon;
    }else{
        if (users[from]) {
            fromUsername = users[from].nickName;
            userIcon = users[from].icon || userIcon;
        }
    }
    if(userIcon.indexOf("file.")==0){
        userIcon = "http://"+userIcon;
    }

    return {'username': fromUsername, 'owner': false, 'content': "", 'userIcon': userIcon};
}

var loginHx = function () {
    var user = $("#huanxinUid").val();
    var pass = $("#huanxinPsw").val();
    //根据用户名密码登录系统
    conn.open({
        apiUrl: Easemob.im.config.apiURL,
        user: user,
        pwd: pass,
        //连接时提供appkey
        appKey: Easemob.im.config.appkey
    });
    return false;
};

var sendText = function (msg) {
    console.log("连接是否开启" + conn.isOpened());
    if (!conn.isOpened()) {
        connInit();
        loginHx();
    }
    var options = {
        to: $("#huanxinRoomId").val(),
//		to : '125914257123443160',
        msg: $.base64.btoa(JSON.stringify(msg)),
        type: "groupchat"
    };
    conn.sendTextMessage(options);
    var content = msg.content.replace(/\n/g, '<br>');
    msg.content = content;
    var userInfo = getUserInfoByFrom(huanxinUid);
    userInfo.content = JSON.stringify(msg);
    userInfo.owner = true;
    wechat._displayNewMsg(userInfo);
};

var sendNotification = function (message) {
    if (!conn.isOpened()) {
        connInit();
        loginHx();
    }
    var options = {
        to: $("#huanxinRoomId").val(),
//		to : '125914257123443160',
        msg: $.base64.btoa(JSON.stringify(message)),
        type: "groupchat"
    };
    conn.sendTextMessage(options);
    console.log(options);
};
var showVedios = function(url) {
    try {
        $("#voice").click();
        playVideoFromUpload(url);
        console.log("收到影音："+url);
    }catch(e){
        console.error(e);
    }
}
var showDocsImages = function(images) {
    try {
        $("#documets").click();
        if (images && images.length > 0) {
            $(".ck-slide .ck-slide-wrapper").empty();
            $(".ck-slide .dot-wrap").empty();
            for (var i in images) {
                var pic = images[i].pic || images[i];
                var $li = $("<li></li>").css({
                    'float': 'left',
                    'position': 'relative',
                    'margin-left': '0px'
                }).append('<a href="javascript:void(0);"><img src="http://' + pic + '" alt="" width="730px" height="580px"></a>');
                $(".ck-slide .ck-slide-wrapper").append($li);

                var current = (parseInt(i) == 0 && 'current') || '';
                $li = $("<li></li>").addClass(current).append('<em>' + (parseInt(i) + 1) + '</em>');
                $(".ck-slide .dot-wrap").append($li);
            }


            if (images.length <= 1) {
                $(".ctrl-slide").hide();
                $(".ck-slidebox").hide();
            }

            $("#imageBoard").hide();
            $('.ck-slide').show();

            $('.ck-slide').ckSlide({
                autoPlay: false,//默认为不自动播放，需要时请以此设置
                dir: 'x',//默认效果淡隐淡出，x为水平移动，y 为垂直滚动
                interval: 10000,//默认间隔2000毫秒
                callback: turnPage
            });
        }
    } catch (e) {
        console.error(e);
    }
};

function turnPage(index) {
	if(images && index)
		sendNotification(messageFactory.FILE($("#fileType").val(),images[index].pic));
}

var WeChat = function () {
    //this.stompClient = null;
};

function initMembersList() {
    $.ajax({
        type: "POST",
        url: base + "api/apiCommon/doGet", // HouseUser/HouseUsers
        data: {"type": "UL030", "houseToken": $("#houseToken").val()},
        dataType: "json",
        async: false,
        success: function (data) {
            if (data.obj) {
                console.log("获取房间用户：" + data.obj);
                var result = $.parseJSON(data.obj);
                if (result.serverStatus == 0) {
                    var members = result.returnObject;
                    for (var i in members) {
                        users[members[i].huanxin_uid] = members[i];
                        members[i].huanxinUid = members[i].huanxin_uid;
                        appendUser(members[i]);
                    }
                }
            }
        }
    });
}

WeChat.prototype = {

    init: function () {
        this._initFace();
        // 发送按钮发送消息
        $("#sendMsg").bind("click", function(){
        	var content = $("#content").val();
        	 if ($.trim(content) != '') {
                 // 发送聊天消息
                 sendText(messageFactory.CHART(content));
             }
        	 $("#content").val('').focus();
        });
        
        // 回车发送消息
        $("#content").bind('keyup', function (e) {
            var content = $("#content").val();
            if (e.keyCode == 13 && $.trim(content) != '') {
                $("#content").val('');
                // 发送聊天消息
                sendText(messageFactory.CHART(content));
            }
        });
        // 右键清屏
        $("#box4 .content").smartMenu([[{
            text: "清屏",
            func: function () {
                $(this).find("ul").empty();
            }
        }]], {
            name: "clear"
        });
    },

    _initFace: function () {
        var _this = this;
        var sjson = Easemob.im.Helper.EmotionPicData;
        for (var key in sjson) {
            var emotions = $('<img>').attr({
                "id": key,
                "src": sjson[key],
                "style": "cursor:pointer;width: 26px; height: 26px;"
            }).click(function () {
                _this._selectEmotionImg(this);
            });
            $('<a>').append(emotions).appendTo($('#faceWrapper'));
        }
    },
    // 渲染文本消息
    _displayNewMsg: function (data) {

        var owner = data.owner;
        var ownerClass = (owner && 'wo') || (!owner && '');
        var $arrow = (owner && '<em></em>') || (!owner && '<ol></ol>');

//        var content = this._showFace(data.content); // 过滤表情
        var messageContent;
        var content = '';
        if (typeof data.content == 'string') {
            messageContent = Easemob.im.Helper.parseTextMessage($.parseJSON(data.content).content);
            messageContent = messageContent.body;
        } else {
            messageContent = data.content.data;
//            content = $.parseJSON(messageContent.data).content;
        	
        }
        
        for (var i = 0; i < messageContent.length; i++) {
            var msg = messageContent[i];
            var type = msg.type;
            var r = msg.data;
            if (type == "emotion") {
                content += '<img src="' + r + '" style="width: 19px;  height: 19px;"/>';
            } else {
                content += r;
            }
        }

        //过滤礼物表情
        for(var i = 1;i<65;i++){
            var istr = "";
            if(i<10){
                istr = "0"+i;
            }else{
                istr = i;
            }
            var html = $(".gift_div a").eq(i-1).html();
            content = content.replace(new RegExp("\\[\\(\\<"+istr+"\\>\\)\\]", 'g'),html);
        }

        //  根据users动态取头像、昵称
        var $messageHtml = '<li class="' + ownerClass + '">'
            + '<div class="ltian_img"><a><img src="' + data.userIcon + '" /></a></div>'
            + '<div class="ltian_txt">'
            + '<span>' + data.username + '</span>'
            + '<div class="txt_zi">' + content + '</div>' + $arrow
            + '</div><div class="clear"></div></li>';

        $(".ltian ul").append($messageHtml);
        $("#box4 .content").mCustomScrollbar("scrollTo", "bottom"); // 滚动至底部
        $("#box4 .content")[0].scrollTop = $("#box4 .content")[0].scrollHeight;

    },
    // 表情点击事件
    _selectEmotionImg: function (selImg) {
        var content = $("#content").val();
        content += selImg.id;
        $("#content").val(content);
        $("#content").focus();
    },

    // 显示符号表情格式化
    _showFace: function (content) {
        // 正则替换所有的本地聊天内容中的'[ee_*]'
        var reg = new RegExp(faceReg, 'g');
        content = content.replace(reg, function (r) {
            r = r.replace(/\[|\]/g, "");
            return '<img src="images/emoji/ee_' + faceMap[r] + '.png" style="width: 19px;  height: 19px;"/>';
        });

        return content;
    },
};
var messageFactory = {
    JOIN_ROOM: function (id) {
        return {"type": 15, "id": id};
    },
    LOGOUT_ROOM : function(id){
        return {"type": 16, "id": id};
    },
    CHART: function (message) {
        message = message.trim();
        var myid = $("#huanxinUid").val();
        var user = users[myid]||{};
        var result = {"type": 30, "content": message,"myid":myid,"myname":user.nickName||"","myicon":user.icon||""};
        console.log(result);
        return result;
    },
    VOICE:function(url){return {"type": 3, "url": url};},
    VEDIO:function(url){return {"type": 2, "url": url};},
    CLOSE_STREAM : function(){
        return {"type":14};
    },
    OPEN_STREAM : function(){
        return {"type":13};
    },
    FILE:function(type,url) {
        return {"type":type,"url":url};
    }
};
var excutors = {
    1:function(data){
        showDocsImages([data.url]);
    },
    2:function(data){
        showVedios(data.url);
    },
    3:function(data){
        //音频
        showVedios(data.url);
    },
    13: function(){openPullStream()},
    14: function(){closePullStream()},
    15: function (data) {
        if(users[data.id])return;
        getUserByHuanxinuid(data.id);

    },
    16:function(data){
       //退出房间
        var huanxinUid = data.id;
        console.log("退出房间"+huanxinUid);

        $(".list_name ul li").each(function(){
            var $this = $(this);
            console.log($this)
            if(huanxinUid == $this.data("huanxinuid")){
                $this.remove();
            }
        });
        $(".v_ren ul li").each(function(){
            var $this = $(this);
            if(huanxinUid == $this.data("huanxinuid")){
                $this.remove();
            }
        });
    },
    6:function(data){
        showDocsImages([data.url]);
    },
    7:function(data){
        showDocsImages([data.url]);
    },
    8:function(data){
        showDocsImages([data.url]);
    },
    9:function(data){
        showDocsImages([data.url]);
    },
    10:function(data){
        showDocsImages([data.url]);
    },
    11:function(data){
        showDocsImages([data.url]);
    }
};

function getUserByHuanxinuid(uid){
    ajaxGet({"type": "UL035", "huanxinUid": uid}, function (member) {
        //已经存在
        if(users[member.huanxinUid])return;
        users[member.huanxinUid] = member;
        appendUser(member);
    });
}
/**
 * 渲染员工
 * @param member
 */
function appendUser(member){
    var userIcon = member.icon || 'images/tx.gif';
    if(userIcon.indexOf("file.")==0){
        userIcon = "http://"+userIcon;
    }
    var $li = $('<li data-huanxinuid="'+member.huanxinUid+'"><a href="javascript:void(0);" userToken="' + member.userToken + '"><img src="' + userIcon + '" /><ol>' + member.nickName + '</ol></a></li>');
    $(".v_ren ul").append($li);
    var movieClass=""//on
    //1：普通用户，2：管理员，3：游客，4：房间创建者，5：教师
    var identificationName = "成员";
    switch(member.identification) {
        case 5:
            identificationName = "讲师";
            break;
        case 4:
            identificationName = "房主";
            break;
        case 3:
            identificationName = "游客";
            break;
        case 2:
            identificationName = "管理员";
            break;
        default :
            identificationName = "成员";
    }

    $li = $('<li data-identification="'+member.identification+'" data-huanxinuid="'+member.huanxinUid+'"><img src="' + userIcon + '" /><span>' + member.nickName + '</span><ol>'+identificationName+'</ol> <a href="#" class="'+movieClass+'">视频</a></li>');
    $(".list_name ul").append($li);
    //alert($(".v_ren ul").children().length);
    $("#onlineNum").html($(".v_ren ul").children().length+"人");
}
/*type = 1 白板 {"type":1,"url","http://xxx图片地址"}
 type =2 视频，{"type":2,"url","http://xxx地址"}
 type =3 音频  {"type":3,"url","http://xxx地址"}
 type=4 频道封面 {"type":4,"url","http://xxx地址"}
 type=5 房间图封面{"type":5,"url","http://xxx地址"}
 type = 6 word {"type":6,"url","http://xxx图片地址"}
 type = 7 excel  {"type":7,"url","http://xxx图片地址"}
 type =8 ppt {"type":8,"url","http://xxx图片地址"}
 type = 9 txt{"type":9,"url","http://xxx地址"}
 type = 10 pdf   {"type":10,"url","http://xxx图片地址"}
 type = 11 图片   {"type":11,"url","http://xxx图片地址"}
 type = 12 用户头像
 type = 13 打开视频拉流  {"type":13}
 type = 14 关闭视频拉流  {"type":14}
 type = 15 进入房间通知  {"type":15,"id","xxxxxxx环信id"}
 type = 30 聊天         {"type":30,"content","xxxx"}
 type = 50 其他的类型  */

var faceMap = {
    "):": "1",
    ":D": "2",
    ";)": "3",
    ":-o": "4",
    ":p": "5",
    "(H)": "6",
    ":@": "7",
    ":s": "8",
    ":$": "9",
    ":(": "10",
    ":'(": "11",
    ":|": "12",
    "(a)": "13",
    "8o|": "14",
    "8-|": "15",
    "+o(": "16",
    "<o)": "17",
    "|-)": "18",
    "*-)": "19",
    ":-#": "20",
    ":-*": "21",
    "^o)": "22",
    "8-)": "23",
    "(|)": "24",
    "(u)": "25",
    "(S)": "26",
    "(*)": "27",
    "(#)": "28",
    "(R)": "29",
    "({)": "30",
    "(})": "31",
    "(k)": "32",
    "(F)": "33",
    "(W)": "34",
    "(D)": "35",
    "ee_1": "1",
    "ee_2": "2",
    "ee_3": "3",
    "ee_4": "4",
    "ee_5": "5",
    "ee_6": "6",
    "ee_7": "7",
    "ee_8": "8",
    "ee_9": "9",
    "ee_10": "10",
    "ee_11": "11",
    "ee_12": "12",
    "ee_13": "13",
    "ee_14": "14",
    "ee_15": "15",
    "ee_16": "16",
    "ee_17": "17",
    "ee_18": "18",
    "ee_19": "19",
    "ee_20": "20",
    "ee_21": "21",
    "ee_22": "22",
    "ee_23": "23",
    "ee_24": "24",
    "ee_25": "25",
    "ee_26": "26",
    "ee_27": "27",
    "ee_28": "28",
    "ee_29": "29",
    "ee_30": "30",
    "ee_31": "31",
    "ee_32": "32",
    "ee_33": "33",
    "ee_34": "34",
    "ee_35": "35"
};
var faceReg = "\\[\\):\\]|\\[:D\\]|\\[\\;\\)\\]|\\[:-o\\]|\\[:p\\]|\\[\\(H\\)\\]|\\[:@\\]|\\[:s\\]|\\[:\\$\\]|\\[:\\(\\]|\\[:'\\(\\]|\\[:\\|\\]|\\[\\(a\\)\\]|\\[8o\\|\\]|\\[8-\\|\\]|\\[\\+o\\(\\]|\\[<o\\)\\]|\\[\\|-\\)\\]|\\[\\*-\\)\\]|\\[:-#\\]|\\[:-\\*\\]|\\[\\^o\\)\\]|\\[8-\\)\\]|\\[\\(\\|\\)\\]|\\[\\(u\\)\\]|\\[\\(S\\)\\]|\\[\\(\\*\\)\\]|\\[\\(#\\)\\]|\\[\\(R\\)\\]|\\[\\({\\)\\]|\\[\\(}\\)\\]|\\[\\(k\\)\\]|\\[\\(F\\)\\]|\\[\\(W\\)\\]|\\[\\(D\\)\\]|\\[ee_1\\]|\\[ee_2\\]|\\[ee_3\\]|\\[ee_4\\]|\\[ee_5\\]|\\[ee_6\\]|\\[ee_7\\]|\\[ee_8\\]|\\[ee_9\\]|\\[ee_10\\]|\\[ee_11\\]|\\[ee_12\\]|\\[ee_13\\]|\\[ee_14\\]|\\[ee_15\\]|\\[ee_16\\]|\\[ee_17\\]|\\[ee_18\\]|\\[ee_19\\]|\\[ee_20\\]|\\[ee_21\\]|\\[ee_22\\]|\\[ee_23\\]|\\[ee_24\\]|\\[ee_25\\]|\\[ee_26\\]|\\[ee_27\\]|\\[ee_28\\]|\\[ee_29\\]|\\[ee_30\\]|\\[ee_31\\]|\\[ee_32\\]|\\[ee_33\\]|\\[ee_34\\]|\\[ee_35\\]";
$(function(){
    $(".tab_button li").click(function(i){
        var _this = $(this);
        if(!_this.hasClass("hover")){
            _this.addClass("hover").siblings().removeClass("hover");
        }
        var tab = $(".main_pic:eq("+$(".tab_button li").index(_this)+")");
        tab.show();
        tab.siblings().hide();
    });
    $(".gift_div a").click(function(){
        var _this = $(this);
        var index = $(".gift_div a").index(_this)+1;
        var msg
        if(index>9){
            msg = "[(<"+index+">)]"
        }else{
            msg = "[(<0"+index+">)]"
        }
        $("#content").val($("#content").val()+msg);
        $("#content").focus();
    });

    $(".search #textfieldUser").bind('keyup', function (e) {
        if(e.keyCode == 13) {
            searchUser(false)
        }
    });
    $("#searchUser").click(function(){
        searchUser(false);
    });
});
/**
 * 搜索用户
 * @param isManager
 */
function searchUser(isManager){
    var searchValue = $(".search #textfieldUser").val().trim();
    if(searchValue == ""&&!isManager){
        $(".list_name ul li").show();
        return;
    }
    function checkIsManager(identification){
        return identification=="2"||identification=="4";
    }
    $(".list_name ul li").each(function () {
        var $this = $(this);
        var userNickName = $this.find("span").text();
        var identification = $this.data("identification");
        if ((isManager&&checkIsManager(identification))||(!isManager&&userNickName.indexOf(searchValue) > -1)) {
            $this.show();
        } else {
            $this.hide();
        }
    })
}
/**
 * 暂时约定点击按钮搜索一次
 * @param isManager
 */
function setSearchScope(isManager){
    $(".search #textfieldUser").val("");

    searchUser(isManager)
}
/**
 * 退出房间
 */
function logoutRoom(){
    ajaxPost({"type":"UL031", "param":JSON.stringify({"houseToken":$("#houseToken").val(),"userToken":$("#userToken").val()})},function(){
        $.cookie($("#houseToken").val(), null);
        sendNotification(messageFactory.LOGOUT_ROOM($("#huanxinUid").val()));
        window.location.href = "home.jsp";
    });
}


function changeCamaraLocation(id){
    var jDom = $("#" + id);
    var parentDiv = jDom.parents(".content_main");
    if (parentDiv[0]) {
        $("#dialog").append(jDom);
        $("#dialog").dialog("open");
        jDom.attr("width", "100%");
        jDom.attr("height", "100%");
    }
}
function screamDialogOpen(){
    $("#dialog").dialog("open");
    resizeScream();
}
$(function() {
    // 设置主音量
    $("#voiceLine").slider({
        value: 60,
        orientation: "horizontal",
        range: "min",
        animate: true, stop: function (event, ui) {
            $("#cameraPull")[0].contentWindow.changeVoiceNumber(ui.value);
            console.log(ui.value)
        }
    });
    $("#dialog").dialog({
        autoOpen: false,
        width: 400,
        close: function (event, ui) {
            var domJar = $("#dialog > iframe");
            var id = domJar.attr("id");
            var contentDiv = $("#mCSB_1_container").children();
            domJar.attr("width", "220");
            if (id == "cameraPull") {
                contentDiv.eq(0).append(domJar);
                domJar.attr("height", "182");
            } else {
                contentDiv.eq(1).append(domJar);
                domJar.attr("height", "174");
            }
        },
        resizeStop: function (event, ui) {
            resizeScream();
        }
    });



});
var resizeScream = function(){
    var width = $('#dialog').dialog('option', 'width');
    var height = $('#dialog').dialog('option', 'height');
    var domJar = $("#dialog > iframe");
    domJar.attr("width", "100%");
    domJar.attr("height", "100%");
    if(domJar[0].contentWindow.setObjectSize){
        domJar[0].contentWindow.setObjectSize(width*1.5,height*1.5);
    }
}