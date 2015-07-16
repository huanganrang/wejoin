package jb.controller;

import javax.servlet.http.HttpServletRequest;

import jb.interceptors.TokenManage;
import jb.pageModel.DataGrid;
import jb.pageModel.DiveActivity;
import jb.pageModel.DiveActivityComment;
import jb.pageModel.Json;
import jb.pageModel.PageHelper;
import jb.pageModel.SessionInfo;
import jb.service.DiveActivityCommentServiceI;
import jb.service.DiveActivityServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 活动模块接口
 * 
 * @author John
 * 
 */
@Controller
@RequestMapping("/api/apiActivityController")
public class ApiActivityController extends BaseController {
	
	
	@Autowired
	private TokenManage tokenManage;
		
	@Autowired
	private DiveActivityServiceI diveActivityService;
	
	@Autowired
	private DiveActivityCommentServiceI diveActivityCommentService;
	
	
	/**
	 * 活动列表
	 * @param ph
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/activityList")
	public DataGrid activityList(PageHelper ph) {
		
		DiveActivity diveActivity = new DiveActivity();
		DataGrid dg = diveActivityService.dataGriComplex(diveActivity,ph);
		return dg;
	}	
	
	
	/**
	 * 获取详情接口
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getActivityDetail")
	public Json getActivityDetail(String id) {
		Json j = new Json();
		try{
			//TODO,详情接口需要完善
			j.setObj(diveActivityService.get(id));
			j.success();
		}catch(Exception e){
			j.fail();
			e.printStackTrace();
		}		
		return j;
	}	
	
	/**
	 * 添加评论
	 * @param ph
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/addComment")
	public Json addComment(HttpServletRequest request,DiveActivityComment diveActivityComment) {	
		Json j = new Json();
		try{
			SessionInfo s = getSessionInfo(request);
			diveActivityComment.setUserId(s.getId());
			diveActivityCommentService.add(diveActivityComment);
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
