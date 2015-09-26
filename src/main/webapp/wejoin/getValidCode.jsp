<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/wejoin/css/login.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jslib/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/login.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
	 <table>
        <tr>
            <td>用户手机号码：</td>
            <td><input type="text" name="mobile" id="mobile"></td>
        </tr>
        <tr>
            <td>验证码为:</td>
            <td><input type="text" name="validCode" id="validCode"></td>
            <td><input type="button" onclick="getValidCode()" value="获取验证码">
        </tr>
        <tr>
            <td>用户昵称:</td>
            <td><input type="text" name="nickName" id="nickName"/> </td>

        </tr>
        <tr>
            <td>用户密码:</td>
            <td><input type="text" name="password" id="password"/> </td>
            <td><input type="button" onclick="registerUser()" value="注册"></td>
        </tr>

        <tr>
            <td>用户Token:</td>
            <td><input type="text" name="token" id="token"/> </td>

        </tr>
    </table>

    <script type="text/javascript" language="javascript">
        var local = "http://localhost:8080";
        var remote = "http://139.196.34.76";
        function getValidCode(){
            var mobile = $("#mobile").val();
            var valiCode = $("#validCode").val();
            jQuery.ajax({
                type: "POST",
                url: remote+"/ValidCode/ValidCode",
//                 url: "${pageContext.request.contextPath}/userController/test",
                contentType:'application/json;charset=UTF-8',
                data: JSON.stringify({"mobile":mobile,"channel":"register"}),
                dataType:"json",
                success:function (data, status, jqXHR) {
                   alert(data.returnValue);
                   $("#validCode").val(data.returnValue);
                }
                
            });
            
        }

        function registerUser(){
            var mobile = $("#mobile").val();
            var valiCode = $("#validCode").val();
            var password = $("#password").val();
            var nickName = $("#nickName").val();
            jQuery.ajax({
                type: "POST",
                url: remote+"/User/User",
                contentType:'application/json;charset=UTF-8',
                data: JSON.stringify({"mobile":mobile,"nickName":nickName,"password":password,"validCode":valiCode}),
                dataType:"json",
                success:function (data, status, jqXHR) {
                    alert(data.returnValue);
                    $("#token").val(data.returnValue);
                },
                error: ""
            });
        }
    </script>
	 
	</body>
</html>