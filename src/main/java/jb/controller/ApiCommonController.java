package jb.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import jb.interceptors.TokenManage;
import jb.service.DiveAddressServiceI;
import jb.service.DiveCourseServiceI;
import jb.service.DiveEquipServiceI;
import jb.service.DiveStoreServiceI;
import jb.service.DiveTravelServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 公共模块接口
 * 
 * @author John
 * 
 */
@Controller
@RequestMapping("/api/apiCommon")
public class ApiCommonController extends BaseController {
	
	
	@Autowired
	private TokenManage tokenManage;
		
	@Autowired
	private DiveTravelServiceI diveTravelService;
	@Autowired
	private DiveAddressServiceI diveAddressService;
	@Autowired
	private DiveEquipServiceI diveEquipService;
	@Autowired
	private DiveStoreServiceI diveStoreService;
	@Autowired
	private DiveCourseServiceI diveCourseService;
	
	/**
	 * 生成html
	 * @return
	 */
	@RequestMapping("/html")
	public void html(String type,String id,HttpServletResponse response) {
		PrintWriter out = null;
		String content = "";
		try{
			response.setContentType("text/html");  
			response.setCharacterEncoding("UTF-8");
			if("BT01".equals(type)) {
				content = diveTravelService.get(id).getDescription();
			} else if("BT02".equals(type)) {
				content = diveAddressService.get(id).getDescription();
			} else if("BT03".equals(type)) {
				content = diveEquipService.get(id).getEquipDes();
			} else if("BT05".equals(type)) {
				content = diveStoreService.get(id).getDescription();
			} else if("BT06".equals(type)) {
				content = diveCourseService.get(id).getIntroduce();
			}
			out = response.getWriter();
			out.write("<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />  </head><body>");
			out.write(content);
			out.write("</body></html>");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(out!=null){
				out.flush();
				out.close();
			}
		}	
	}	
	
}
