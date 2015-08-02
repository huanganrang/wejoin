package jb.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import jb.absx.F;
import jb.dao.DiveAccountDaoI;
import jb.dao.DiveLogDaoI;
import jb.model.TdiveAccount;
import jb.pageModel.DataGrid;
import jb.pageModel.DiveAccount;
import jb.pageModel.PageHelper;
import jb.service.DiveAccountServiceI;
import jb.util.MD5Util;
import jb.util.MyBeanUtils;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiveAccountServiceImpl extends BaseServiceImpl<DiveAccount> implements DiveAccountServiceI {

	@Autowired
	private DiveAccountDaoI diveAccountDao;
	
	@Autowired
	private DiveLogDaoI diveLogDao;

	@Override
	public DataGrid dataGrid(DiveAccount diveAccount, PageHelper ph) {
		List<DiveAccount> ol = new ArrayList<DiveAccount>();
		String hql = " from TdiveAccount t ";
		DataGrid dg = dataGridQuery(hql, ph, diveAccount, diveAccountDao);
		@SuppressWarnings("unchecked")
		List<TdiveAccount> l = dg.getRows();
		if (l != null && l.size() > 0) {
			for (TdiveAccount t : l) {
				DiveAccount o = new DiveAccount();
				BeanUtils.copyProperties(t, o);
				ol.add(o);
			}
		}
		dg.setRows(ol);
		return dg;
	}
	

	protected String whereHql(DiveAccount diveAccount, Map<String, Object> params) {
		String whereHql = "";	
		if (diveAccount != null) {
			whereHql += " where 1=1 ";
			if (!F.empty(diveAccount.getUserName())) {
				whereHql += " and t.userName = :userName";
				params.put("userName", diveAccount.getUserName());
			}		
			if (!F.empty(diveAccount.getPassword())) {
				whereHql += " and t.password = :password";
				params.put("password", diveAccount.getPassword());
			}		
			if (!F.empty(diveAccount.getIcon())) {
				whereHql += " and t.icon = :icon";
				params.put("icon", diveAccount.getIcon());
			}		
			if (!F.empty(diveAccount.getNickname())) {
				whereHql += " and t.nickname like :nickname";
				params.put("nickname", "%%" + diveAccount.getNickname() + "%%");
			}		
			if (!F.empty(diveAccount.getSex())) {
				whereHql += " and t.sex = :sex";
				params.put("sex", diveAccount.getSex());
			}		
			if (!F.empty(diveAccount.getCity())) {
				whereHql += " and t.city = :city";
				params.put("city", diveAccount.getCity());
			}		
			if (!F.empty(diveAccount.getPersonality())) {
				whereHql += " and t.personality = :personality";
				params.put("personality", diveAccount.getPersonality());
			}		
			if (!F.empty(diveAccount.getEmail())) {
				whereHql += " and t.email = :email";
				params.put("email", diveAccount.getEmail());
			}		
			if (!F.empty(diveAccount.getHxStatus())) {
				whereHql += " and t.hxStatus = :hxStatus";
				params.put("hxStatus", diveAccount.getHxStatus());
			}		
				
		}	
		return whereHql;
	}

	@Override
	public void add(DiveAccount diveAccount) {
		TdiveAccount t = new TdiveAccount();
		BeanUtils.copyProperties(diveAccount, t);
		t.setId(UUID.randomUUID().toString());
		//t.setCreatedatetime(new Date());
		diveAccountDao.save(t);
	}

	@Override
	public DiveAccount get(String id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		TdiveAccount t = diveAccountDao.get("from TdiveAccount t  where t.id = :id", params);
		DiveAccount o = new DiveAccount();
		if(t != null) {
			BeanUtils.copyProperties(t, o);
		}
		return o;
	}
	
	@Override
	public DiveAccount get(DiveAccount account) {
		DiveAccount r = new DiveAccount();
		Map<String, Object> params = new HashMap<String, Object>();
		String where = whereHql(account, params);
		TdiveAccount t = diveAccountDao.get("from TdiveAccount t " + where, params);
		if(t != null) {
			BeanUtils.copyProperties(t, r);
			return r;
		}
		return null;
	}

	@Override
	public void edit(DiveAccount diveAccount) {
		TdiveAccount t = diveAccountDao.get(TdiveAccount.class, diveAccount.getId());
		if (t != null) {
			MyBeanUtils.copyProperties(diveAccount, t, new String[] { "id" , "addtime" },true);
			//t.setModifydatetime(new Date());
		}
	}

	@Override
	public void delete(String id) {
		diveAccountDao.delete(diveAccountDao.get(TdiveAccount.class, id));
	}

	/**
	 * 注册
	 * @throws Exception 
	 */
	public DiveAccount reg(DiveAccount account) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userName", account.getUserName());
		if(diveAccountDao.count("select count(*) from TdiveAccount t where t.userName = :userName", params) > 0) {
			throw new Exception("用户名已存在！");
		}
		params = new HashMap<String, Object>();
		params.put("email", account.getEmail());
		if(!F.empty(account.getEmail())
				&& diveAccountDao.count("select count(*) from TdiveAccount t where t.email = :email", params) > 0) {
			throw new Exception("邮箱已被使用！");
		}
		params = new HashMap<String, Object>();
		params.put("recommend", account.getRecommend());
		if(!F.empty(account.getRecommend())) {
			TdiveAccount ta = diveAccountDao.get("from TdiveAccount t where t.userName = :recommend", params);
			if(ta != null) {
				account.setRecommend(ta.getId());
			} else {
				account.setRecommend(null);
			}
		}
		
		TdiveAccount t = new TdiveAccount();
		account.setId(jb.absx.UUID.uuid().toLowerCase());
		account.setAddtime(new Date());
		account.setHxPassword(account.getPassword());
		account.setPassword(MD5Util.md5(account.getPassword()));
		account.setHxStatus("2");
		MyBeanUtils.copyProperties(account, t, true);
		diveAccountDao.save(t);
		
		return account;
		
	}

	/**
	 * 登录
	 */
	public DiveAccount login(DiveAccount account) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userName", account.getUserName());
		params.put("password", MD5Util.md5(account.getPassword()));
		TdiveAccount a = diveAccountDao.get("from TdiveAccount t where t.userName = :userName and t.password = :password", params);
		if (a != null) {
			BeanUtils.copyProperties(a, account);
			return account;
		}
		return null;
	}

	/**
	 * 个人主页
	 */
	public DiveAccount personHome(String id) {
		DiveAccount a = get(id);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("accountId", id);
		Long logNum = diveLogDao.count("select count(*) from TdiveLog t where t.accountId = :accountId", params);
		a.setLogNum(logNum == null ? 0 : logNum.intValue());
		return a;
	}

	/**
	 * 检查邮箱是否存在
	 */
	public boolean emailExists(DiveAccount account) {
		if(F.empty(account.getEmail())) return false;
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("email", account.getEmail());
		TdiveAccount t = diveAccountDao.get("from TdiveAccount t where t.email = :email", params);
		if(t != null && t.getId() != account.getId()) {
			return true;
		}
		return false;
	}
	
}
