package jb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jb.absx.F;
import jb.dao.DiveAreaDaoI;
import jb.model.TdiveArea;
import jb.pageModel.DataGrid;
import jb.pageModel.DiveArea;
import jb.pageModel.PageHelper;
import jb.service.DiveAreaServiceI;
import jb.util.MyBeanUtils;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiveAreaServiceImpl extends BaseServiceImpl<DiveArea> implements DiveAreaServiceI {

	@Autowired
	private DiveAreaDaoI diveAreaDao;

	@Override
	public DataGrid dataGrid(DiveArea diveArea, PageHelper ph) {
		List<DiveArea> ol = new ArrayList<DiveArea>();
		String hql = " from TdiveArea t ";
		DataGrid dg = dataGridQuery(hql, ph, diveArea, diveAreaDao);
		@SuppressWarnings("unchecked")
		List<TdiveArea> l = dg.getRows();
		if (l != null && l.size() > 0) {
			for (TdiveArea t : l) {
				DiveArea o = new DiveArea();
				BeanUtils.copyProperties(t, o);
				ol.add(o);
			}
		}
		dg.setRows(ol);
		return dg;
	}
	

	protected String whereHql(DiveArea diveArea, Map<String, Object> params) {
		String whereHql = "";	
		if (diveArea != null) {
			whereHql += " where 1=1 ";
			if (!F.empty(diveArea.getCode())) {
				whereHql += " and t.code = :code";
				params.put("code", diveArea.getCode());
			}		
			if (!F.empty(diveArea.getName())) {
				whereHql += " and t.name = :name";
				params.put("name", diveArea.getName());
			}		
			if (!F.empty(diveArea.getParentCode())) {
				whereHql += " and t.parentCode = :parentCode";
				params.put("parentCode", diveArea.getParentCode());
			}		
			if (!F.empty(diveArea.getCountryCode())) {
				whereHql += " and t.countryCode = :countryCode";
				params.put("countryCode", diveArea.getCountryCode());
			}		
		}	
		return whereHql;
	}

	@Override
	public void add(DiveArea diveArea) {
		TdiveArea t = new TdiveArea();
		BeanUtils.copyProperties(diveArea, t);
		diveAreaDao.save(t);
	}

	@Override
	public DiveArea get(Integer id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		TdiveArea t = diveAreaDao.get("from TdiveArea t  where t.id = :id", params);
		DiveArea o = new DiveArea();
		BeanUtils.copyProperties(t, o);
		return o;
	}

	@Override
	public void edit(DiveArea diveArea) {
		TdiveArea t = diveAreaDao.get(TdiveArea.class, diveArea.getId());
		if (t != null) {
			MyBeanUtils.copyProperties(diveArea, t, new String[] { "id" , "createdatetime" },true);
			//t.setModifydatetime(new Date());
		}
	}

	@Override
	public void delete(Integer id) {
		diveAreaDao.delete(diveAreaDao.get(TdiveArea.class, id));
	}


	@Override
	public List<DiveArea> findAllByParams(DiveArea diveArea) {
		List<DiveArea> r = new ArrayList<DiveArea>();
		Map<String, Object> params = new HashMap<String, Object>();
		String whereHql = whereHql(diveArea, params);
		List<TdiveArea> l = diveAreaDao.find("from TdiveArea t " + whereHql + " order by t.code asc", params);
		if (l != null && l.size() > 0) {
			for (TdiveArea t : l) {
				DiveArea o = new DiveArea();
				BeanUtils.copyProperties(t, o);
				r.add(o);
			}
		}
		return r;
	}

}
