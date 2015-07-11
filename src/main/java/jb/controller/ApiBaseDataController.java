package jb.controller;

import javax.servlet.http.HttpServletRequest;

import jb.interceptors.TokenManage;
import jb.pageModel.BaseData;
import jb.pageModel.DataGrid;
import jb.pageModel.PageHelper;
import jb.pageModel.SessionInfo;
import jb.service.BasedataServiceI;
import jb.service.UserServiceI;

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
	
	/**
	 * 获取基础数据
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/basedata")
	@ResponseBody
	public DataGrid dataGridNewFriend(PageHelper ph,String dataType) {
		BaseData baseData = new BaseData();
		baseData.setBasetypeCode(dataType);
		ph.setOrder("asc");
		ph.setSort("seq");
		DataGrid dg = basedataService.dataGrid(baseData, ph);
		return dg;
	}		
}
