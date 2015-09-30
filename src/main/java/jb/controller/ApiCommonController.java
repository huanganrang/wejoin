package jb.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import jb.pageModel.Json;
import jb.util.HttpUtil;
import jb.util.PathUtil;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 公共模块接口
 * 
 * @author John
 * 
 */
@Controller
@RequestMapping("/api/apiCommon")
public class ApiCommonController extends BaseController {
	
	@ResponseBody
	@RequestMapping("/doPost")
	public Json doPost(String type, String param) {
		Json j = new Json();
		try{
			j.setObj(HttpUtil.doPost(PathUtil.getApiUrl(type), param));
			j.success();
		}catch(Exception e){
			j.fail();
			e.printStackTrace();
		}		
		return j;
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
			j.setObj(HttpUtil.doGet(PathUtil.getApiUrl(type) + paramStr));
			j.success();
		}catch(Exception e){
			j.fail();
			e.printStackTrace();
		}		
		return j;
	}
}
