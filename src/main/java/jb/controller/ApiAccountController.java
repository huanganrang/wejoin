package jb.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import jb.interceptors.TokenManage;
import jb.pageModel.DiveAccount;
import jb.pageModel.Json;
import jb.pageModel.SessionInfo;
import jb.service.DiveAccountServiceI;
import jb.util.Constants;
import jb.util.MD5Util;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * 账户管理控制器
 * 
 * @author John
 * 
 */
@Controller
@RequestMapping("/api/apiAccountController")
public class ApiAccountController extends BaseController {
	@Autowired
	private DiveAccountServiceI accountService;
	
	@Autowired
	private TokenManage tokenManage;
	
	/**
	 * 用户登录
	 * @param account
	 * @param session
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/login")
	public Json login(DiveAccount account, HttpSession session, HttpServletRequest request) {
		Json j = new Json();
		account = accountService.login(account);
		if (account != null) {
			j.setSuccess(true);
			j.setMsg("登陆成功！");

			j.setObj(tokenManage.buildToken(account.getId(),account.getUserName()));
		} else {
			j.setMsg("用户名或密码错误！");
		}
		return j;
	}
	
	/**
	 * 用户登录
	 * @param account
	 * @param headImageFile
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/register")
	public Json register(DiveAccount account, @RequestParam MultipartFile iconFile, HttpServletRequest request) {
		Json j = new Json();
		try {
			uploadFile(request, account, iconFile);
			account = accountService.reg(account);			
			j.setSuccess(true);
			j.setMsg("注册成功");
			j.setObj(tokenManage.buildToken(account.getId(),account.getUserName()));
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}
	
	/**
	 * 修改密码
	 * @param lvAccount
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/updatePass")
	public Json updatePass(DiveAccount account, String oldPass, HttpServletRequest request) {
		Json j = new Json();
		try {
			SessionInfo s = getSessionInfo(request);
			account.setId(s.getId());
			DiveAccount a = accountService.get(s.getId());
			if(oldPass.equals(a.getPassword())) {
				j.setMsg("旧密码不正确！");
			} else {
				account.setPassword(MD5Util.md5(account.getPassword()));
				accountService.edit(account);
				j.setSuccess(true);
				j.setMsg("密码修改成功");
			}
		} catch (Exception e) {
			// e.printStackTrace();
			j.setMsg(e.getMessage());
		}
		return j;
	}
	
	private void uploadFile(HttpServletRequest request,DiveAccount account,MultipartFile imageFile){
		if(imageFile==null||imageFile.isEmpty())
			return;
		String realPath = request.getSession().getServletContext().getRealPath("/"+Constants.UPLOADFILE_HEADIMAGE+"/"+account.getUserName());  
		File file = new File(realPath);
		if(!file.exists())
			file.mkdir();
		String suffix = imageFile.getOriginalFilename().substring(imageFile.getOriginalFilename().lastIndexOf("."));
		String fileName = account.getUserName() + System.currentTimeMillis() + suffix;		
		 try {
			FileUtils.copyInputStreamToFile(imageFile.getInputStream(), new File(realPath, fileName));
			account.setIcon(Constants.UPLOADFILE_HEADIMAGE+"/"+account.getUserName()+"/"+fileName);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		
	}
	
	private SessionInfo getSessionInfo(HttpServletRequest request){
		SessionInfo s = tokenManage.getSessionInfo(request);
		return s;		
	}
	
}
