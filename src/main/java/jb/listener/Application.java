package jb.listener;

import com.alibaba.fastjson.JSON;
import jb.pageModel.BaseData;
import jb.service.BasedataServiceI;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 系统全局容器
 * @author John
 *
 */
public class Application implements ServletContextListener {
	private static ServletContext context;
	private static String PREFIX = "SV.";
	public static String version = "123456789";
	public static String apiJson = "";
	@Override
	public void contextInitialized(ServletContextEvent event) {	
		 context = event.getServletContext();	
		 initAppVariable();
		 version = new Date().getTime()+"";
	}

	private static void initAppVariable(){
		ApplicationContext app = WebApplicationContextUtils.getWebApplicationContext(context); 
		BasedataServiceI service = app.getBean(BasedataServiceI.class);
		Map<String,BaseData> map = service.getAppVariable();
		Map<String,BaseData> apiMap = new HashMap<String, BaseData>();
		for(String key : map.keySet()){
			BaseData baseData = map.get(key);
			context.setAttribute(PREFIX+key, baseData);
			if("UL".equals(baseData.getBasetypeCode())){
				apiMap.put(key,baseData);
			}
		}
		apiJson = JSON.toJSONString(apiMap);
	}
	
	/**
	 * 刷新全局变量值
	 */
	public static void refresh(){
		initAppVariable();
	}
	
	/**
	 * 获取全局变量值
	 * @param key
	 * @return
	 */
	public static String getString(String key){
		BaseData bd = (BaseData)context.getAttribute(PREFIX+key);
		String val = null;
		if(bd != null){
			val = bd.getName();
		}
		return val;
	}
	
	/**
	 * 获取全局变量值
	 * @param key
	 * @return
	 */
	public static BaseData get(String key){
		BaseData bd = (BaseData)context.getAttribute(PREFIX+key);		
		return bd;
	}
	public static BasedataServiceI getBasedataService(){
		ApplicationContext app = WebApplicationContextUtils.getWebApplicationContext(context); 
		BasedataServiceI service = app.getBean(BasedataServiceI.class);
		return service;
	}
	@Override
	public void contextDestroyed(ServletContextEvent event) {
		

	}

}
