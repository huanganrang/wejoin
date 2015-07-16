package jb.service;

import jb.pageModel.DiveAddress;
import jb.pageModel.DataGrid;
import jb.pageModel.PageHelper;

/**
 * 
 * @author John
 * 
 */
public interface DiveAddressServiceI {

	/**
	 * 获取DiveAddress数据表格
	 * 
	 * @param diveAddress
	 *            参数
	 * @param ph
	 *            分页帮助类
	 * @return
	 */
	public DataGrid dataGrid(DiveAddress diveAddress, PageHelper ph);

	/**
	 * 添加DiveAddress
	 * 
	 * @param diveAddress
	 */
	public void add(DiveAddress diveAddress);

	/**
	 * 获得DiveAddress对象
	 * 
	 * @param id
	 * @return
	 */
	public DiveAddress get(String id);

	/**
	 * 修改DiveAddress
	 * 
	 * @param diveAddress
	 */
	public void edit(DiveAddress diveAddress);

	/**
	 * 删除DiveAddress
	 * 
	 * @param id
	 */
	public void delete(String id);

	/**
	 * 个人收藏潜点收藏列表查询
	 * @param id
	 * @param ph
	 * @return
	 */
	public DataGrid dataGridCollect(String accountId, PageHelper ph);

}
