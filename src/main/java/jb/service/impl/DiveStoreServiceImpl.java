package jb.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import jb.absx.F;
import jb.dao.DiveStoreDaoI;
import jb.model.TdiveStore;
import jb.pageModel.DiveStore;
import jb.pageModel.DataGrid;
import jb.pageModel.PageHelper;
import jb.service.DiveStoreServiceI;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import jb.util.MyBeanUtils;

@Service
public class DiveStoreServiceImpl extends BaseServiceImpl<DiveStore> implements DiveStoreServiceI {

	@Autowired
	private DiveStoreDaoI diveStoreDao;

	@Override
	public DataGrid dataGrid(DiveStore diveStore, PageHelper ph) {
		List<DiveStore> ol = new ArrayList<DiveStore>();
		String hql = " from TdiveStore t ";
		DataGrid dg = dataGridQuery(hql, ph, diveStore, diveStoreDao);
		@SuppressWarnings("unchecked")
		List<TdiveStore> l = dg.getRows();
		if (l != null && l.size() > 0) {
			for (TdiveStore t : l) {
				DiveStore o = new DiveStore();
				BeanUtils.copyProperties(t, o);
				ol.add(o);
			}
		}
		dg.setRows(ol);
		return dg;
	}
	

	protected String whereHql(DiveStore diveStore, Map<String, Object> params) {
		String whereHql = "";	
		if (diveStore != null) {
			whereHql += " where 1=1 ";
			if (!F.empty(diveStore.getName())) {
				whereHql += " and t.name = :name";
				params.put("name", diveStore.getName());
			}		
			if (!F.empty(diveStore.getIcon())) {
				whereHql += " and t.icon = :icon";
				params.put("icon", diveStore.getIcon());
			}		
			if (!F.empty(diveStore.getSumary())) {
				whereHql += " and t.sumary = :sumary";
				params.put("sumary", diveStore.getSumary());
			}		
			if (!F.empty(diveStore.getServerScope())) {
				whereHql += " and t.serverScope = :serverScope";
				params.put("serverScope", diveStore.getServerScope());
			}		
			if (!F.empty(diveStore.getArea())) {
				whereHql += " and t.area = :area";
				params.put("area", diveStore.getArea());
			}		
			if (!F.empty(diveStore.getStatus())) {
				whereHql += " and t.status = :status";
				params.put("status", diveStore.getStatus());
			}		
		}	
		return whereHql;
	}

	@Override
	public void add(DiveStore diveStore) {
		TdiveStore t = new TdiveStore();
		BeanUtils.copyProperties(diveStore, t);
		t.setId(UUID.randomUUID().toString());
		//t.setCreatedatetime(new Date());
		diveStoreDao.save(t);
	}

	@Override
	public DiveStore get(String id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		TdiveStore t = diveStoreDao.get("from TdiveStore t  where t.id = :id", params);
		DiveStore o = new DiveStore();
		BeanUtils.copyProperties(t, o);
		return o;
	}

	@Override
	public void edit(DiveStore diveStore) {
		TdiveStore t = diveStoreDao.get(TdiveStore.class, diveStore.getId());
		if (t != null) {
			MyBeanUtils.copyProperties(diveStore, t, new String[] { "id" , "createdatetime" },true);
			//t.setModifydatetime(new Date());
		}
	}

	@Override
	public void delete(String id) {
		diveStoreDao.delete(diveStoreDao.get(TdiveStore.class, id));
	}

}
