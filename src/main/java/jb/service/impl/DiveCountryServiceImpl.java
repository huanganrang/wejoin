package jb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jb.absx.F;
import jb.dao.DiveCountryDaoI;
import jb.model.TdiveCountry;
import jb.pageModel.DataGrid;
import jb.pageModel.DiveCountry;
import jb.pageModel.PageHelper;
import jb.service.DiveCountryServiceI;
import jb.util.MyBeanUtils;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiveCountryServiceImpl extends BaseServiceImpl<DiveCountry> implements DiveCountryServiceI {

	@Autowired
	private DiveCountryDaoI diveCountryDao;

	@Override
	public DataGrid dataGrid(DiveCountry diveCountry, PageHelper ph) {
		List<DiveCountry> ol = new ArrayList<DiveCountry>();
		String hql = " from TdiveCountry t ";
		DataGrid dg = dataGridQuery(hql, ph, diveCountry, diveCountryDao);
		@SuppressWarnings("unchecked")
		List<TdiveCountry> l = dg.getRows();
		if (l != null && l.size() > 0) {
			for (TdiveCountry t : l) {
				DiveCountry o = new DiveCountry();
				BeanUtils.copyProperties(t, o);
				ol.add(o);
			}
		}
		dg.setRows(ol);
		return dg;
	}
	

	protected String whereHql(DiveCountry diveCountry, Map<String, Object> params) {
		String whereHql = "";	
		if (diveCountry != null) {
			whereHql += " where 1=1 ";
			if (!F.empty(diveCountry.getName())) {
				whereHql += " and t.name = :name";
				params.put("name", diveCountry.getName());
			}		
			if (!F.empty(diveCountry.getCode())) {
				whereHql += " and t.code = :code";
				params.put("code", diveCountry.getCode());
			}		
			if (!F.empty(diveCountry.getAdCode())) {
				whereHql += " and t.adCode = :adCode";
				params.put("adCode", diveCountry.getAdCode());
			}		
		}	
		return whereHql;
	}

	@Override
	public void add(DiveCountry diveCountry) {
		TdiveCountry t = new TdiveCountry();
		BeanUtils.copyProperties(diveCountry, t);
		diveCountryDao.save(t);
	}

	@Override
	public DiveCountry get(Integer id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		TdiveCountry t = diveCountryDao.get("from TdiveCountry t  where t.id = :id", params);
		DiveCountry o = new DiveCountry();
		BeanUtils.copyProperties(t, o);
		return o;
	}

	@Override
	public void edit(DiveCountry diveCountry) {
		TdiveCountry t = diveCountryDao.get(TdiveCountry.class, diveCountry.getId());
		if (t != null) {
			MyBeanUtils.copyProperties(diveCountry, t, new String[] { "id" , "createdatetime" },true);
			//t.setModifydatetime(new Date());
		}
	}

	@Override
	public void delete(Integer id) {
		diveCountryDao.delete(diveCountryDao.get(TdiveCountry.class, id));
	}


	/**
	 * 根据地区（洲）编码获取国家集合
	 */
	public List<DiveCountry> findAllByAdCode(String adCode) {
		List<DiveCountry> r = new ArrayList<DiveCountry>();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("adCode", adCode);
		List<TdiveCountry> l = diveCountryDao.find("from TdiveCountry t where t.adCode = :adCode order by t.id", params);
		if (l != null && l.size() > 0) {
			for (TdiveCountry t : l) {
				DiveCountry o = new DiveCountry();
				BeanUtils.copyProperties(t, o);
				r.add(o);
			}
		}
		return r;
	}

}
