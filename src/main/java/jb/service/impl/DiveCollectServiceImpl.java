package jb.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import jb.absx.F;
import jb.dao.DiveCollectDaoI;
import jb.model.TdiveCollect;
import jb.pageModel.DiveCollect;
import jb.pageModel.DataGrid;
import jb.pageModel.PageHelper;
import jb.service.DiveCollectServiceI;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import jb.util.MyBeanUtils;

@Service
public class DiveCollectServiceImpl extends BaseServiceImpl<DiveCollect> implements DiveCollectServiceI {

	@Autowired
	private DiveCollectDaoI diveCollectDao;

	@Override
	public DataGrid dataGrid(DiveCollect diveCollect, PageHelper ph) {
		List<DiveCollect> ol = new ArrayList<DiveCollect>();
		String hql = " from TdiveCollect t ";
		DataGrid dg = dataGridQuery(hql, ph, diveCollect, diveCollectDao);
		@SuppressWarnings("unchecked")
		List<TdiveCollect> l = dg.getRows();
		if (l != null && l.size() > 0) {
			for (TdiveCollect t : l) {
				DiveCollect o = new DiveCollect();
				BeanUtils.copyProperties(t, o);
				ol.add(o);
			}
		}
		dg.setRows(ol);
		return dg;
	}
	

	protected String whereHql(DiveCollect diveCollect, Map<String, Object> params) {
		String whereHql = "";	
		if (diveCollect != null) {
			whereHql += " where 1=1 ";
			if (!F.empty(diveCollect.getBusinessId())) {
				whereHql += " and t.businessId = :businessId";
				params.put("businessId", diveCollect.getBusinessId());
			}		
			if (!F.empty(diveCollect.getBusinessType())) {
				whereHql += " and t.businessType = :businessType";
				params.put("businessType", diveCollect.getBusinessType());
			}		
		}	
		return whereHql;
	}

	@Override
	public void add(DiveCollect diveCollect) {
		TdiveCollect t = new TdiveCollect();
		BeanUtils.copyProperties(diveCollect, t);
		t.setId(UUID.randomUUID().toString());
		//t.setCreatedatetime(new Date());
		diveCollectDao.save(t);
	}

	@Override
	public DiveCollect get(String id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		TdiveCollect t = diveCollectDao.get("from TdiveCollect t  where t.id = :id", params);
		DiveCollect o = new DiveCollect();
		BeanUtils.copyProperties(t, o);
		return o;
	}

	@Override
	public void edit(DiveCollect diveCollect) {
		TdiveCollect t = diveCollectDao.get(TdiveCollect.class, diveCollect.getId());
		if (t != null) {
			MyBeanUtils.copyProperties(diveCollect, t, new String[] { "id" , "createdatetime" },true);
			//t.setModifydatetime(new Date());
		}
	}

	@Override
	public void delete(String id) {
		diveCollectDao.delete(diveCollectDao.get(TdiveCollect.class, id));
	}

}
