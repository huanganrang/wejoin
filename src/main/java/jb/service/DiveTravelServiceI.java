package jb.service;

import jb.pageModel.DiveTravel;
import jb.pageModel.DataGrid;
import jb.pageModel.PageHelper;

/**
 * 
 * @author John
 * 
 */
public interface DiveTravelServiceI {

	/**
	 * 获取DiveTravel数据表格
	 * 
	 * @param diveTravel
	 *            参数
	 * @param ph
	 *            分页帮助类
	 * @return
	 */
	public DataGrid dataGrid(DiveTravel diveTravel, PageHelper ph);

	/**
	 * 添加DiveTravel
	 * 
	 * @param diveTravel
	 */
	public void add(DiveTravel diveTravel);

	/**
	 * 获得DiveTravel对象
	 * 
	 * @param id
	 * @return
	 */
	public DiveTravel get(String id);

	/**
	 * 修改DiveTravel
	 * 
	 * @param diveTravel
	 */
	public void edit(DiveTravel diveTravel);

	/**
	 * 删除DiveTravel
	 * 
	 * @param id
	 */
	public void delete(String id);

}
