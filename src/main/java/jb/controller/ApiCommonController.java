package jb.controller;

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
	
	@ResponseBody
	@RequestMapping("/doGet")
	public Json doGet(String type, String param) {
		Json j = new Json();
		try{
			//j.setObj(HttpUtil.doGet(""));
			j.success();
		}catch(Exception e){
			j.fail();
			e.printStackTrace();
		}		
		return j;
	}
}
