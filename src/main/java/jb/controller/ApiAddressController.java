package jb.controller;

import jb.interceptors.TokenManage;
import jb.pageModel.DataGrid;
import jb.pageModel.DiveAddress;
import jb.pageModel.Json;
import jb.pageModel.PageHelper;
import jb.service.DiveAddressServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 潜点模块接口
 * 
 * @author John
 * 
 */
@Controller
@RequestMapping("/api/apiAddressController")
public class ApiAddressController extends BaseController {
	
	
	@Autowired
	private TokenManage tokenManage;
		
	@Autowired
	private DiveAddressServiceI diveAddressService;
	
	
	
	/**
	 * 地区查询
	 * @param ph
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/arealist")
	public DataGrid brandList(PageHelper ph,DiveAddress diveAddress) {
		DataGrid dg = diveAddressService.dataGrid(diveAddress,ph);
		return dg;
	}	
	
	/**
	 * 特点查询
	 * @param ph
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/featurelist")
	public DataGrid typelist(PageHelper ph,DiveAddress diveAddress) {		
		DataGrid dg = diveAddressService.dataGrid(diveAddress,ph);
		return dg;
	}	
	
	/**
	 * 获取详情接口
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getAddressDetail")
	public Json getAddressDetail(String id) {
		Json j = new Json();
		try{
			j.setObj(diveAddressService.get(id));
			j.success();
		}catch(Exception e){
			j.fail();
			e.printStackTrace();
		}		
		return j;
	}	
	
}
