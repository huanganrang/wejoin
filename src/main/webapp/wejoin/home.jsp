<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>微区首页</title>
<link href="${pageContext.request.contextPath}/wejoin/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/wejoin/css/jquery.style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/wejoin/css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jslib/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/tab.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/jquery.mCustomScrollbar.concat.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/js.js" type="text/javascript" charset="utf-8"></script>
</head>

<body class="ltbj">
<div class="header">
	<div class="logo_list"></div>
    <div class="lb_menu">
    	<a href="#" class="pd_1" onclick="showSyldBox()">免费创建频道</a>
        <a href="#" class="pd_2">免费创建社群</a>
        <a href="#" class="pd_3">微币充值</a>
        <a href="#" class="pd_4">使用帮助</a>
    </div>
    
    <div class="aa" style="width:48%;">
    <span>游客：我是会飞的鱼</span>
    <ol><a href="#">注册</a>  |   <a href="#">登录</a>   </ol>
    <div class="hed_1"><a href="#">下载APP</a></div>
    <div class="hed_2"><a href="#">下载PC客户端</a></div>
    <div class="tel"></div>
    <div class="clear"></div>
    </div>
</div>

<div class="list_main">
	<div class="list_left">
    	<ul>
        	<div><span>频道分类</span></div>
        	<li><a href="#"><ol>放声SHOW唱</ol> <em>245.300</em></a></li>
            <li><a href="#"><ol>你是歌手</ol> <em>245.300</em></a></li>
            <li><a href="#"><ol>音乐合辑</ol> <em>245.30</em></a></li>
            <li><a href="#"><ol>生活圈子</ol> <em>245.300</em></a></li>
            <li><a href="#"><ol>社交网络</ol> <em>245.300</em></a></li>
            <li><a href="#"><ol>直播频道</ol> <em>245.300</em></a></li>
        </ul>
        <div class="line"></div>
        <ul>
        	<div style="margin-top:10px;"><span>社区分类</span></div>
        	<li><a href="#"><ol>放声SHOW唱</ol> <em>245.300</em></a></li>
            <li><a href="#"><ol>你是歌手</ol> <em>245.300</em></a></li>
            <li><a href="#"><ol>音乐合辑</ol> <em>245.30</em></a></li>
            <li><a href="#"><ol>生活圈子</ol> <em>245.300</em></a></li>
            <li><a href="#"><ol>社交网络</ol> <em>245.300</em></a></li>
            <li><a href="#"><ol>直播频道</ol> <em>245.300</em></a></li>
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
               	  <input type="text" class="puta" onblur="if(this.value==''){this.value='请输入房间 / 室主号';this.style.color='#ccc'}" onfocus="if(this.value=='请输入房间 / 室主号'){this.value='';this.style.color='#333'}" value="请输入房间 / 室主号" id="textfield" name="telphone" style="color:#ccc;">
                    <input name="" type="submit" value="" class="putb"/>
                </form>
          </div>
        </div>
        
      <div class="list_txt">
       	  <div id="con_one_1">
           	  <div class="list_main1">
           	    <ul>
               	  <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#" class="a_1">进入频道</a></em></div>
                  </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#" class="a_1">进入频道</a></em></div>
                      </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#" class="a_1">进入频道</a></em></div>
                      </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#" class="a_1">进入频道</a></em></div>
                      </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#" class="a_1">进入频道</a></em></div>
                      </li>
                        
                  <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#" class="a_1">进入频道</a></em></div>
                  </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#" class="a_1">进入频道</a></em></div>
                      </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#" class="a_1">进入频道</a></em></div>
                      </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#" class="a_1">进入频道</a></em></div>
                      </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#" class="a_1">进入频道</a></em></div>
                      </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#" class="a_1">进入频道</a></em></div>
                      </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#" class="a_1">进入频道</a></em></div>
                      </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#" class="a_1">进入频道</a></em></div>
                      </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#" class="a_1">进入频道</a></em></div>
                      </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#" class="a_1">进入频道</a></em></div>
                      </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#" class="a_1">进入频道</a></em></div>
                      </li>
                </ul>
                   <div class="clear"></div> 
                  <div class="fax" style="right:60px; bottom:-30px;">
                      <a href="#">上一页</a>
                          <div class="fax_list">
                              <span>1</span>
                              <div class="span_list">
                                  <div class="content mCustomScrollbar" style="height:95px;">
                                    <a href="#">1</a>
                                    <a href="#">2</a>
                                    <a href="#">3</a>
                                    <a href="#">4</a>
                                    <a href="#">5</a>
                                  <a href="#">6</a>                                </div>
                              </div>
                      </div>
                  <a href="#">下一页</a>                </div>
              </div>
          </div>
          <div id="con_one_2" style="display:none;">
          		<div class="list_main1">
           	    <ul>
               	  <li>
                       	  <div class="list_1"><span>社区列表</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/dog.gif" /></span>  <em>这家伙很懒，什么都没有写！</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#">进入频道</a></em></div>
                  </li>
                        
                      <li>
                       	  <div class="list_1"><span>社区列表</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#">进入频道</a></em></div>
                      </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/dog.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#">进入频道</a></em></div>
                      </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>这家伙很懒，什么都没有写！</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#">进入频道</a></em></div>
                      </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#">进入频道</a></em></div>
                      </li>
                        
                  <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#">进入频道</a></em></div>
                  </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#">进入频道</a></em></div>
                      </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/dog.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#">进入频道</a></em></div>
                      </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#">进入频道</a></em></div>
                      </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>这家伙很懒，什么都没有写！</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#">进入频道</a></em></div>
                      </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#">进入频道</a></em></div>
                      </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#">进入频道</a></em></div>
                      </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#">进入频道</a></em></div>
                      </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#">进入频道</a></em></div>
                      </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#">进入频道</a></em></div>
                      </li>
                        
                      <li>
                       	  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                          <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                          <div class="list_3"><span>创建者：会飞的鱼</span>  <em><a href="#">进入频道</a></em></div>
                      </li>
                </ul>
                   <div class="clear"></div> 
                  <div class="fax" style="right:60px; bottom:-30px;">
                      <a href="#">上一页</a>
                          <div class="fax_list">
                              <span>1</span>
                              <div class="span_list">
                                  <div class="content mCustomScrollbar" style="height:95px;">
                                    <a href="#">1</a>
                                    <a href="#">2</a>
                                    <a href="#">3</a>
                                    <a href="#">4</a>
                                    <a href="#">5</a>
                                  <a href="#">6</a>                                </div>
                              </div>
                      </div>
                  <a href="#">下一页</a>                </div>
              </div>
          </div>
      </div>
  </div>
    
    <div class="hot_list">
    	<div><span>房间人气排行榜</span></div>
        <ul>
        	<li><a href="#"><span>1</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>2</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>3</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>4</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>5</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>6</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>7</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>8</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>9</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>10</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>11</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>12</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>13</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>14</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>15</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>16</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>17</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
        </ul>
    </div>
</div>


<div class="windows djcgBox" id="djcgBox" style="display:none;" >
		  <div class="windowsBg"></div>
		  <div class="windows_box">
			<div class="djcgBox_con">
				<div class="dj_top"></div>
                <div class="dj_con">
                	<div class="dj_title">
                    	<span><strong>会飞的鱼</strong> 的频道</span>
                        <ol>房间数：<strong>200</strong></ol>
                    </div>
					
                    <div class="fz_xt">
                    	<div class="content mCustomScrollbar" style="height:410px;">
                        	<ul>
                            	<li>
                                  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                                  <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                                  <div class="list_3"><span>房号：292680</span>   <span>房主：会飞的鱼</span> <em><a href="#">进入房间</a></em></div>
                              	</li>
                                <li>
                                  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                                  <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                                  <div class="list_3"><span>房号：292680</span>   <span>房主：会飞的鱼</span> <em><a href="#">进入房间</a></em></div>
                              	</li>
                                <li>
                                  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                                  <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                                  <div class="list_3"><span>房号：292680</span>   <span>房主：会飞的鱼</span> <em><a href="#">进入房间</a></em></div>
                              	</li>
                                <li>
                                  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                                  <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                                  <div class="list_3"><span>房号：292680</span>   <span>房主：会飞的鱼</span> <em><a href="#">进入房间</a></em></div>
                              	</li>
                                <li>
                                  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                                  <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                                  <div class="list_3"><span>房号：292680</span>   <span>房主：会飞的鱼</span> <em><a href="#">进入房间</a></em></div>
                              	</li>
                                <li>
                                  <div class="list_1"><span>稻米之家</span>  <em>在线：292680</em></div>
                                  <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                                  <div class="list_3"><span>房号：292680</span>   <span>房主：会飞的鱼</span> <em><a href="#">进入房间</a></em></div>
                              	</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="dj_btn"></div>
			</div>
			<div class="close_btn"></div>
		  </div>
</div>







<div class="windows syldBox" id="syldBox" style="display:none;" >
		  <div class="windowsBg"></div>
		  <div class="windows_box">
			<div class="tjcg_con">
            	<div class="dj_top1"></div>
                <div class="tjcg_bj">
            	<div class="dj_title1">
                	<span>创建频道</span>
                </div>
                <div class="tjcg_list">
                	<form action="" method="get">
                    	<a class="btn_addPic href"="javascript:void(0);"><span>频道封面照上传</span> 
                        <input class="filePrew" title="支持jpg、jpeg、gif、png格式，文件小于5M" tabIndex="3" type="file" size="3" name="pic"></a>
                        <ul>
                        	<li><input type="text" class="putc" onblur="if(this.value==''){this.value='请填写频道名称';this.style.color='#999'}" onfocus="if(this.value=='请填写频道名称'){this.value='';this.style.color='#333'}" value="请填写频道名称" id="textfield" name="telphone" style="color:#999;"></li>
                            <li><span><select name="" class="putd">
                              		<option>名师堂-电商运营培训</option>
                                    <option>名师堂-电商运营培训2</option>
                            	</select>
                                </span>
                            </li>
                            <li><textarea class="pute" name="content" id="textfield" onblur="if(this.value==''){this.value='频道简介';};" onfocus="javascript:if(this.value == '频道简介') this.value = '';">频道简介</textarea></li>
                            <li><input name="" type="submit" value="创建频道" class="putf"/></li>
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
</body>
</html>
