package jb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jb.interceptors.TokenManage;
import jb.pageModel.DiveShopCart;
import jb.pageModel.Json;
import jb.pageModel.SessionInfo;
import jb.service.DiveShopCartServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 订单/购物车模块接口
 * 
 * @author John
 * 
 */
@Controller
@RequestMapping("/api/apiOrderController")
public class ApiOrderController extends BaseController {
	
	
	@Autowired
	private TokenManage tokenManage;
		
	@Autowired
	private DiveShopCartServiceI diveShopCartService;
	
	/**
	 * 购物车列表
	 * @param ph
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/shopCartList")
	public Json shopCartList(HttpServletRequest request) {
		Json j = new Json();
		try{
			SessionInfo s = getSessionInfo(request);
			List<DiveShopCart> shopCartList = diveShopCartService.findListByAccountId(s.getId());
			j.setObj(shopCartList);
			j.success();
		}catch(Exception e){
			j.fail();
			e.printStackTrace();
		}		
		return j;
	}	
	
	/**
	 * 加入购物车
	 * @param ph
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/addShopCart")
	public Json addShopCart(DiveShopCart diveShopCart, HttpServletRequest request) {
		Json j = new Json();
		try{
			SessionInfo s = getSessionInfo(request);
			diveShopCart.setAccountId(s.getId());
			diveShopCart.setNumber(1);
			diveShopCartService.add(diveShopCart);
			j.setMsg("加入购物车成功");
			j.success();
		}catch(Exception e){
			j.fail();
			e.printStackTrace();
		}		
		return j;
	}	
	
	/**
	 * 修改数量
	 * @param ph
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/editNumber")
	public Json editNumber(DiveShopCart diveShopCart) {
		Json j = new Json();
		try{
			diveShopCartService.edit(diveShopCart);
			j.setMsg("数量变更成功");
			j.success();
		}catch(Exception e){
			j.setMsg("数量变更失败");
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
