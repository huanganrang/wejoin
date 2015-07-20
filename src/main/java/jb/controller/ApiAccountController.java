package jb.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import jb.interceptors.TokenManage;
import jb.pageModel.DiveAccount;
import jb.pageModel.DiveCertificateAuthority;
import jb.pageModel.Json;
import jb.pageModel.SessionInfo;
import jb.service.DiveAccountServiceI;
import jb.service.DiveCertificateAuthorityServiceI;
import jb.service.DiveCollectServiceI;
import jb.util.Constants;
import jb.util.DateUtil;
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
	
	@Autowired
	private DiveCertificateAuthorityServiceI certificateAuthorityService;
	
	@Autowired
	private DiveCollectServiceI collectService;
	
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
			j.setObj(tokenManage.buildToken(account.getId(),account.getUserName()));
			j.setSuccess(true);
			j.setMsg("登陆成功！");
		} else {
			j.setMsg("用户名或密码错误！");
		}
		return j;
	}
	
	/**
	 * 退出登录
	 * @param account
	 * @param session
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/logout")
	public Json logout(HttpServletRequest request) {
		Json j = new Json();
		String tokenId = request.getParameter(TokenManage.TOKEN_FIELD);	
		tokenManage.removeToken(tokenId);
		j.setSuccess(true);
		j.setMsg("退出登录成功！");
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
			account.setIcon(uploadFile(request, account.getUserName(), iconFile));
			account = accountService.reg(account);		
			j.setObj(tokenManage.buildToken(account.getId(),account.getUserName()));
			j.setSuccess(true);
			j.setMsg("注册成功");
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
	
	/**
	 * 个人主页
	 * @param lvAccount
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/personHome")
	public Json personHome(HttpServletRequest request) {
		Json j = new Json();
		try {
			SessionInfo s = getSessionInfo(request);
			DiveAccount account = accountService.personHome(s.getId());
			j.setSuccess(true);
			j.setObj(account);
			j.setMsg("个人主页查询成功");
		} catch (Exception e) {
			// e.printStackTrace();
			j.setMsg(e.getMessage());
		}
		return j;
	}
	
	/**
	 * 个人信息
	 * @param lvAccount
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/personInfo")
	public Json personInfo(HttpServletRequest request) {
		Json j = new Json();
		try {
			SessionInfo s = getSessionInfo(request);
			j.setObj(accountService.get(s.getId()));
			j.setSuccess(true);
			j.setMsg("个人信息查询成功");
		} catch (Exception e) {
			// e.printStackTrace();
			j.setMsg(e.getMessage());
		}
		return j;
	}
	
	/**
	 * 个人信息修改
	 * @param lvAccount
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/updateAccount")
	public Json updatePersonInfo(DiveAccount account, HttpServletRequest request) {
		Json j = new Json();
		try {
			SessionInfo s = getSessionInfo(request);
			account.setId(s.getId());
			accountService.edit(account);			
			j.setSuccess(true);
			j.setMsg("个人信息修改成功");
		} catch (Exception e) {
			// e.printStackTrace();
			j.setMsg(e.getMessage());
		}
		return j;
	}
	
	/**
	 * 头像上传
	 * @param lvAccount
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/headImgUpload")
	public Json headImgUpload(DiveAccount account, @RequestParam MultipartFile iconFile, HttpServletRequest request) {
		Json j = new Json();
		try {
			SessionInfo s = getSessionInfo(request);
			String icon = uploadFile(request, s.getName(), iconFile);
			account.setIcon(icon);
			account.setId(s.getId());
			accountService.edit(account);
			j.setSuccess(true);
			j.setMsg("头像上传成功");
			j.setObj(account.getIcon());
		} catch (Exception e) {
			// e.printStackTrace();
			j.setMsg(e.getMessage());
		}
		return j;
	}
	
	/**
	 * 潜水认证信息查询
	 * @param lvAccount
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/certificateInfo")
	public Json certificateInfo(HttpServletRequest request) {
		Json j = new Json();
		try {
			SessionInfo s = getSessionInfo(request);
			j.setObj(certificateAuthorityService.getInfoByAccountId(s.getId()));
			j.setSuccess(true);
			j.setMsg("潜水认证信息查询成功");
		} catch (Exception e) {
			// e.printStackTrace();
			j.setMsg(e.getMessage());
		}
		return j;
	}
	
	/**
	 * 潜水认证信息新增/修改
	 * @param lvAccount
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/updateCertificateInfo")
	public Json updateCertificateInfo(DiveCertificateAuthority ca, String authDateStr, 
			@RequestParam MultipartFile rightSideFile, @RequestParam MultipartFile reverseSideFile, 
			HttpServletRequest request) {
		Json j = new Json();
		try {
			SessionInfo s = getSessionInfo(request);
			ca.setRightSide(uploadFile(request, s.getName(), rightSideFile));
			ca.setReverseSide(uploadFile(request, s.getName(), reverseSideFile));
			ca.setAuthDate(DateUtil.parse(authDateStr, Constants.DATE_FORMAT_YMD));
			ca.setAccountId(s.getId());
			ca.setStatus("AS02"); // 审核中
			int r = certificateAuthorityService.saveOrUpdate(ca);
			if(r == -1) {
				j.setMsg("潜水认证信息修改失败");
			} else {
				j.setObj(ca);
				j.setSuccess(true);
				j.setMsg("潜水认证信息修改成功");
			}
		} catch (Exception e) {
			// e.printStackTrace();
			j.setMsg(e.getMessage());
		}
		return j;
	}
	
	/**
	 * 收藏主页
	 * @param lvAccount
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/collectHome")
	public Json collectHome(HttpServletRequest request) {
		Json j = new Json();
		try {
			SessionInfo s = getSessionInfo(request);
			j.setObj(collectService.countCollectNum(s.getId()));
			j.setSuccess(true);
			j.setMsg("收藏数量查询成功");
		} catch (Exception e) {
			// e.printStackTrace();
			j.setMsg(e.getMessage());
		}
		return j;
	}
	
	private String uploadFile(HttpServletRequest request,String username,MultipartFile imageFile){
		if(imageFile==null||imageFile.isEmpty())
			return null;
		String realPath = request.getSession().getServletContext().getRealPath("/"+Constants.UPLOADFILE_HEADIMAGE+"/"+username);  
		File file = new File(realPath);
		if(!file.exists())
			file.mkdir();
		String suffix = imageFile.getOriginalFilename().substring(imageFile.getOriginalFilename().lastIndexOf("."));
		String fileName = username + System.currentTimeMillis() + suffix;		
		 try {
			FileUtils.copyInputStreamToFile(imageFile.getInputStream(), new File(realPath, fileName));
			return Constants.UPLOADFILE_HEADIMAGE+"/"+username+"/"+fileName;
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		
	}
	
	private SessionInfo getSessionInfo(HttpServletRequest request){
		SessionInfo s = tokenManage.getSessionInfo(request);
		return s;		
	}
	
}