package jb.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import jb.absx.F;
import jb.dao.DiveAddressDaoI;
import jb.model.TdiveAddress;
import jb.pageModel.DiveAddress;
import jb.pageModel.DataGrid;
import jb.pageModel.PageHelper;
import jb.service.DiveAddressServiceI;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import jb.util.MyBeanUtils;

@Service
public class DiveAddressServiceImpl extends BaseServiceImpl<DiveAddress> implements DiveAddressServiceI {

	@Autowired
	private DiveAddressDaoI diveAddressDao;

	@Override
	public DataGrid dataGrid(DiveAddress diveAddress, PageHelper ph) {
		List<DiveAddress> ol = new ArrayList<DiveAddress>();
		String hql = " from TdiveAddress t ";
		DataGrid dg = dataGridQuery(hql, ph, diveAddress, diveAddressDao);
		@SuppressWarnings("unchecked")
		List<TdiveAddress> l = dg.getRows();
		if (l != null && l.size() > 0) {
			for (TdiveAddress t : l) {
				DiveAddress o = new DiveAddress();
				BeanUtils.copyProperties(t, o);
				ol.add(o);
			}
		}
		dg.setRows(ol);
		return dg;
	}
	

	protected String whereHql(DiveAddress diveAddress, Map<String, Object> params) {
		String whereHql = "";	
		if (diveAddress != null) {
			whereHql += " where 1=1 ";
			if (!F.empty(diveAddress.getName())) {
				whereHql += " and t.name = :name";
				params.put("name", diveAddress.getName());
			}		
			if (!F.empty(diveAddress.getSumary())) {
				whereHql += " and t.sumary = :sumary";
				params.put("sumary", diveAddress.getSumary());
			}		
			if (!F.empty(diveAddress.getIcon())) {
				whereHql += " and t.icon = :icon";
				params.put("icon", diveAddress.getIcon());
			}		
			if (!F.empty(diveAddress.getDescription())) {
				whereHql += " and t.description = :description";
				params.put("description", diveAddress.getDescription());
			}		
			if (!F.empty(diveAddress.getArea())) {
				whereHql += " and t.area = :area";
				params.put("area", diveAddress.getArea());
			}		
			if (!F.empty(diveAddress.getFeature())) {
				whereHql += " and t.feature = :feature";
				params.put("feature", diveAddress.getFeature());
			}		
			if (!F.empty(diveAddress.getStatus())) {
				whereHql += " and t.status = :status";
				params.put("status", diveAddress.getStatus());
			}		
		}	
		return whereHql;
	}

	@Override
	public void add(DiveAddress diveAddress) {
		TdiveAddress t = new TdiveAddress();
		BeanUtils.copyProperties(diveAddress, t);
		t.setId(UUID.randomUUID().toString());
		//t.setCreatedatetime(new Date());
		diveAddressDao.save(t);
	}

	@Override
	public DiveAddress get(String id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		TdiveAddress t = diveAddressDao.get("from TdiveAddress t  where t.id = :id", params);
		DiveAddress o = new DiveAddress();
		BeanUtils.copyProperties(t, o);
		return o;
	}

	@Override
	public void edit(DiveAddress diveAddress) {
		TdiveAddress t = diveAddressDao.get(TdiveAddress.class, diveAddress.getId());
		if (t != null) {
			MyBeanUtils.copyProperties(diveAddress, t, new String[] { "id" , "createdatetime" },true);
			//t.setModifydatetime(new Date());
		}
	}

	@Override
	public void delete(String id) {
		diveAddressDao.delete(diveAddressDao.get(TdiveAddress.class, id));
	}

}
