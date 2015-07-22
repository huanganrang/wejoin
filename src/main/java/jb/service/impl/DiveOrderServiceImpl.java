package jb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import jb.absx.F;
import jb.dao.DiveOrderDaoI;
import jb.model.TdiveOrder;
import jb.pageModel.DataGrid;
import jb.pageModel.DiveOrder;
import jb.pageModel.PageHelper;
import jb.service.DiveOrderServiceI;
import jb.util.MyBeanUtils;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiveOrderServiceImpl extends BaseServiceImpl<DiveOrder> implements DiveOrderServiceI {

	@Autowired
	private DiveOrderDaoI diveOrderDao;

	@Override
	public DataGrid dataGrid(DiveOrder diveOrder, PageHelper ph) {
		List<DiveOrder> ol = new ArrayList<DiveOrder>();
		String hql = " from TdiveOrder t ";
		DataGrid dg = dataGridQuery(hql, ph, diveOrder, diveOrderDao);
		@SuppressWarnings("unchecked")
		List<TdiveOrder> l = dg.getRows();
		if (l != null && l.size() > 0) {
			for (TdiveOrder t : l) {
				DiveOrder o = new DiveOrder();
				BeanUtils.copyProperties(t, o);
				ol.add(o);
			}
		}
		dg.setRows(ol);
		return dg;
	}
	

	protected String whereHql(DiveOrder diveOrder, Map<String, Object> params) {
		String whereHql = "";	
		if (diveOrder != null) {
			whereHql += " where 1=1 ";
			if (!F.empty(diveOrder.getAccountId())) {
				whereHql += " and t.accountId = :accountId";
				params.put("accountId", diveOrder.getAccountId());
			}		
			if (!F.empty(diveOrder.getAddress())) {
				whereHql += " and t.address = :address";
				params.put("address", diveOrder.getAddress());
			}		
			if (!F.empty(diveOrder.getExpressName())) {
				whereHql += " and t.expressName = :expressName";
				params.put("expressName", diveOrder.getExpressName());
			}		
			if (!F.empty(diveOrder.getExpressNo())) {
				whereHql += " and t.expressNo = :expressNo";
				params.put("expressNo", diveOrder.getExpressNo());
			}		
			if (!F.empty(diveOrder.getPayWay())) {
				whereHql += " and t.payWay = :payWay";
				params.put("payWay", diveOrder.getPayWay());
			}		
			if (!F.empty(diveOrder.getRemark())) {
				whereHql += " and t.remark = :remark";
				params.put("remark", diveOrder.getRemark());
			}		
			if (!F.empty(diveOrder.getPayStatus())) {
				whereHql += " and t.payStatus = :payStatus";
				params.put("payStatus", diveOrder.getPayStatus());
			}		
			if (!F.empty(diveOrder.getOrderStatus())) {
				whereHql += " and t.orderStatus = :orderStatus";
				params.put("orderStatus", diveOrder.getOrderStatus());
			}		
			if (!F.empty(diveOrder.getSendStatus())) {
				whereHql += " and t.sendStatus = :sendStatus";
				params.put("sendStatus", diveOrder.getSendStatus());
			}		
		}	
		return whereHql;
	}

	@Override
	public void add(DiveOrder diveOrder) {
		TdiveOrder t = new TdiveOrder();
		BeanUtils.copyProperties(diveOrder, t);
		t.setId(UUID.randomUUID().toString());
		//t.setCreatedatetime(new Date());
		diveOrderDao.save(t);
	}

	@Override
	public DiveOrder get(String id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		TdiveOrder t = diveOrderDao.get("from TdiveOrder t  where t.id = :id", params);
		DiveOrder o = new DiveOrder();
		BeanUtils.copyProperties(t, o);
		return o;
	}

	@Override
	public void edit(DiveOrder diveOrder) {
		TdiveOrder t = diveOrderDao.get(TdiveOrder.class, diveOrder.getId());
		if (t != null) {
			MyBeanUtils.copyProperties(diveOrder, t, new String[] { "id" , "createdatetime" },true);
			//t.setModifydatetime(new Date());
		}
	}

	@Override
	public void delete(String id) {
		diveOrderDao.delete(diveOrderDao.get(TdiveOrder.class, id));
	}

}
