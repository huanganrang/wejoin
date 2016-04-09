//社区模块
var WEIQU_COMMUNITY = {};
$(document).ready(function () {

    WEIQU_COMMUNITY.init();
});

WEIQU_COMMUNITY.init = function(){
    //社区列表结尾dom
    WEIQU_COMMUNITY.channelClearDom = $(".center_list ul >.clear");
    //分页
    WEIQU_COMMUNITY.scroll.init();
    //分类信息
    WEIQU_COMMUNITY.initCategories();
    //构建社区窗口
    WEIQU_COMMUNITY.channelWidow.init();
}
//分类
WEIQU_COMMUNITY.categories = [];
WEIQU_COMMUNITY.initCategories = function() {
    var type = "UL023";
    ajaxGet({"type":type},function(data){
        WEIQU_COMMUNITY.categories = data;
        WEIQU_COMMUNITY.renderWithCategories(data);
    });
};
//用分类渲染
WEIQU_COMMUNITY.renderWithCategories = function(data){
    var categories = data;
    for(var i in categories) {
        var category = categories[i];
        var $li = '<p class="menu_head" categoryId="'+category.id+'">'+category.name+'<em>245.300</em></p>';
        $("#secondpane").append($li);
        var $option = $('<option value="'+category.id+'">'+category.name+'</option>');
        $("#createCommunityForm .putd").append($option);
    }
    $("#secondpane p.menu_head").click(function(){
        $(this).css({backgroundImage:"url(images/hov.gif)" , color:"#70b615"}).next("div.menu_body").slideDown(500).siblings("div.menu_body").slideUp("slow");
        $(this).siblings().css({backgroundImage:"" , color:"#666666"});
    });
}

//社区窗口
WEIQU_COMMUNITY.channelWidow = {
    window:null,
    init:function(){
        WEIQU_COMMUNITY.channelWidow.window = $("#demandBox");
        $(".left_an a").click(function () {
            WEIQU_COMMUNITY.channelWidow.show();
        });
        $("#channelBox .up_an .a2").click(function () {
            $('#createChannelForm').submit();
        });
        $("#channelBox .close_btn a").click(function () {
            WEIQU_COMMUNITY.channelWidow.hide();
        });
        WEIQU_COMMUNITY.initCreateChannel();
    },
    show:function(){
        $(".windows").hide();
        $("#demandBox").show();
        var top=(windowHeight-630)/2
        $("#demandBox .windows_box").css("top",top)
    },
    hide:function(){
        WEIQU_COMMUNITY.channelWidow.window.hide();
    }
}

//分页函数 type为分类，keyword为搜索条件
WEIQU_COMMUNITY.page = function (pageNumber, type, keyword) {
    ajaxGet({"pageSize": WEIQU_COMMUNITY.scroll.size, "pageNo": pageNumber, "type": "UL010"}, function (json) {
        //$(".center_list ul").remove();
        //总数
        var channelTotal = json.returnValue;
        WEIQU_COMMUNITY.scroll.total = channelTotal;
        var channels = json.returnObject;
        for (var i = 0; i < channels.length; i++) {
            var channel = channels[i];
            WEIQU_COMMUNITY.buildChannel(channel);
        }
    }, function (data) {
        return data;
    });
}

WEIQU_COMMUNITY.channelClearDom = null;

//构建社区dom
WEIQU_COMMUNITY.buildChannel = function(channel){
    var viewData = Util.cloneJson(channel);
    viewData.userOnlineCount = "在线：" + (viewData.userOnlineCount||0);
    viewData.displayIconUrl = viewData.displayIconUrl?"http://" + viewData.displayIconUrl:"images/p1.gif";
    viewData.displayIconUrl = '<img src="' + viewData.displayIconUrl + '" />';
    viewData.nickName = 'ID：' + viewData.nickName;
    var dom = Util.cloneDom("template_channel", channel, viewData);
    WEIQU_COMMUNITY.channelBind(dom, channel);
    WEIQU_COMMUNITY.channelClearDom.before(dom);
    return dom;
}


WEIQU_COMMUNITY.channelBind = function (dom, channel) {
    dom.find("b a").click(channel, WEIQU_COMMUNITY.joinChannel);
    dom.find("ol a").click(channel, WEIQU_COMMUNITY.attention);
}

//关注
WEIQU_COMMUNITY.attention = function (event) {
    var channel = event.data;
    alert(channel.nickName);
}

//加入社区
WEIQU_COMMUNITY.joinChannel = function (event) {
    var channel = event.data;
    var viewData = Util.cloneJson(channel);
    var template = $("#template_room");
    var scrollDom = template.clone().show().removeAttr("id");
    scrollDom.children().remove();
    var center = $(".room_center > ul");
    center.children().remove();
    center.append(scrollDom)
    ajaxPost({
        "type": "UL012",
        "param": {"channelToken": channel.token}
    }, function (rooms) {
        for(var i in rooms){
            var room = rooms[i];
            var dom = Util.cloneDom(template.children().eq(0), room, viewData);
            var domTeacher = Util.cloneDom(template.children().eq(1), room, viewData);
            domTeacher.hide();
            scrollDom.append(dom).append(domTeacher);
            dom.find(".moo_2 a:eq(0)").click(function(){
                $(this).parents("li:eq(0)").next().toggle();
            });
        }
    });
    //TODO 去加载层的内容
    for (var i = 0; i < 5; i++) {
        var dom = Util.cloneDom(template.children().eq(0), channel, viewData);
        var domTeacher = Util.cloneDom(template.children().eq(1), channel, viewData);
        domTeacher.hide();
        scrollDom.append(dom).append(domTeacher);
        dom.find(".moo_2 a:eq(0)").click(function(){
            $(this).parents("li:eq(0)").next().toggle();
        });
    }
    //显示房间列别弹出层
    showroomBox();
    scrollDom.mCustomScrollbar();
}

//初始化创建社区
WEIQU_COMMUNITY.initCreateChannel = function(){
    $('#createCommunityForm').form({
        url : base+"api/apiCommon/doPost", //
        onSubmit : function() {

            var channelIcon = $("#uploadFile").val();
            if(channelIcon == '') {
                alert("请选择社区封面照");
                return false;
            }
            var name = $("#channelName");
            if(Util.checkInputNull(name)) {
                $("#channelName").focus();
                return false;
            }
            var categoryId = $("#categoryId");
            if(Util.checkInputNull(categoryId)) {
                alert("请选择社区类别");
                return false;
            }
            var shortDesc = $("#shortDesc");
            if(Util.checkInputNull(shortDesc)) {
                $("#shortDesc").focus();
                return false;
            }
            $("#type").val("UL011");
            $("#param").val(JSON.stringify({"shortDesc":shortDesc.val(),"name":name.val(),"categoryId":categoryId.val(),"userToken":userToken.token}));
            return true;
        },
        success : function(data) {
            console.log("创建社区data:" + data);
            data = $.parseJSON(data);
            if(data.obj){
                var result = $.parseJSON(data.obj);
                if(result.serverStatus == 0) {
                    var channel = result.returnObject;
                    WEIQU_COMMUNITY.buildChannel(channel);
                    WEIQU_COMMUNITY.channelWidow.hide();
                } else {
                    // 创建失败
                    alert(result.returnMessage);
                }
            }
        }
    });
}
//滚动分页
WEIQU_COMMUNITY.scroll = {
    init:function(){
        //获取第一页
        WEIQU_COMMUNITY.page(WEIQU_COMMUNITY.scroll.page);
        $(window).scroll(function () {
            /*console.log("滚动条到顶部的垂直高度: " + $(document).scrollTop());
            console.log("页面的文档高度 ：" + $(document).height());
            console.log('浏览器的高度：' + $(window).height());*/
            var totalHeight = parseFloat($(window).height()) + parseFloat($(window).scrollTop());     //浏览器的高度加上滚动条的高度

            if ($(document).height() <= totalHeight)     //当文档的高度小于或者等于总的高度的时候，开始动态加载数据
            {
                WEIQU_COMMUNITY.page(++WEIQU_COMMUNITY.scroll.page);
            }
        });
    },
    page:1,//第几页
    size:30,//每页多少
    total:0 //总记录数
}




