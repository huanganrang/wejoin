;(function(){
	 var contentWrapperObj = $(".content-wrapper")[0],
		headerObj = $(".header")[0],
		footerObj = $(".footer")[0],
		mainObj = $(".main")[0],
		mainLeftObj = $(".main .aside.left")[0],
		mainRightObj = $(".main .aside.right")[0];
		 
	var activeVideObj = $(mainObj).find(".active-video")[0];
	var toolbarObj = $(mainObj).find(".toolbar")[0];
	
	/**
	 * 获取事件
	 */
	var getEvent = function(args){
		var event = window.event || (function(args){
			while(args){
				if(args[0] && ("type" in args[0]) && (typeof args[0].preventDefault === "function") && ("ctrlKey" in args[0]) && ("altKey" in args[0]) && ("shiftKey" in args[0]))
					return args[0];
				
				args = args.callee.caller.arguments;
			}
		})(args);
		
		return event;
	};
	

	
	/** 画布缩放 */
	;(function(){
		var lastX = 0;
		var _width = 0;
		var isDragging = false;
		
		var resizeContainerObj = $(toolbarObj).find(".canvas-resize");
		var ctrlObj = $(resizeContainerObj).find(".position img")[0];
		$(ctrlObj).bind("mousedown", function(e){
			e.preventDefault();
			
			lastX = e.screenX;
			_width = ctrlObj.parentElement.offsetWidth;
			isDragging = true;
		});
		$(document).bind("mousemove", function(e){
			if(!isDragging)
				return;
			
			var offsetX = e.screenX - lastX;
			var width = ctrlObj.parentElement.offsetWidth;
			width += offsetX;
			_width += offsetX;
			if(_width < 0)
				width = 0;
			else if(_width > ctrlObj.parentElement.parentElement.clientWidth)
				width = ctrlObj.parentElement.parentElement.clientWidth;
			else
				width = _width;
			
			ctrlObj.parentElement.style.width = width + "px";
			
			lastX = e.screenX;
			
			//e.preventDefault();
		});
		$(document).bind("blur mouseup", function(e){
			//e.preventDefault();
			
			isDragging = false;
		});
	})();
	
	/** 内容切换 */
	;(function(){
		/**
		 * 判定特定的元素是否是另外一个元素的子元素
		 * @param child {HTMLElement} 要判断的子元素
		 * @param parent {HTMLElement} 要判断的父元素
		 */
		var isChild = function(child, parent){
			while(true){
				if(null == child)
					return false;
				
				if(child == parent)
					return true;
				
				child = child.parentElement;
			}
		};
		
		var objs = $(headerObj).find(".functions > span");
		objs.bind("click", function(e){
			var selectedObj = $(headerObj).find(".functions > span.selected");
			if(this == selectedObj[0])
				return;
			
			selectedObj.removeClass("selected");
			var type = this.className;
			$(this).addClass("selected");
			
			$(mainObj).removeClass("document media whiteboard");
			$(mainObj).addClass(type);
		});
	})();
	
	/** 清空白板 */
	;(function(){
		var clearObj = $(toolbarObj).find(".clear")[0];
		$(clearObj).bind("click", function(){
			MsgBox({content: "确定要清空白板内容吗？", type: MsgBox.CONFIRM,
				containerStyle: "width: 400px", contentStyle: "text-align: center",
				confirmCallback: function(){
					console.log("do clear");
					this.close();
				}, cancelCallback: function(){
					console.log("canceled");
					this.close();
				}
			}).show();
		});
	})();
	
	/** 声音控制 */
	;(function(){
		var lastX = 0;
		var _width = null;
		var isDragging = false,
			isDisabled = false;/* 声音是否被禁用 */
		
		/* 音量控制 */
		var volumeObj = $(footerObj).find(".volume")[0];
		var controlOBj = $(footerObj).find(".volume-control");
		var ctrlObj = $(controlOBj).find(".position img")[0];
		$(ctrlObj).bind("mousedown", function(e){
			e.preventDefault();
			
			lastX = e.screenX;
			_width = ctrlObj.parentElement.offsetWidth;
			isDragging = true;
		});
		$(document).bind("mousemove", function(e){
			if(!isDragging)
				return;
			
			var offsetX = e.screenX - lastX;
			var width = ctrlObj.parentElement.offsetWidth;
			width += offsetX;
			_width += offsetX;
			if(_width < 0)
				width = 0;
			else if(_width > ctrlObj.parentElement.parentElement.clientWidth)
				width = ctrlObj.parentElement.parentElement.clientWidth;
			else
				width = _width;
			
			ctrlObj.parentElement.style.width = width + "px";
			
			lastX = e.screenX;
			
			e.preventDefault();
		});
		$(document).bind("blur mouseup", function(e){
			//e.preventDefault();
			
			isDragging = false;
		});
		
		/* 开/关音频 */
		$(volumeObj).bind("click", function(e){
			if(e.target != this)
				return;
			
			isDisabled = !isDisabled;
			$(this)[isDisabled? "addClass": "removeClass"]("disabled");
			
			/* 音量重置与恢复 */
			if(isDisabled){
				_width = ctrlObj.parentElement.offsetWidth;
				ctrlObj.parentElement.style.width = "0px";
			}else{
				var width = _width;
				if(_width < 0)
					width = 0;
				else if(_width > ctrlObj.parentElement.parentElement.clientWidth)
					width = ctrlObj.parentElement.parentElement.clientWidth;
				
				ctrlObj.parentElement.style.width = width + "px";
			}
		});
	})();
	

	
	/** 会员右键菜单 */
	;(function(){
		var menuObj = $(".context-menu.member")[0];
		menuObj.style.display = "block";
		menuObj.style.left = "0";
		menuObj.style.top = "0";
		
		var menuHeight = menuObj.offsetHeight;
		menuObj.style.left = "0";
		menuObj.style.top = "0";
		menuObj.style.display = "none";
		
		var f = function(e){
			e = e || getEvent(arguments);
			
			e.stopPropagation && e.stopPropagation();
			e.canelBubble = true;
			
			
			var left = e.pageX || e.clientX, top = e.pageY || e.clientY;
			if(e.pageY + menuHeight > document.documentElement.clientHeight)
				top -= menuHeight;
			
			setTimeout(function(){
				$(menuObj).css({left: left + "px", top: top + "px", display: "block"});
			}, 10);
			
			return false;
		};
		
		$(mainLeftObj).find(".member").each(function(i, obj){
			obj.oncontextmenu = f;
		});
		$(document).bind("click contextmenu scroll resize", function(){
			menuObj.style.display = "none";
		});
	})();
	
	/** 分辨率设置 */
	;(function(){
		$(footerObj).find(".setting").bind("click", function(){
			var content = $(".msgbox-content.resolution-setting")[0].cloneNode(true);
			content.style.display = "block";
			
			MsgBox({content: content, type: MsgBox.CONFIRM,
				contentStyle: "text-align: center",
				confirmText: "同意", cancelText: "拒绝",
				confirmCallback: function(){
					this.close();
					console.log("y");
				}, cancelCallback: function(){
					this.close();
					console.log("n");
				}
			}).show();
		});
	})();
	
	/** 房间设置 */
	;(function(){
		$(headerObj).find(".setting").bind("click", function(){
			var content = $(".msgbox-content.global-setting")[0].cloneNode(true);
			content.style.display = "block";

			MsgBox({content: content, type: MsgBox.CONFIRM,
				containerStyle: "width: 400px", 
				confirmText: "确定", cancelText: "取消",
				confirmCallback: function(){
					this.close();
					console.log("y");
				}, cancelCallback: function(){
					this.close();
					console.log("n");
				}
			}).show();
		});
	})();
	
	/** 右侧侧边栏 */
	;(function(){
		/** 展开表情图标列表 */
		var emotionsObj = $(mainRightObj).find(".emotions")[0];
		var giftsObj = $(mainRightObj).find(".gifts")[0];
		var showingObj = null;
		
		var emotionObj = $(mainRightObj).find(".emotion");
		emotionObj.bind("click",  function(e){
			if(null == showingObj){
				showingObj = emotionsObj;
				showingObj.style.display = "block";
			}else{
				if(showingObj == emotionsObj){
					showingObj.style.display = "none";
					showingObj = null;
				}else{
					showingObj.style.display = "none";
					showingObj = emotionsObj;
					showingObj.style.display = "block";
				}
			}
			
			e.stopPropagation();
		});
		
		/** 展开礼物图标列表 */
		var giftObj = $(mainRightObj).find(".gift");
		giftObj.bind("click", function(e){
			if(null == showingObj){
				showingObj = giftsObj;
				showingObj.style.display = "block";
			}else{
				if(showingObj == giftsObj){
					showingObj.style.display = "none";
					showingObj = null;
				}else{
					showingObj.style.display = "none";
					showingObj = giftsObj;
					showingObj.style.display = "block";
				}
			}
			
			
			e.stopPropagation();
		});
		
		$(document).bind("click", function(){
			if(showingObj){
				showingObj.style.display = "none";
				showingObj = null;
			}
		});
	})();
	
	/* 公聊/私聊状态切换 */
	;(function(){
		var visibilityObjs = $(mainRightObj).find(".conversation-visibility > span");
		visibilityObjs.bind("click", function(){
			var currentSelectedObj = $(mainRightObj).find(".conversation-visibility > span.selected")[0];
			if(currentSelectedObj == this)
				return;
			
			$(currentSelectedObj).removeClass("selected");
			$(this).addClass("selected");
		});
	})();
})();