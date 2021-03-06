package jb.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import jb.absx.F;
import jb.pageModel.Json;
import jb.pageModel.UserToken;
import jb.util.HttpPostUploadUtil;
import jb.util.HttpUtil;
import jb.util.PathUtil;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * 公共模块接口
 * 
 * @author John
 * 
 */
@Controller
@RequestMapping("/api/apiCommon")
public class ApiCommonController extends BaseController {

	public static final String UL040 = "UL040";
	public static final String UL001 = "UL001";
	public static final String USER_TOKEN = "userToken";

	@ResponseBody
	@RequestMapping("/doPost")
	public Json doPost(String type, String param, @RequestParam(required=false) MultipartFile uploadFile) {
		Json j = new Json();
		try{
			if(uploadFile != null) {
				Map<String, String> textMap = new HashMap<String, String>();
				textMap.put("type", "4");
				Map<String, MultipartFile> fileMap = new HashMap<String, MultipartFile>();
				fileMap.put("file", uploadFile);
				String fileToken = HttpPostUploadUtil.formUpload(PathUtil.getUploadUrl(), textMap, fileMap);
				if(!F.empty(fileToken)) {
					JSONObject fileTokenJO = JSON.parseObject(fileToken);
					JSONObject jsonObject = JSON.parseObject(param);
					jsonObject.put("channelIcon", fileTokenJO.get("returnValue"));
					param = JSON.toJSONString(jsonObject);
				} else {
					j.fail();
					j.setMsg("图片上传失败");
					return j;
				}
			}
			j.setObj(HttpUtil.doPost(PathUtil.getApiUrl(type), param));
			j.success();
		}catch(Exception e){
			j.fail();
			e.printStackTrace();
		}		
		return j;
	}


	@RequestMapping("/GET")
	public String post(String apiType,String pageUrl, HttpServletRequest request) {

		Map<String, String[]> paramMap = request.getParameterMap();
		String paramStr = "";
		for(String key : paramMap.keySet()) {
			if("apiType".equals(key)||"pageUrl".equals(key)) continue;
			paramStr += "".equals(paramStr) ? "?" : "&";
			paramStr += key + "=" + paramMap.get(key)[0];
		}
		String result = HttpUtil.doGet(PathUtil.getApiUrl(apiType) + paramStr);
		// 登录
		if(UL001.equals(apiType)|| UL040.equals(apiType)) {
			JSONObject jsonObject = JSON.parseObject(result);
			if(jsonObject != null && jsonObject.getInteger("serverStatus") == 0) {
				UserToken userToken = jsonObject.getObject("returnObject", UserToken.class);
				if(UL001.equals(apiType)) userToken.setLoginMark(true);
				request.getSession().setAttribute(USER_TOKEN, userToken);
			}
		}
		return pageUrl;
	}

	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping("/doGet")
	public Json doGet(String type, HttpServletRequest request) {
		Json j = new Json();
		try{
			Map<String, String[]> paramMap = request.getParameterMap();
			String paramStr = "";
			for(String key : paramMap.keySet()) {
				if("type".equals(key)) continue;
				paramStr += "".equals(paramStr) ? "?" : "&";
				paramStr += key + "=" + paramMap.get(key)[0];
			}
			String result = HttpUtil.doGet(PathUtil.getApiUrl(type) + paramStr);
			// 登录
			if(UL001.equals(type)|| UL040.equals(type)) {
				JSONObject jsonObject = JSON.parseObject(result);
				if(jsonObject != null && jsonObject.getInteger("serverStatus") == 0) {
					UserToken userToken = jsonObject.getObject("returnObject", UserToken.class);
					if(UL001.equals(type)) userToken.setLoginMark(true); 
					request.getSession().setAttribute(USER_TOKEN, userToken);
				}
			}
			j.setObj(result);
			j.success();
		}catch(Exception e){
			j.fail();
			e.printStackTrace();
		}		
		return j;
	}
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping("/doDelete")
	public Json doDelete(String type, HttpServletRequest request) {
		Json j = new Json();
		try{
			Map<String, String[]> paramMap = request.getParameterMap();
			String paramStr = "";
			for(String key : paramMap.keySet()) {
				if("type".equals(key)) continue;
				paramStr += "".equals(paramStr) ? "?" : "&";
				paramStr += key + "=" + paramMap.get(key)[0];
			}
			String result = HttpUtil.doDelete(PathUtil.getApiUrl(type) + paramStr);
			j.setObj(result);
			j.success();
		}catch(Exception e){
			j.fail();
			e.printStackTrace();
		}		
		return j;
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request){
		request.getSession().removeAttribute(USER_TOKEN);
		return "/index";
	}
}
