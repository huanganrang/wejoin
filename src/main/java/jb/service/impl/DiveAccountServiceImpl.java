package jb.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import jb.absx.F;
import jb.dao.DiveAccountDaoI;
import jb.model.TdiveAccount;
import jb.pageModel.DiveAccount;
import jb.pageModel.DataGrid;
import jb.pageModel.PageHelper;
import jb.service.DiveAccountServiceI;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import jb.util.MyBeanUtils;

@Service
public class DiveAccountServiceImpl extends BaseServiceImpl<DiveAccount> implements DiveAccountServiceI {

	@Autowired
	private DiveAccountDaoI diveAccountDao;

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
				whereHql += " and t.nickname = :nickname";
				params.put("nickname", diveAccount.getNickname());
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
		BeanUtils.copyProperties(t, o);
		return o;
	}

	@Override
	public void edit(DiveAccount diveAccount) {
		TdiveAccount t = diveAccountDao.get(TdiveAccount.class, diveAccount.getId());
		if (t != null) {
			MyBeanUtils.copyProperties(diveAccount, t, new String[] { "id" , "createdatetime" },true);
			//t.setModifydatetime(new Date());
		}
	}

	@Override
	public void delete(String id) {
		diveAccountDao.delete(diveAccountDao.get(TdiveAccount.class, id));
	}

}
