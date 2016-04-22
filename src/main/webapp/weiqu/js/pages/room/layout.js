;(function(){
    var contentWrapperObj = $(".content-wrapper")[0],
        headerObj = $(".header")[0],
        footerObj = $(".footer")[0],
		mainObj = $(".main")[0];
	
	var mainContentObj = $(".main .content")[0],
        mainLeftObj = $(".main .aside.left")[0],
        mainRightObj = $(".main .aside.right")[0];
    
    /** 高度自适应 */
    ;(function(){
        var f = function(){
			var minHeight = 400;
            var totalHeight = $(window).height();
			if(totalHeight < minHeight)
				totalHeight = minHeight;
			
			var headerHeight = totalHeight * 0.064;
			headerObj.style.height = headerObj.style.lineHeight = headerHeight + "px";
            var height = totalHeight - headerObj.offsetHeight - footerObj.offsetHeight;
            document.body.style.height = height + "px";
        };
        f();
        $(window).bind("resize", f);
    })();
    
    /** 左侧区域有最小值地按百分比缩放 */
    ;(function(){
        var f = function(){
            var minWidth = 100;
            
            var leftObjs = [$(".header .holder > .left")[0], $(".main > .left")[0], $(".footer .holder > .left")[0]];
            if(leftObjs[0].offsetWidth < minWidth){
                for(var i = 0; i < leftObjs.length; i++){
                    var obj = leftObjs[i];
                    obj.parentElement.style.paddingLeft = minWidth + "px";
                    obj.style.width = minWidth + "px";
                };
            }
        }
        f();
        $(window).bind("resize", f);
    })();
    
    /** 右侧区域有最小值地按百分比缩放 */
    ;(function(){
        var f = function(){
            var minWidth = 100;
            
            var rightObjs = [$(".header .holder > .right")[0], $(".main > .right")[0], $(".footer .holder > .right")[0]];
            if(rightObjs[0].offsetWidth < minWidth){
                for(var i = 0; i < rightObjs.length; i++){
                    var obj = rightObjs[i];
                    obj.parentElement.style.paddingRight = minWidth + "px";
                    obj.style.width = minWidth + "px";
                };
            }
        }
        f();
        $(window).bind("resize", f);
    })();
    
    /** 左侧区域中视频区域高度自动设置（视觉上直接呈现出来的最多2个。一个也没有时隐藏区域） */
    ;(function(){
		var videosObj = $(mainLeftObj).find(".videos")[0];
		
        var f = function(){
            var count = 2, margin = 9;
            
            if(0 == videosObj.children){
                videosObj.style.display = "none";
                return;
            }
            
            var videosHeight = 0, memberHeight = 0;
            if(videosObj.children.length > count){
                // videosObj.style.overflowY = "scroll";
				
                var height = videosObj.children[0].offsetHeight;
                videosHeight = (count + 1) * margin + count * height - 1;
                // videosObj.style.overflowY = "auto";
				videosObj.style.overflowX = "hidden";
                videosObj.style.height = videosHeight + "px";
            }
            
            // console.log(height, count, margin, memberHeight);
            
            var totalHeight = mainLeftObj.offsetHeight;
            memberHeight = totalHeight - videosHeight;
            
            // console.log(height, totalHeight, memberHeight);
            
            if(memberHeight > 0)
                $(mainLeftObj).find(".members")[0].style.height = memberHeight + "px";
        };
		f();
		$(f);
        $(window).bind("resize", f);
    })();
    
    /** 右侧区域中的聊天窗口高度自动设置 */
    ;(function(){
        var f = function(){
            var totalHeight = $(mainRightObj).height();
            var barHeight = $(mainRightObj).find(".input-toolbar")[0].offsetHeight,
                visibilitySettingHeight = $(mainRightObj).find(".conversation-visibility")[0].offsetHeight,
                inputHeight = $(mainRightObj).find(".input")[0].scrollHeight;
            
            $(mainRightObj).find(".conversation").height((totalHeight - barHeight - visibilitySettingHeight - inputHeight) + "px");
        };
        f();
        $(window).bind("resize", f);
    })();
	
	/** 中间区域高度自动设置 */
	;(function(){
        var f = function(){
            var totalHeight = $(mainObj).height();
            var barHeight = $(mainObj).find(".toolbar." + mainObj.className.replace(/.*\b(whiteboard|document|media\b.*)/, "$1"))[0].offsetHeight;
            
            $(mainContentObj).height((totalHeight - barHeight) + "px");
        };
        f();
        $(window).bind("resize", f);
    })();
    
    /** 中间区域的影音部分按4:3比例自动缩放 */
    ;(function(){
        var f = function(){
            var totalHeight = $(mainObj).find(".content").height();
            var height = totalHeight - 15 * 2;
            var width = totalHeight / 3 * 4;
            
            $(mainObj).find(".wrapper .media").css({width: width + "px", height: height + "px"});
        };
        f();
        $(window).bind("resize", f);
    })();
})();