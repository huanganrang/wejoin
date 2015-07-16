package jb.controller;

import javax.servlet.http.HttpServletRequest;

import jb.interceptors.TokenManage;
import jb.pageModel.DataGrid;
import jb.pageModel.DiveLog;
import jb.pageModel.Json;
import jb.pageModel.PageHelper;
import jb.pageModel.SessionInfo;
import jb.service.DiveLogServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 潜水日志模块接口
 * 
 * @author John
 * 
 */
@Controller
@RequestMapping("/api/apiLogController")
public class ApiLogController extends BaseController {
	
	
	@Autowired
	private TokenManage tokenManage;
		
	@Autowired
	private DiveLogServiceI diveLogService;
	
	
	
	/**
	 * 潜水日志
	 * @param ph
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/loglist")
	public Json loglist(PageHelper ph, DiveLog diveLog, HttpServletRequest request) {
		Json j = new Json();
		try{
			SessionInfo s = getSessionInfo(request);
			diveLog.setAccountId(s.getId());
			
			ph.setSort("addtime");
			ph.setOrder("desc");
			DataGrid dg = diveLogService.dataGrid(diveLog, ph);
			j.setObj(dg);
			j.success();
		}catch(Exception e){
			j.fail();
			e.printStackTrace();
		}		
		return j;
	}	
	
	/**
	 * 潜水日志详情
	 * @param ph
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/logDetail")
	public Json logDetail(String id) {
		Json j = new Json();
		try{
			j.setObj(diveLogService.get(id));
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
