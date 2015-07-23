package jb.controller;

import jb.pageModel.DiveArea;
import jb.pageModel.Json;
import jb.pageModel.PageHelper;
import jb.service.BasedataServiceI;
import jb.service.DiveAreaServiceI;
import jb.service.DiveCountryServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 基础数据
 * 
 * @author John
 * 
 */
@Controller
@RequestMapping("/api/apiBaseDataController")
public class ApiBaseDataController extends BaseController {
	
	@Autowired
	private BasedataServiceI basedataService;
	
	@Autowired
	private DiveCountryServiceI diveCountryService;
	
	@Autowired
	private DiveAreaServiceI diveAreaService;
	
	/**
	 * 获取基础数据
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/basedata")
	@ResponseBody
	public Json dataGridNewFriend(PageHelper ph,String dataType) {
		Json j = new Json();
		try{
			j.setObj(basedataService.getBaseDatas(dataType));
			j.success();
		}catch(Exception e){
			j.fail();
			e.printStackTrace();
		}		
		return j;
	}	
	
	/**
	 * 获取国家地区列表
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/country")
	@ResponseBody
	public Json country(String adCode) {
		Json j = new Json();
		try{
			j.setObj(diveCountryService.findAllByAdCode(adCode));
			j.success();
		}catch(Exception e){
			j.fail();
			e.printStackTrace();
		}		
		return j;
	}	
	
	/**
	 * 获取省市区列表
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/area")
	@ResponseBody
	public Json area(DiveArea diveArea) {
		Json j = new Json();
		try{
			j.setObj(diveAreaService.findAllByParams(diveArea));
			j.success();
		}catch(Exception e){
			j.fail();
			e.printStackTrace();
		}		
		return j;
	}	
}
