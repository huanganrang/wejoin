package jb.service;

import jb.pageModel.DiveAccount;
import jb.pageModel.DataGrid;
import jb.pageModel.PageHelper;

/**
 * 
 * @author John
 * 
 */
public interface DiveAccountServiceI {

	/**
	 * 获取DiveAccount数据表格
	 * 
	 * @param diveAccount
	 *            参数
	 * @param ph
	 *            分页帮助类
	 * @return
	 */
	public DataGrid dataGrid(DiveAccount diveAccount, PageHelper ph);

	/**
	 * 添加DiveAccount
	 * 
	 * @param diveAccount
	 */
	public void add(DiveAccount diveAccount);

	/**
	 * 获得DiveAccount对象
	 * 
	 * @param id
	 * @return
	 */
	public DiveAccount get(String id);

	/**
	 * 修改DiveAccount
	 * 
	 * @param diveAccount
	 */
	public void edit(DiveAccount diveAccount);

	/**
	 * 删除DiveAccount
	 * 
	 * @param id
	 */
	public void delete(String id);

	public DiveAccount reg(DiveAccount account);

	public DiveAccount login(DiveAccount account);

	public DiveAccount personHome(String id);

}
