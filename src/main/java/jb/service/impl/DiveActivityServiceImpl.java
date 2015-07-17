package jb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import jb.absx.F;
import jb.dao.DiveActivityDaoI;
import jb.model.TdiveActivity;
import jb.pageModel.DataGrid;
import jb.pageModel.DiveActivity;
import jb.pageModel.PageHelper;
import jb.service.DiveActivityServiceI;
import jb.util.MyBeanUtils;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiveActivityServiceImpl extends BaseServiceImpl<DiveActivity> implements DiveActivityServiceI {

	@Autowired
	private DiveActivityDaoI diveActivityDao;

	@Override
	public DataGrid dataGrid(DiveActivity diveActivity, PageHelper ph) {
		List<DiveActivity> ol = new ArrayList<DiveActivity>();
		String hql = " from TdiveActivity t ";
		DataGrid dg = dataGridQuery(hql, ph, diveActivity, diveActivityDao);
		@SuppressWarnings("unchecked")
		List<TdiveActivity> l = dg.getRows();
		if (l != null && l.size() > 0) {
			for (TdiveActivity t : l) {
				DiveActivity o = new DiveActivity();
				BeanUtils.copyProperties(t, o);
				ol.add(o);
			}
		}
		dg.setRows(ol);
		return dg;
	}
	

	protected String whereHql(DiveActivity diveActivity, Map<String, Object> params) {
		String whereHql = "";	
		if (diveActivity != null) {
			whereHql += " where 1=1 ";
			if (!F.empty(diveActivity.getName())) {
				whereHql += " and t.name = :name";
				params.put("name", diveActivity.getName());
			}		
			if (!F.empty(diveActivity.getStartAddr())) {
				whereHql += " and t.startAddr = :startAddr";
				params.put("startAddr", diveActivity.getStartAddr());
			}		
			if (!F.empty(diveActivity.getAddrId())) {
				whereHql += " and t.addrId = :addrId";
				params.put("addrId", diveActivity.getAddrId());
			}		
			if (!F.empty(diveActivity.getEndAddr())) {
				whereHql += " and t.endAddr = :endAddr";
				params.put("endAddr", diveActivity.getEndAddr());
			}		
			if (!F.empty(diveActivity.getDescription())) {
				whereHql += " and t.description = :description";
				params.put("description", diveActivity.getDescription());
			}		
			if (!F.empty(diveActivity.getStatus())) {
				whereHql += " and t.status = :status";
				params.put("status", diveActivity.getStatus());
			}		
			if (!F.empty(diveActivity.getStamp())) {
				whereHql += " and t.stamp = :stamp";
				params.put("stamp", diveActivity.getStamp());
			}		
		}	
		return whereHql;
	}

	@Override
	public void add(DiveActivity diveActivity) {
		TdiveActivity t = new TdiveActivity();
		BeanUtils.copyProperties(diveActivity, t);
		t.setId(UUID.randomUUID().toString());
		//t.setCreatedatetime(new Date());
		diveActivityDao.save(t);
	}

	@Override
	public DiveActivity get(String id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		TdiveActivity t = diveActivityDao.get("from TdiveActivity t  where t.id = :id", params);
		DiveActivity o = new DiveActivity();
		BeanUtils.copyProperties(t, o);
		return o;
	}

	@Override
	public void edit(DiveActivity diveActivity) {
		TdiveActivity t = diveActivityDao.get(TdiveActivity.class, diveActivity.getId());
		if (t != null) {
			MyBeanUtils.copyProperties(diveActivity, t, new String[] { "id" , "createdatetime" },true);
			//t.setModifydatetime(new Date());
		}
	}

	@Override
	public void delete(String id) {
		diveActivityDao.delete(diveActivityDao.get(TdiveActivity.class, id));
	}


	@Override
	public DataGrid dataGriComplex(DiveActivity diveActivity, PageHelper ph) {
		DataGrid datagrid = dataGrid(diveActivity,ph);
		//TODO 查询报名人数，赞数，评论数
		return datagrid;
	}

	/**
	 * 个人收藏-活动收藏列表查询
	 */
	public DataGrid dataGridCollect(String accountId, PageHelper ph) {
		List<DiveActivity> ol = new ArrayList<DiveActivity>();
		ph.setSort("addtime");
		ph.setOrder("desc");
		
		DataGrid dg = new DataGrid();
		
		String hql = "select a from TdiveActivity a ,TdiveCollect t  "
				+ " where a.id = t.businessId and t.businessType='BT04' and t.accountId = :accountId";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("accountId", accountId);
		List<TdiveActivity> l = diveActivityDao.find(hql   + orderHql(ph), params, ph.getPage(), ph.getRows());
		dg.setTotal(diveActivityDao.count("select count(*) " + hql.substring(8) , params));
		if (l != null && l.size() > 0) {
			for (TdiveActivity t : l) {
				DiveActivity o = new DiveActivity();
				BeanUtils.copyProperties(t, o);
				ol.add(o);
			}
		}
		dg.setRows(ol);
		return dg;
	}
}
