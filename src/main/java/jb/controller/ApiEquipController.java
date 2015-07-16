package jb.controller;

import javax.servlet.http.HttpServletRequest;

import jb.interceptors.TokenManage;
import jb.pageModel.DataGrid;
import jb.pageModel.DiveEquip;
import jb.pageModel.Json;
import jb.pageModel.PageHelper;
import jb.pageModel.SessionInfo;
import jb.service.DiveEquipServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 装备管理模块接口
 * 
 * @author John
 * 
 */
@Controller
@RequestMapping("/api/apiEquipController")
public class ApiEquipController extends BaseController {
	
	
	@Autowired
	private TokenManage tokenManage;
		
	@Autowired
	private DiveEquipServiceI diveEquipService;
	
	
	/**
	 * 热门装备
	 * @param ph
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/hotlist")
	public DataGrid hotList(PageHelper ph) {
		// 暂时不知道怎么算热门
		/*ph.setOrder("desc");
		ph.setSort("bsPraise");*/
		DiveEquip diveEquip = new DiveEquip();
		DataGrid dg = diveEquipService.dataGrid(diveEquip,ph);
		return dg;
	}	
	
	/**
	 * 品牌查询
	 * @param ph
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/brandlist")
	public DataGrid brandList(PageHelper ph,DiveEquip diveEquip) {
		DataGrid dg = diveEquipService.dataGrid(diveEquip,ph);
		return dg;
	}	
	
	/**
	 * 类别查询
	 * @param ph
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/typelist")
	public DataGrid typelist(PageHelper ph,DiveEquip diveEquip) {		
		DataGrid dg = diveEquipService.dataGrid(diveEquip,ph);
		return dg;
	}	
	
	/**
	 * 获取详情接口
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getEquipDetail")
	public Json getEquipDetail(String id) {
		Json j = new Json();
		try{
			j.setObj(diveEquipService.get(id));
			j.success();
		}catch(Exception e){
			j.fail();
			e.printStackTrace();
		}		
		return j;
	}	
	
	/**
	 * 个人收藏查询
	 * @param ph
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/collectlist")
	public Json collectlist(PageHelper ph, HttpServletRequest request) {	
		Json j = new Json();
		try{
			SessionInfo s = getSessionInfo(request);
			DataGrid dg = diveEquipService.dataGridCollect(s.getId(), ph);
			j.setObj(dg);
			j.success();
		}catch(Exception e){
			j.fail();
			e.printStackTrace();
		}		
		return j;
	}	
	
	private SessionInfo getSessionInfo(HttpServletRequest request){
		SessionInfo s = tokenManage.getSessionInfo(request);
		return s;		
	}
}
