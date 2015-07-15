package jb.controller;

import jb.interceptors.TokenManage;
import jb.pageModel.DiveCollect;
import jb.pageModel.DivePraise;
import jb.pageModel.Json;
import jb.service.DiveCollectServiceI;
import jb.service.DivePraiseServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 收藏赞管理模块接口
 * 
 * @author John
 * 
 */
@Controller
@RequestMapping("/api/apiPointController")
public class ApiPointController extends BaseController {
	
	
	@Autowired
	private TokenManage tokenManage;
		
	@Autowired
	private DiveCollectServiceI diveCollectService;
	
	@Autowired
	private DivePraiseServiceI divePraiseService;
	
	
	
	/**
	 * 收藏接口
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/addCollect")
	public Json addCollect(String id,String businessType) {
		Json j = new Json();
		try{
			DiveCollect diveCollect = new DiveCollect();
			diveCollect.setBusinessId(id);
			diveCollect.setBusinessType(businessType);
			diveCollectService.add(diveCollect);
			j.success();
		}catch(Exception e){
			j.fail();
			e.printStackTrace();
		}		
		return j;
	}	
	
	/**
	 * 点赞接口
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/addPraise")
	public Json addPraise(String id,String businessType) {
		Json j = new Json();
		try{
			DivePraise divePraise = new DivePraise();
			divePraise.setBusinessId(id);
			divePraise.setBusinessType(businessType);
			divePraiseService.add(divePraise);
			j.success();
		}catch(Exception e){
			j.fail();
			e.printStackTrace();
		}		
		return j;
	}	
	
}
