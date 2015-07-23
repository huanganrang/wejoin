package jb.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jb.pageModel.Colum;
import jb.pageModel.DataGrid;
import jb.pageModel.DiveCountry;
import jb.pageModel.Json;
import jb.pageModel.PageHelper;
import jb.service.DiveCountryServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

/**
 * DiveCountry管理控制器
 * 
 * @author John
 * 
 */
@Controller
@RequestMapping("/diveCountryController")
public class DiveCountryController extends BaseController {

	@Autowired
	private DiveCountryServiceI diveCountryService;


	/**
	 * 跳转到DiveCountry管理页面
	 * 
	 * @return
	 */
	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/divecountry/diveCountry";
	}

	/**
	 * 获取DiveCountry数据表格
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/dataGrid")
	@ResponseBody
	public DataGrid dataGrid(DiveCountry diveCountry, PageHelper ph) {
		return diveCountryService.dataGrid(diveCountry, ph);
	}
	/**
	 * 获取DiveCountry数据表格excel
	 * 
	 * @param user
	 * @return
	 * @throws NoSuchMethodException 
	 * @throws SecurityException 
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 * @throws IllegalArgumentException 
	 * @throws IOException 
	 */
	@RequestMapping("/download")
	public void download(DiveCountry diveCountry, PageHelper ph,String downloadFields,HttpServletResponse response) throws SecurityException, NoSuchMethodException, IllegalArgumentException, IllegalAccessException, InvocationTargetException, IOException{
		DataGrid dg = dataGrid(diveCountry,ph);		
		downloadFields = downloadFields.replace("&quot;", "\"");
		downloadFields = downloadFields.substring(1,downloadFields.length()-1);
		List<Colum> colums = JSON.parseArray(downloadFields, Colum.class);
		downloadTable(colums, dg, response);
	}
	/**
	 * 跳转到添加DiveCountry页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/divecountry/diveCountryAdd";
	}

	/**
	 * 添加DiveCountry
	 * 
	 * @return
	 */
	@RequestMapping("/add")
	@ResponseBody
	public Json add(DiveCountry diveCountry) {
		Json j = new Json();		
		diveCountryService.add(diveCountry);
		j.setSuccess(true);
		j.setMsg("添加成功！");		
		return j;
	}

	/**
	 * 跳转到DiveCountry查看页面
	 * 
	 * @return
	 */
	@RequestMapping("/view")
	public String view(HttpServletRequest request, Integer id) {
		DiveCountry diveCountry = diveCountryService.get(id);
		request.setAttribute("diveCountry", diveCountry);
		return "/divecountry/diveCountryView";
	}

	/**
	 * 跳转到DiveCountry修改页面
	 * 
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Integer id) {
		DiveCountry diveCountry = diveCountryService.get(id);
		request.setAttribute("diveCountry", diveCountry);
		return "/divecountry/diveCountryEdit";
	}

	/**
	 * 修改DiveCountry
	 * 
	 * @param diveCountry
	 * @return
	 */
	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(DiveCountry diveCountry) {
		Json j = new Json();		
		diveCountryService.edit(diveCountry);
		j.setSuccess(true);
		j.setMsg("编辑成功！");		
		return j;
	}

	/**
	 * 删除DiveCountry
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(Integer id) {
		Json j = new Json();
		diveCountryService.delete(id);
		j.setMsg("删除成功！");
		j.setSuccess(true);
		return j;
	}

	/**
	 * 根据洲编码获取国家列表
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/getListByAdCode")
	@ResponseBody
	public Json getListByAdCode(String adCode) {
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

	
}
