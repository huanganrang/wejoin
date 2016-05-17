<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv = "Content-Type" content = "text/html; charset=UTF-8"/>
	
	<link rel = "stylesheet" href = "js/plugin/msgbox.m/msgbox.m.theme-a.min.css"/>
	
	<link rel = "stylesheet" href = "css/common.css"/>
	<link rel = "stylesheet" href = "css/pages/room.css"/>
    <!-- in a production environment, you can include the minified css. It contains the css of the board and the default controls (size, nav, colors):
    <link rel="stylesheet" href="../dist/drawingboard.min.css"> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/canvas/css/drawingboard.css">
	<title>教室</title>
</head>
<body>
    <jsp:include page="room_head.jsp"></jsp:include>
    <div class = "main media" id="default-board">
        <div class = "toolbar whiteboard" style="text-align:left;">
            <span class = "tool new"><span class = "title"><label>新建</label></span></span>
            <span class = "tool color"><span class = "title"><label>色彩</label></span></span>
            <span class = "tool pencil"><span class = "title"><label>画笔</label></span></span>
            <span class = "tool earaser"><span class = "title"><label>笔擦</label></span></span>
<%--
            <span class = "tool font"><span class = "title"><label>字体</label></span></span>
--%>
            <span class = "tool paintbucket"><span class = "title"><label>背景</label></span></span>
            <span class = "tool canvas-resize">
                <div>
                    <%--<span class = "rail"></span>
                    <span class = "position">
                        <img src = "img/room/sound-ctrl-btn.png"/>
                        <span class = "rail"></span>
                    </span>--%>
                </div>
                <span class = "title"><label>画布缩放</label></span>
            </span>
            <span class = "tool revert"><span class = "title"><label>撤销</label></span></span>
            <span class = "tool recover"><span class = "title"><label>恢复</label></span></span>
            <span class = "clear">清空</span>
        </div>
        <div class = "toolbar document">
            <span class = "tool upload"><span class = "title"><label>上传</label></span></span>
            <%--<span class = "tool color"><span class = "title"><label>色彩</label></span></span>
            <span class = "tool pencil"><span class = "title"><label>画笔</label></span></span>
            <span class = "tool earaser"><span class = "title"><label>笔擦</label></span></span>
            <span class = "tool font"><span class = "title"><label>字体</label></span></span>
            <span class = "tool paintbucket"><span class = "title"><label>背景</label></span></span>
            <span class = "tool canvas-resize">
                <div>
                    <span class = "rail"></span>
                    <span class = "position">
                        <img src = "img/room/sound-ctrl-btn.png"/>
                        <span class = "rail"></span>
                    </span>
                </div>
                <span class = "title"><label>画布缩放</label></span>
            </span>--%>
            <span class = "clear">清空</span>
        </div>
        <div class = "toolbar media">
            <span class = "tool upload"><span class = "title"><label>上传</label></span></span>　
        </div>
        <div class = "content"><div class = "wrapper">
            <div class = "whiteboard"></div>
            <div class = "document">
                <div class = "loading-tip">
                    <div class = "progress">
                        <div class = "percentage"><span>35</span><label>%</label></div>
                        <div class = "bar">
                            <div class = "completed"></div>
                        </div>
                    </div>
					<div class = "tip">文件上传中，请稍后<br/>......</div>
				</div>
            </div>
            <div class = "media">
                <div class = "loading-tip">
                    <img src = "img/room/media1.png"/>
                    <div class = "tip">加载中，请稍后<br/>......</div>
                </div>
            </div>
			<div class = "active-video">
				<span class = "toggle"></span>
				<div class = "video"><img src = "img/room/video.png"/></div>
                <div class = "video" style="display: none;"><iframe id="videoIframe" style="width:100%;height:630px;" frameborder="no"></iframe></div>
			</div>
        </div></div>
        <div class = "aside left">
            <div class = "videos">
                <div>
                    <span class = "toggle"></span>
                    <div class = "video"><img src = "img/room/video.png"/></div>
                </div>
                <%--<div>
                    <span class = "toggle"></span>
                    <div class = "video"><img src = "img/room/video1.png"/></div>
                </div>
                <div>
                    <span class = "toggle"></span>
                    <div class = "video"><img src = "img/room/video.png"/></div>
                </div>--%>
            </div>
            <div class = "members">
                <div class = "title">在线会员（<span class = "count">1568</span>）</div>
                <div class = "search">
                    <div class = "holder">
                        <div class = "input-holder"><input placeholder = "请输入用户昵称或者ID查找"/></div>
                    </div>
                </div>
                <div class = "list">
                   <div class = "member">
                        <img src = "img/room/user1.png"/>
                        <span class = "sign msg-count">99</span>
                        <div class = "top">
                            <span class = "role creator">创建人</span>
                            <span class = "nickname">会飞的企鹅会飞的企鹅</span>
                        </div>
                        <div class = "bottom">
                            <span class = "sign camera"></span>
                            <span class = "sign palm"></span>
                            <div class = "clear-float"> </div>
                        </div>
                    </div>
                    <div class = "member">
                        <img src = "img/room/user1.png"/>
                        <span class = "sign msg-count">99</span>
                        <div class = "top">
                            <span class = "role administrator">管理员</span>
                            <span class = "nickname">会飞的企鹅会飞的企鹅</span>
                        </div>
                        <div class = "bottom">
                            <span class = "sign camera"></span>
                            <span class = "sign palm"></span>
                            <div class = "clear-float"> </div>
                        </div>
                    </div>
                    <div class = "member">
                        <img src = "img/room/user1.png"/>
                        <div class = "top">
                            <span class = "role instructor">讲师</span>
                            <span class = "nickname">会飞的企鹅会飞的企鹅</span>
                        </div>
                        <div class = "bottom">
                            <span class = "sign camera"></span>
                            <span class = "sign palm"></span>
                            <div class = "clear-float"> </div>
                        </div>
                    </div>
                    <div class = "member">
                        <img src = "img/room/user1.png"/>
                        <div class = "top">
                            <span class = "nickname">会飞的企鹅会飞的企鹅</span>
                        </div>
                        <div class = "bottom">
                            <span class = "sign camera"></span>
                            <span class = "sign palm"></span>
                            <div class = "clear-float"> </div>
                        </div>
                    </div>
                    <div class = "member">
                        <img src = "img/room/user1.png"/>
                        <div class = "top">
                            <span class = "nickname">会飞的企鹅会飞的企鹅</span>
                        </div>
                        <div class = "bottom">
                            <span class = "sign camera"></span>
                            <span class = "sign palm"></span>
                            <div class = "clear-float"> </div>
                        </div>
                    </div>
                    <div class = "member">
                        <img src = "img/room/user1.png"/>
                        <div class = "top">
                            <span class = "nickname">会飞的企鹅会飞的企鹅</span>
                        </div>
                        <div class = "bottom">
                            <span class = "sign camera"></span>
                            <span class = "sign palm"></span>
                            <div class = "clear-float"> </div>
                        </div>
                    </div>
                    <div class = "member">
                        <img src = "img/room/user1.png"/>
                        <div class = "top">
                            <span class = "nickname">会飞的企鹅会飞的企鹅</span>
                        </div>
                        <div class = "bottom">
                            <span class = "sign camera"></span>
                            <span class = "sign palm"></span>
                            <div class = "clear-float"> </div>
                        </div>
                    </div>
                    <div class = "member">
                        <img src = "img/room/user1.png"/>
                        <div class = "top">
                            <span class = "nickname">会飞的企鹅会飞的企鹅</span>
                        </div>
                        <div class = "bottom">
                            <span class = "sign camera"></span>
                            <span class = "sign palm"></span>
                            <div class = "clear-float"> </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="room_chart.jsp"></jsp:include>
    </div>
    <div class = "footer"><div class = "holder">
        <div class = "left">
            <span class = "setting" title = "设置"></span>
            <span class = "volume">
                <div class = "volume-control">
                    <span class = "rail"></span>
                    <span class = "position">
                        <img src = "img/room/sound-ctrl-btn.png"/>
                        <span class = "rail"></span>
                    </span>
                </div>
            </span>
            <span class = "camera"></span>
        </div>
        <div class = "middle">
            <span class = "custom-service qq">
                <img src = "img/room/qq.png"/>
                <label>点击QQ联系客服</label>
            </span>
            <span class = "custom-service tel">
                 <label>客服电话：</label>
                 <a href = "tel:4008008800">400-800-8800</a>
            </span>
            <span class = "pagination">
                <span class = "previous">&lt;</span>
                <span class = "index">8</span>
                <span class = "next">&gt;</span>
            </span>
        </div>
        <div class = "right">
            <span class = "share">分享</span>
            <a class = "help">帮助</a>
        </div>
    </div></div>
	
	<div class = "context-menu member">
		<div class = "item chat"><span class = "icon"></span><label>私聊</label></div>
		<div class = "seperator"></div>
		<div class = "item set-as-admin"><span class = "icon"></span><label>设为管理</label></div>
		<div class = "item set-as-instructor"><span class = "icon"></span><label>设为讲师</label></div>
		<div class = "item set-as-member"><span class = "icon"></span><label>设为会员</label></div>
		<div class = "seperator"></div>
		<div class = "item kick-out"><span class = "icon"></span><label>踢出房间</label></div>
		<div class = "item add-to-blacklist"><span class = "icon"></span><label>加黑名单</label></div>
	</div>
    
    <div class = "msgbox-content resolution-setting">
        <input type = 'radio' name = "resolution-setting"><label>320*240</label>
        <input type = 'radio' name = "resolution-setting" style = 'margin-left: 25px;'><label>640*480</label>
        <input type = 'radio' name = "resolution-setting" style = 'margin-left: 25px;'><label>1920*1080</label>
        <input type = 'radio' name = "resolution-setting" style = 'margin-left: 25px;'><label>自适应</label>
    </div>
    
    <div class = "msgbox-content global-setting">
        <div>
            <label>集中管理：</label>
            <div>
                <input type = "checkbox" checked><label>允许发言</label>
                <input type = "checkbox" checked><label>允许图文</label>
            </div>
        </div>
        <div class = "free-discuss">
            <label>自由讨论：</label>
            <div>
                <input type = "radio" name = "free-discuss" checked><label>开启</label>
                <input type = "radio" name = "free-discuss"><label>关闭</label>
            </div>
        </div>
        <div class = "join-authority">
            <label>自由讨论：</label>
            <div>
                <input type = "radio" name = "join-authority" checked><label>所有</label>
                <input type = "radio" name = "join-authority"><label>会员</label>
            </div>
        </div>
        <div class = "lock-room">
            <label>锁定教师：</label>
            <div>
                <input type = "radio" name = "lock-room" checked><label>不锁定</label>
                <input type = "radio" name = "lock-room"><label>锁定</label>
            </div>
        </div>
        <div class = "trial">
            <label>开放试听：</label>
            <div>
                <input type = "radio" name = "trial" checked><label>不开放</label>
                <input type = "radio" name = "trial"><label>开放</label>
                <br/>
                <input type = "text" value = "30" placeholder = "请输入试听时长"/><label>分钟</label>
            </div>
        </div>
         <div class = "address">
            <label>房间地址：</label>
            <div>
                http://www.weixun.com/class/83
            </div>
        </div>
    </div>
    <jsp:include page="room_template.jsp"></jsp:include>
    <jsp:include page="inc_base.jsp"></jsp:include>
    <script type="text/javascript">
       var $house = {
           cfg:{
               houseToken: '${param.houseToken}',
               houseId:${param.houseId},
               channelId:${param.channelId},
               huanxinRoomId: '${param.huanxinRoomId}',
               owner:${param.owner}
           }
        }
    </script>
    <script type = "text/javascript" src = "js/plugin/msgbox.m/msgbox.m.min.js"></script>

	<script type = "text/javascript" src = "js/pages/room/layout.js"></script>
    <script type = "text/javascript" src = "js/pages/room/action.js"></script>
    <script src="${pageContext.request.contextPath}/jslib/jquery.base64.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/jslib/web-im-1.1.0/static/sdk/strophe.js"></script>
    <script src="${pageContext.request.contextPath}/jslib/web-im-1.1.0/static/sdk/easemob.im-1.1.js"></script>
    <script src="${pageContext.request.contextPath}/jslib/web-im-1.1.0/static/sdk/easemob.im-1.1.shim.js"></script><!--兼容老版本sdk需引入此文件-->
    <!--config-->
    <script src="${pageContext.request.contextPath}/jslib/web-im-1.1.0/static/js/easemob.im.config.js"></script>

    <!--白板开始-->
    <script src="${pageContext.request.contextPath}/canvas/js/drawingboard.js"></script>
    <script src="${pageContext.request.contextPath}/canvas/js/board_wq.js"></script>
    <script src="${pageContext.request.contextPath}/canvas/js/controls/control_wq.js"></script>
    <script src="${pageContext.request.contextPath}/canvas/js/controls/color_wq.js"></script>
    <script src="${pageContext.request.contextPath}/canvas/js/controls/drawingmode_wq.js"></script>
    <script src="${pageContext.request.contextPath}/canvas/js/controls/navigation_wq.js"></script>
    <script src="${pageContext.request.contextPath}/canvas/js/controls/size_wq.js"></script>
<%--
    <script src="${pageContext.request.contextPath}/canvas/js/controls/download.js"></script>
--%>
    <script src="${pageContext.request.contextPath}/canvas/js/utils.js"></script>
    <!--白板结束-->

    <script type = "text/javascript" src = "js/chart.js"></script>
    <script type = "text/javascript" src = "js/room.js"></script>
    <script type = "text/javascript" src = "js/room_chart.js"></script>
    <script type = "text/javascript" src = "js/room_camara.js"></script>

    <script type = "text/javascript">
	/** 弹窗：是否同意举手发言 */
	/*MsgBox({content: "是否同意该用户的拒收发言申请", type: MsgBox.CONFIRM,
		containerStyle: "width: 400px", contentStyle: "text-align: center",
		confirmText: "同意", cancelText: "拒绝",
		confirmCallback: function(){
			this.close();
			console.log("y");
		}, cancelCallback: function(){
			this.close();
			console.log("n");
		}
	}).show();*/
	</script>
</body>
</html>