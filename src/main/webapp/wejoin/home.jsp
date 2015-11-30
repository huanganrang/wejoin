<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>微区首页</title>
<script type="text/javascript">
var base = '${pageContext.request.contextPath}/';
var namespace = "home";
</script>
<link href="${pageContext.request.contextPath}/wejoin/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/wejoin/css/login.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/wejoin/css/jquery.style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/wejoin/css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jslib/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.3/jquery.easyui.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/tab.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/jquery.mCustomScrollbar.concat.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/jquery.cookie.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/home.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/common.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/login.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/check.js" type="text/javascript" charset="utf-8"></script>
</head>

<body class="ltbj">
<input type="hidden" id="userToken" value="${sessionScope.userToken.token}" />
<div class="header" style="height:72px;">
	<div class="logo_list2">
		<c:choose>
			<c:when test="${!sessionScope.userToken.loginMark}">
				<div class="logo_dl">
		        	<a href="javascript:void(0);" onclick="showDjcgBox()">登录</a> 
		            <a href="javascript:void(0);" onclick="showSyldBox()">注册</a>
		        </div>
		        <c:if test="${sessionScope.userToken.token != null}">
		        	<div class="logo_name">${sessionScope.userToken.nickName} 您好！ </div>
		        </c:if>
			</c:when>
			<c:otherwise>
				<div class="logo_name">会员：${sessionScope.userToken.nickName} 您好！ </div>
			</c:otherwise>
        </c:choose>
	</div>

    <div class="lb_menu">
    	<a href="javascript:void(0);" class="pd_1" onclick="showChannelAddBox()">免费创建频道</a>
        <a href="javascript:void(0);" class="pd_2">免费创建社群</a>
        <a href="javascript:void(0);" class="pd_3">微币充值</a>
        <a href="javascript:void(0);" class="pd_4">使用帮助</a>
    </div>
    
    <div class="aa" style="width:48%; margin-top:13px;">
    <!--<span>游客：我是会飞的鱼</span>
    <ol><a href="javascript:void(0);">注册</a>  |   <a href="javascript:void(0);">登录</a>   </ol>-->
    <div class="hed_1"><a href="javascript:void(0);">下载APP</a></div>
    <div class="hed_2"><a href="javascript:void(0);">下载PC客户端</a></div>
    <div class="tel"></div>
    <div class="clear"></div>
    </div>
</div>

<div class="list_main">
	<div class="list_left">
    	<ul id="channelCategory">
        	<div><span>频道分类</span></div>
        </ul>
        <div class="line"></div>
        <ul id="communityCategory">
        	<div style="margin-top:10px;"><span>社区分类</span></div>
        </ul>
    </div>
  <div class="list_right">
    	<div class="search_title">
        	<ul>
            	<li id="one1" onclick="setTab('one',1,2)" class="hover">频道列表</li>
                <li id="one2" onclick="setTab('one',2,2)">社群列表</li>
            </ul>
            <div class="lise_se">
                <form action="" method="get">
               	  <input type="text" class="puta" placeholder="请输入房间 / 室主号" id="textfield" name="telphone" style="color:#333;">
                    <input name="" type="submit" value="" class="putb"/>
                </form>
          </div>
        </div>
        
      <div class="list_txt">
       	  <div id="con_one_1">
           	  <div class="list_main1">
           	    <ul>
               	  <li id="channelTemplate" style="display:none;">
                  		<div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                      		<div class="list_2"><span><img src="" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区，每个人眼里都有一个不同的微社区，每个人眼里都有一个不同的微社区</em></div>
                      		<div class="list_3">
                      			<span>创建者：会飞的鱼</span>  
                      			<ol><a onclick="showLoginBox()" class="btn_ckxd" href="javascript:void(0);">创建房间</a></ol>
                      			<em><a href="javascript:void(0);" class="a_1">进入频道</a></em>
                      		</div>
                  </li>
                </ul>
                   <div class="clear"></div> 
                  <div class="fax" style="right:60px; bottom:-30px; z-index: 999;">
                      <a href="javascript:void(0);" onclick="previousPage(this, 1);">上一页</a>
                          <div class="fax_list">
                              <span>1</span>
                              <div class="span_list">
                                  <div class="content" style="height:95px;">
                                  </div>
                              </div>
                      	</div>
                  	<a href="javascript:void(0);" onclick="nextPage(this, 1);">下一页</a>                </div>
              </div>
          </div>
          <div id="con_one_2" style="display:none;">
          		<div class="list_main1">
           	    <ul>
               	  <li id="communityTemplate" style="display: none;">
                       	  <div class="list_1"><span>社区列表</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/dog.gif" onerror="javascript:this.src='images/dog.gif'"/></span>  <em>这家伙很懒，什么都没有写！</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="javascript:void(0);">进入社区</a></em></div>
                  </li>
                </ul>
                   <div class="clear"></div> 
                  <div class="fax" style="right:60px; bottom:-30px;">
                      <a href="javascript:void(0);" onclick="previousPage(this, 2);">上一页</a>
                          <div class="fax_list">
                              <span>1</span>
                              <div class="span_list">
                                  <div class="content" style="height:95px;"></div>
                              </div>
                      </div>
                  <a href="javascript:void(0);" onclick="nextPage(this, 2);">下一页</a>                </div>
              </div>
          </div>
      </div>
  </div>
    
    <div class="hot_list">
    	<div><span>房间人气排行榜</span></div>
        <ul>
        	<li><a href="javascript:void(0);"><span>1</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="javascript:void(0);"><span>2</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="javascript:void(0);"><span>3</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="javascript:void(0);"><span>4</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="javascript:void(0);"><span>5</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="javascript:void(0);"><span>6</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="javascript:void(0);"><span>7</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="javascript:void(0);"><span>8</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="javascript:void(0);"><span>9</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="javascript:void(0);"><span>10</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="javascript:void(0);"><span>11</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="javascript:void(0);"><span>12</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="javascript:void(0);"><span>13</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="javascript:void(0);"><span>14</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="javascript:void(0);"><span>15</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="javascript:void(0);"><span>16</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="javascript:void(0);"><span>17</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
        </ul>
    </div>
</div>


<div class="windows chcBox" id="chcBox" style="display:none;" >
		  <div class="windowsBg"></div>
		  <div class="windows_box">
			<div class="djcgBox_con">
				<div class="dj_top_c"></div>
                <div class="dj_con_c">
                	<div class="dj_title_c">
                    	<span><strong>会飞的鱼</strong> 的频道</span>
                        <ol>房间数：<strong id="roomsCount"></strong></ol>
                    </div>
					
                    <div class="fz_xt">
                    	<div class="content mCustomScrollbar" style="height:410px;">
                        	<ul>
                            	<li id="channel_roomTemplate" style="display: none;">
                                  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                                  <div class="list_2"><span><img src="images/pic1.gif"  onerror="javascript:this.src='images/pic1.gif'"/></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区，每个人眼里都有一个不同的微社区</em></div>
                                  <div class="list_3"><span>房号：292680</span>   <span>房主：会飞的鱼</span> <em><a href="javascript:void(0);">进入房间</a></em></div>
                              	</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="dj_btn_c"></div>
			</div>
			<div class="close_btn"></div>
		  </div>
</div>


<div class="windows chaBox" id="chaBox" style="display:none;" >
		  <div class="windowsBg"></div>
		  <div class="windows_box">
			<div class="tjcg_con">
            	<div class="dj_top1"></div>
                <div class="tjcg_bj">
            	<div class="dj_title1">
                	<span>创建频道</span>
                </div>
                <div class="tjcg_list">
                	<form action="" method="post" enctype="multipart/form-data" id="createChannelForm">
                		<input type="hidden" name="type" id="type"> 
                		<input type="hidden" name="param" id="param"> 
                    	<a class="btn_addPic" href="javascript:void(0);">
                    	<img class="img-preview" src="images/xj.gif">
                    	<span>频道封面照上传</span> 
                        <input class="filePrew" title="支持jpg、jpeg、gif、png格式，文件小于5M" tabIndex="3" type="file" size="3" name="uploadFile" id="uploadFile"></a>
                        <ul>
                        	<li><input type="text" class="putc" placeholder="请填写频道名称" id="channelName" name="channelName" style="color:#333;"></li>
                            <li>
                            	<span>
	                            	<select id="categoryId" class="putd" style="color:#333;"></select>
                                </span>
                            </li>
                            <li><textarea class="pute" name="shortDesc" id="shortDesc" placeholder="频道简介" style="color:#333;"></textarea></li>
                            <li><input id="createChannelBtn" type="button" value="创建频道" class="putf" onclick="javascript:$('#createChannelForm').submit();"/></li>
                            <div class="clear"></div>
                        </ul>
                        <div class="clear"></div>
                    </form>
                </div>
                </div>
                <div class="dj_btn1"></div>
            </div>
			<div class="close_btn"></div>
		  </div>
	</div>
	
	<!--创建房间 开始-->
<div class="windows loginBox" id="loginBox" style="display:none;" >
		  <div class="windowsBg"></div>
			<div class="windows_box">
			<div class="tjcg_con">
            	<div class="dj_top1"></div>
                <div class="tjcg_bj">
            	<div class="dj_title1">
                	<span>创建房间</span>
                </div>
                <div class="log_list">
                	<form action="" method="get">
                	<ul>
                    	<li><input type="text" style="color: rgb(153, 153, 153);" name="telphone" id="textfield" maxlength="10" value="房间标题" onfocus="if(this.value=='房间标题'){this.value='';this.style.color='#333'}" onblur="if(this.value==''){this.value='房间标题';this.style.color='#999'}" class="putc"></li>
                        <li><input type="text" style="color: rgb(153, 153, 153);" name="telphone" id="textfield" value="直播密码" onfocus="if(this.value=='直播密码'){this.value='';this.style.color='#333'}" onblur="if(this.value==''){this.value='直播密码';this.style.color='#999'}" class="putc"></li>
                        <li><input type="text" style="color: rgb(153, 153, 153);" name="telphone" id="textfield" value="开始时间" onfocus="if(this.value=='开始时间'){this.value='';this.style.color='#333'}" onblur="if(this.value==''){this.value='开始时间';this.style.color='#999'}" class="putc"></li>
                        <li><input type="text" style="color: rgb(153, 153, 153);" name="telphone" id="textfield" value="结束时间" onfocus="if(this.value=='结束时间'){this.value='';this.style.color='#333'}" onblur="if(this.value==''){this.value='结束时间';this.style.color='#999'}" class="putc"></li>
                        <li><input name="" type="submit" value="创建房间" class="putf"/></li>
                        </form>
                    </ul>
                </div>
                </div>
                <div class="dj_btn1"></div>
            </div>
			<div class="close_btn"></div>
  </div>
</div>
<!--创建房间 结束-->


<!--登录 开始-->
		<div class="windows djcgBox" id="djcgBox" style="display:none;" >
			<div class="windowsBg"></div>
		  	<div class="windows_box">
				<div class="djcgBox_con">
					<div class="dj_top_a"></div>
		               <div class="dj_con_a">
		               	<div class="dj_title_a">
		                   	<span></span>
		                       <div>
		                       	<ol>用户登录</ol>
		                           <em>USER LOGIN</em>
		                       </div>
		                   </div>
		                   <ul>
		                   	<form action="" method="get">
		                   	<li><input type="text" class="pt1" placeholder="请输入用户名" id="username" style="color:#333;"><b></b></li>
		                       <li><input type="password" class="pt1" placeholder="请输入密码" id="password" style="color:#333;"><p></p></li>
		                       <strong><a href="javascript:void(0);" onclick="showTjcgBox()">找回密码</a></strong>
		                       <input name="" type="button" value="登  录" class="tzam" id="login_btn"/>
		                       </form>
		                   </ul>
		               </div>
		               <div class="dj_btn"></div>
				</div>
				<div class="close_btn"></div>
			</div>
		</div>
		<!--登录 结束-->

		<!--找回密码 开始-->
		<div class="windows tjcgBox" id="tjcgBox" style="display:none;" >
			  <div class="windowsBg"></div>
			  <div class="windows_box">
				<div class="tjcg_con">
		           	<div class="dj_top_a"></div>
		               <div class="tjcg_bj_b">
		           	<div class="dj_title_a">
		                   	<span></span>
		                       <div>
		                       	<ol>密码找回</ol>
		                           <em>PASSWORD RETRIEVE</em>
		                       </div>
		               </div>
		               <div class="tjcg_list_b">
		               	<ul>
		                   	<form action="" method="get">
		                   	<li><input type="text" class="pt2" onblur="if(this.value==''){this.value='请输入手机号获取验证码';this.style.color='#ccc'}" onfocus="if(this.value=='请输入手机号获取验证码'){this.value='';this.style.color='#333'}" value="请输入手机号获取验证码" id="textfield" name="telphone" style="color:#ccc;"><ol><a href="#">点击获取</a></ol></li>
		                       <li><input type="text" class="pt3" onblur="if(this.value==''){this.value='请输入验证码';this.style.color='#ccc'}" onfocus="if(this.value=='请输入验证码'){this.value='';this.style.color='#333'}" value="请输入验证码" id="textfield" name="telphone" style="color:#ccc;"></li>
		                       <li><span>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</span><input type="password" class="pt2" onblur="if(this.value==''){this.value='请输入新密码';this.style.color='#ccc'}" onfocus="if(this.value=='请输入新密码'){this.value='';this.style.color='#333'}" value="请输入新密码" id="textfield" name="telphone" style="color:#ccc;"></li>
		                       <li style="margin-bottom:40px; "><span>确认密码：</span><input type="password" class="pt2" onblur="if(this.value==''){this.value='请重复输入新密码';this.style.color='#ccc'}" onfocus="if(this.value=='请重复输入新密码'){this.value='';this.style.color='#333'}" value="请重复输入新密码" id="textfield" name="telphone" style="color:#ccc;"></li>
		                       <input name="" type="submit" value="确  定" class="tzam"/>
		                       </form>
		                   </ul>
		               </div>
		               </div>
		               <div class="dj_btn"></div>
		           </div>
				<div class="close_btn"></div>
			  </div>
		</div>
		<!--找回密码 结束-->

		<!--注册 开始-->
		<div class="windows syldBox" id="syldBox" style="display:none;" >
			  <div class="windowsBg"></div>
			  <div class="windows_box">
				<div class="tjcg_con">
		           	<div class="dj_top_a"></div>
		               <div class="tjcg_bj_b">
		           	<div class="dj_title_a">
		                   	<span class="zc_tb"></span>
		                       <div>
		                       	<ol>用户注册</ol>
		                           <em>USER REGISTRATION</em>
		                       </div>
		               </div>
		               <div class="tjcg_list_b">
		               	<ul>
		                   	<form action="" method="get">
		                   	<li><input type="text" class="pt2" placeholder="请输入手机号获取验证码" id="telphone" style="color:#333;"><ol><a href="javascript:void(0);" class="validCode_btn">点击获取</a></ol></li>
		                       <li><input type="text" class="pt3" placeholder="请输入验证码" id="validCode" style="color:#333;"></li>
		                       <li><span>用户昵称：</span><input type="text" class="pt2" placeholder="请输入用户昵称" id="username" style="color:#333;"></li>
		                       <li style="margin-bottom:40px; "><span>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</span><input type="password" class="pt2" placeholder="请输入密码" id="password" style="color:#333;"></li>
		                       <input name="" type="button" value="注  册" class="tzam" id="register_btn"/>
		                       </form>
		                   </ul>
		               </div>
		               </div>
		               <div class="dj_btn"></div>
		           </div>
				<div class="close_btn"></div>
			  </div>
		</div>
</body>
</html>
