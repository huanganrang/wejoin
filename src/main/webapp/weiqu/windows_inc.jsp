<%--
  Created by IntelliJ IDEA.
  User: john
  Date: 16/4/2
  Time: 下午2:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--创建点播 开始-->
<div class="windows uplodBox" id="uplodBox" style="display:none;" >
  <div class="windowsBg"></div>
  <div class="windows_box">
    <div class="uplodBox_con">
      <div class="up_yy">
        <span>上传影音文件</span>
        <input type="file" name="uploadFile" size="3" tabindex="3" title="支持jpg、jpeg、gif、png格式，文件小于5M" class="filePrew">
      </div>
      <div class="up_list">
        <ul>
          <form action="" method="get">
            <li><input type="text" class="p1" onBlur="if(this.value==''){this.value='请填写影音名称';this.style.color='#ccc'}" onFocus="if(this.value=='请填写影音名称'){this.value='';this.style.color='#333'}" value="请填写影音名称" id="textfield" name="email" style="color:#ccc;"></li>
            <li><textarea name="Content" rows="4" class="pute" style="color:#ccc" onFocus="if(this.value=='听音简介') {this.value='';}this.style.color='#333';" onBlur="if(this.value=='') {this.value='听音简介';this.style.color='#ccc';}" onKeyUp="checkLength(this);">听音简介</textarea></li>
          </form>
        </ul>
      </div>
      <div class="up_an">
        <a href="#" class="a2">确定创建</a>
      </div>
    </div>
    <div class="close_btn"><a href="#">取消返回</a></div>
  </div>
</div>
<!--创建点播 结束-->



<!--创建房间 开始-->
<div class="windows demandBox" id="demandBox" style="display:none;" >
  <div class="windowsBg"></div>
  <div class="windows_box">
    <div class="uplodBox_con">
      <div class="up_yy">
        <span class="tb2">社群列表小图</span>
        <input type="file" name="uploadFile" size="3" tabindex="3" title="支持jpg、jpeg、gif、png格式，文件小于5M" class="filePrew">
      </div>
      <div class="up_list">
        <ul>
          <form action="" method="get">
            <li><input type="text" class="p1" onBlur="if(this.value==''){this.value='请填写房间名称';this.style.color='#ccc'}" onFocus="if(this.value=='请填写房间名称'){this.value='';this.style.color='#333'}" value="请填写房间名称" id="textfield" name="email" style="color:#ccc;"></li>
            <li>
							<span>
								<select name="" class="putd">
                                  <option>这里写分类</option>
                                  <option>这里写分类22</option>
                                </select>
                            </span>
            </li>
            <li><textarea name="Content" rows="4" class="pute" style="color:#ccc" onFocus="if(this.value=='房间简介') {this.value='';}this.style.color='#333';" onBlur="if(this.value=='') {this.value='房间简介';this.style.color='#ccc';}" onKeyUp="checkLength(this);">房间简介</textarea></li>
          </form>
        </ul>
      </div>
      <div class="up_an">
        <a href="#" class="a2">确定创建</a>
      </div>
    </div>
    <div class="close_btn"><a href="#">取消返回</a></div>
  </div>
</div>
<!--创建房间 结束-->

<!--创建频道 开始-->
<div class="windows channelBox" id="channelBox" style="display:none;" >
  <div class="windowsBg"></div>
  <div class="windows_box">
    <div class="uplodBox_con">
      <div class="up_yy">
        <span class="tb2">频道列表小图</span>
        <input type="file" name="uploadFile" size="3" tabindex="3" title="支持jpg、jpeg、gif、png格式，文件小于5M" class="filePrew">
      </div>
      <div class="up_list">
        <ul>
          <form action="" method="get">
            <li><input type="text" class="p1" onBlur="if(this.value==''){this.value='请填写频道名称';this.style.color='#ccc'}" onFocus="if(this.value=='请填写频道名称'){this.value='';this.style.color='#333'}" value="请填写频道名称" id="textfield" name="email" style="color:#ccc;"></li>
            <li>
							<span>
								<select name="" class="putd">
                                  <option>这里写分类</option>
                                  <option>这里写分类22</option>
                                </select>
                            </span>
            </li>
            <li><textarea name="Content" rows="4" class="pute" style="color:#ccc" onFocus="if(this.value=='频道简介') {this.value='';}this.style.color='#333';" onBlur="if(this.value=='') {this.value='频道简介';this.style.color='#ccc';}" onKeyUp="checkLength(this);">频道简介</textarea></li>
          </form>
        </ul>
      </div>
      <div class="up_an">
        <a href="#" class="a2">确定创建</a>
      </div>
    </div>
    <div class="close_btn"><a href="#">取消返回</a></div>
  </div>
</div>
<!--创建频道 结束-->

<!--房间列表 开始-->
<div class="windows roomBox" id="roomBox" style="display:none;" >
  <div class="windowsBg"></div>
  <div class="windows_box">
    <div class="room_center">
      <ul>

      </ul>
    </div>
    <div class="up_an"><a href="#" class="a2">确定创建</a></div>
    <div class="close_btn"><a href="#">取消返回</a></div>
  </div>
</div>
<!--房间列表 结束-->