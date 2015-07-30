package jb.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import jb.absx.F;
import jb.dao.DiveCollectDaoI;
import jb.dao.DiveTravelDaoI;
import jb.model.TdiveTravel;
import jb.pageModel.DataGrid;
import jb.pageModel.DiveTravel;
import jb.pageModel.PageHelper;
import jb.service.DiveTravelServiceI;
import jb.util.Constants;
import jb.util.MyBeanUtils;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiveTravelServiceImpl extends BaseServiceImpl<DiveTravel> implements DiveTravelServiceI {

	@Autowired
	private DiveTravelDaoI diveTravelDao;
	
	@Autowired
	private DiveCollectDaoI diveCollectDao;

	@Override
	public DataGrid dataGrid(DiveTravel diveTravel, PageHelper ph) {
		List<DiveTravel> ol = new ArrayList<DiveTravel>();
		String hql = " from TdiveTravel t ";
		DataGrid dg = dataGridQuery(hql, ph, diveTravel, diveTravelDao);
		@SuppressWarnings("unchecked")
		List<TdiveTravel> l = dg.getRows();
		if (l != null && l.size() > 0) {
			for (TdiveTravel t : l) {
				DiveTravel o = new DiveTravel();
				BeanUtils.copyProperties(t, o);
				o.setDescription(null);
				ol.add(o);
			}
		}
		dg.setRows(ol);
		return dg;
	}
	

	protected String whereHql(DiveTravel diveTravel, Map<String, Object> params) {
		String whereHql = "";	
		if (diveTravel != null) {
			whereHql += " where 1=1 ";
			if (!F.empty(diveTravel.getName())) {
				whereHql += " and t.name = :name";
				params.put("name", diveTravel.getName());
			}		
			if (!F.empty(diveTravel.getSumary())) {
				whereHql += " and t.sumary = :sumary";
				params.put("sumary", diveTravel.getSumary());
			}		
				
			if (!F.empty(diveTravel.getIcon())) {
				whereHql += " and t.icon = :icon";
				params.put("icon", diveTravel.getIcon());
			}		
			if (!F.empty(diveTravel.getDescription())) {
				whereHql += " and t.description = :description";
				params.put("description", diveTravel.getDescription());
			}		
			if (!F.empty(diveTravel.getArea())) {
				whereHql += " and t.area = :area";
				params.put("area", diveTravel.getArea());
			}		
			if (!F.empty(diveTravel.getFeature())) {
				whereHql += " and t.feature = :feature";
				params.put("feature", diveTravel.getFeature());
			}		
			if (!F.empty(diveTravel.getStatus())) {
				whereHql += " and t.status = :status";
				params.put("status", diveTravel.getStatus());
			}		
		}	
		return whereHql;
	}

	@Override
	public void add(DiveTravel diveTravel) {
		TdiveTravel t = new TdiveTravel();
		BeanUtils.copyProperties(diveTravel, t);
		t.setId(UUID.randomUUID().toString());
		t.setAddtime(new Date());
		diveTravelDao.save(t);
	}

	@Override
	public DiveTravel get(String id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		TdiveTravel t = diveTravelDao.get("from TdiveTravel t  where t.id = :id", params);
		DiveTravel o = new DiveTravel();
		BeanUtils.copyProperties(t, o);
		return o;
	}

	@Override
	public void edit(DiveTravel diveTravel) {
		TdiveTravel t = diveTravelDao.get(TdiveTravel.class, diveTravel.getId());
		if (t != null) {
			MyBeanUtils.copyProperties(diveTravel, t, new String[] { "id" , "createdatetime" },true);
			//t.setModifydatetime(new Date());
		}
	}

	@Override
	public void delete(String id) {
		diveTravelDao.delete(diveTravelDao.get(TdiveTravel.class, id));
	}
	
	/**
	 * 获取详情信息
	 */
	public DiveTravel getDetail(String id, String accountId) {
		DiveTravel d = get(id);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("accountId", accountId);
		params.put("businessId", id);
		params.put("businessType", TRAVEL_TAG);
		if(diveCollectDao.count("select count(*) from TdiveCollect t where t.accountId = :accountId and t.businessId = :businessId and t.businessType = :businessType", params) > 0) {
			d.setCollect(true); // 已收藏
		} else {
			d.setCollect(false); // 未收藏
		}
		
		String desPath = Constants.DETAIL_HTML_PATH.replace("TYPE", TRAVEL_TAG).replace("ID", id);
		d.setDescription(desPath);
		return d;
	}

	/**
	 * 个人收藏-潜水旅游收藏列表查询
	 */
	public DataGrid dataGridCollect(String accountId, PageHelper ph) {
		List<DiveTravel> ol = new ArrayList<DiveTravel>();
		ph.setSort("addtime");
		ph.setOrder("desc");
		
		DataGrid dg = new DataGrid();
		
		String hql = "select a from TdiveTravel a ,TdiveCollect t  "
				+ " where a.id = t.businessId and t.businessType='"+TRAVEL_TAG+"' and t.accountId = :accountId";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("accountId", accountId);
		List<TdiveTravel> l = diveTravelDao.find(hql   + orderHql(ph), params, ph.getPage(), ph.getRows());
		dg.setTotal(diveTravelDao.count("select count(*) " + hql.substring(8) , params));
		if (l != null && l.size() > 0) {
			for (TdiveTravel t : l) {
				DiveTravel o = new DiveTravel();
				BeanUtils.copyProperties(t, o);
				o.setDescription(null);
				ol.add(o);
			}
		}
		dg.setRows(ol);
		return dg;
	}

	/**
	 * 首页-潜水旅游列表查询
	 */
	@SuppressWarnings("rawtypes")
	public List<Map> findHomeList() {
		String sql = "select t.id, t.name, t.icon from dive_travel t join tbasedata b on b.name = t.id and b.basetype_code = '" + TRAVEL_HOME_TAG + "' order by b.seq asc";
		List<Map> l = diveTravelDao.findBySql2Map(sql);
		return l == null ? new ArrayList<Map>() : l;
	}

}
