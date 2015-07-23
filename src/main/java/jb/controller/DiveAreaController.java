package jb.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jb.pageModel.Colum;
import jb.pageModel.DataGrid;
import jb.pageModel.DiveArea;
import jb.pageModel.Json;
import jb.pageModel.PageHelper;
import jb.service.DiveAreaServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

/**
 * DiveArea管理控制器
 * 
 * @author John
 * 
 */
@Controller
@RequestMapping("/diveAreaController")
public class DiveAreaController extends BaseController {

	@Autowired
	private DiveAreaServiceI diveAreaService;


	/**
	 * 跳转到DiveArea管理页面
	 * 
	 * @return
	 */
	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/divearea/diveArea";
	}

	/**
	 * 获取DiveArea数据表格
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/dataGrid")
	@ResponseBody
	public DataGrid dataGrid(DiveArea diveArea, PageHelper ph) {
		return diveAreaService.dataGrid(diveArea, ph);
	}
	/**
	 * 获取DiveArea数据表格excel
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
	public void download(DiveArea diveArea, PageHelper ph,String downloadFields,HttpServletResponse response) throws SecurityException, NoSuchMethodException, IllegalArgumentException, IllegalAccessException, InvocationTargetException, IOException{
		DataGrid dg = dataGrid(diveArea,ph);		
		downloadFields = downloadFields.replace("&quot;", "\"");
		downloadFields = downloadFields.substring(1,downloadFields.length()-1);
		List<Colum> colums = JSON.parseArray(downloadFields, Colum.class);
		downloadTable(colums, dg, response);
	}
	/**
	 * 跳转到添加DiveArea页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/divearea/diveAreaAdd";
	}

	/**
	 * 添加DiveArea
	 * 
	 * @return
	 */
	@RequestMapping("/add")
	@ResponseBody
	public Json add(DiveArea diveArea) {
		Json j = new Json();		
		diveAreaService.add(diveArea);
		j.setSuccess(true);
		j.setMsg("添加成功！");		
		return j;
	}

	/**
	 * 跳转到DiveArea查看页面
	 * 
	 * @return
	 */
	@RequestMapping("/view")
	public String view(HttpServletRequest request, Integer id) {
		DiveArea diveArea = diveAreaService.get(id);
		request.setAttribute("diveArea", diveArea);
		return "/divearea/diveAreaView";
	}

	/**
	 * 跳转到DiveArea修改页面
	 * 
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Integer id) {
		DiveArea diveArea = diveAreaService.get(id);
		request.setAttribute("diveArea", diveArea);
		return "/divearea/diveAreaEdit";
	}

	/**
	 * 修改DiveArea
	 * 
	 * @param diveArea
	 * @return
	 */
	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(DiveArea diveArea) {
		Json j = new Json();		
		diveAreaService.edit(diveArea);
		j.setSuccess(true);
		j.setMsg("编辑成功！");		
		return j;
	}

	/**
	 * 删除DiveArea
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(Integer id) {
		Json j = new Json();
		diveAreaService.delete(id);
		j.setMsg("删除成功！");
		j.setSuccess(true);
		return j;
	}

}
