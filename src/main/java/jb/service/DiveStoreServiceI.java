package jb.service;

import jb.pageModel.DiveStore;
import jb.pageModel.DataGrid;
import jb.pageModel.PageHelper;

/**
 * 
 * @author John
 * 
 */
public interface DiveStoreServiceI {

	/**
	 * 获取DiveStore数据表格
	 * 
	 * @param diveStore
	 *            参数
	 * @param ph
	 *            分页帮助类
	 * @return
	 */
	public DataGrid dataGrid(DiveStore diveStore, PageHelper ph);

	/**
	 * 添加DiveStore
	 * 
	 * @param diveStore
	 */
	public void add(DiveStore diveStore);

	/**
	 * 获得DiveStore对象
	 * 
	 * @param id
	 * @return
	 */
	public DiveStore get(String id);

	/**
	 * 修改DiveStore
	 * 
	 * @param diveStore
	 */
	public void edit(DiveStore diveStore);

	/**
	 * 删除DiveStore
	 * 
	 * @param id
	 */
	public void delete(String id);

}
