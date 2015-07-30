package jb.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import jb.interceptors.TokenManage;
import jb.pageModel.DiveEquip;
import jb.service.DiveEquipServiceI;

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
	private DiveEquipServiceI diveEquipService;
	
	/**
	 * 生成html
	 * @return
	 */
	@RequestMapping("/html")
	public void html(String type,String id,HttpServletResponse response) {
		PrintWriter out = null;
		try{
			response.setContentType("text/html");  
//			response.setHeader("Content-type", "text/html;charset=UTF-8"); 
			response.setCharacterEncoding("UTF-8");
			DiveEquip diveEquip = diveEquipService.get(id);		
			out = response.getWriter();
			out.write("<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />  </head><body>");
			out.write(diveEquip.getEquipDes());
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
