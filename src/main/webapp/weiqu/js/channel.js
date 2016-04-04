//频道模块
var WEIQU_CHANNEL = {};
$(document).ready(function () {
    //创建按钮
    $(".left_an a").click(function () {
        showchannelBox();
    });

    //获取第一页
    WEIQU_CHANNEL.page(1);
});
//分页函数
WEIQU_CHANNEL.page = function(pageNumber,keyword){
    var clearDom = $(".center_list ul >.clear");
    ajaxGet({"pageSize":20,"pageNo":pageNumber,"type":"UL010"}, function (json) {
        //$(".center_list ul").remove();
        //总数
        var channelTotal = result.returnValue;
        var channels = result.returnObject;
        for(var i=0; i<channels.length; i++) {
            var channel = channels[i];
            var viewData = Util.cloneJson(channel);
            viewData.userOnlineCount = "在线："+viewData.userOnlineCount;
            viewData.displayIconUrl = "http://"+viewData.displayIconUrl||"images/p1.gif";
            viewData.displayIconUrl = '<img src="'+viewData.displayIconUrl +'" />';
            viewData.nickName ='ID：'+viewData.nickName;
            var dom =  Util.cloneDom("template_channel",data,viewData);
            WEIQU_CHANNEL.channelBind(dom,channel);
            clearDom.before(dom);
        }
        }, function (data) {
        return data;
    });
    //TODO 现在没有数据遭点模拟数据,接口有数据这个可以去掉
    for(var i=0; i<10; i++) {
        var channel = {"nickName":12344555+i};
        var viewData = Util.cloneJson(channel);
        viewData.nickName ='ID：'+viewData.nickName;
        var dom =  Util.cloneDom("template_channel",channel,viewData);
        WEIQU_CHANNEL.channelBind(dom,channel);
        clearDom.before(dom);
    }
}

WEIQU_CHANNEL.channelBind = function(dom,channel){
    dom.find("b a").click(channel,WEIQU_CHANNEL.joinChannel);
    dom.find("ol a").click(channel,WEIQU_CHANNEL.attention);
}

//关注
WEIQU_CHANNEL.attention = function(event){
    var channel = event.data;
    alert(channel.nickName);
}

//加入频道
WEIQU_CHANNEL.joinChannel = function(event){
    var channel = event.data;
    alert(channel.nickName);
}