package jb.service;

import java.util.List;

import jb.pageModel.DataGrid;
import jb.pageModel.DiveArea;
import jb.pageModel.PageHelper;

/**
 * 
 * @author John
 * 
 */
public interface DiveAreaServiceI {

	/**
	 * 获取DiveArea数据表格
	 * 
	 * @param diveArea
	 *            参数
	 * @param ph
	 *            分页帮助类
	 * @return
	 */
	public DataGrid dataGrid(DiveArea diveArea, PageHelper ph);

	/**
	 * 添加DiveArea
	 * 
	 * @param diveArea
	 */
	public void add(DiveArea diveArea);

	/**
	 * 获得DiveArea对象
	 * 
	 * @param id
	 * @return
	 */
	public DiveArea get(Integer id);

	/**
	 * 修改DiveArea
	 * 
	 * @param diveArea
	 */
	public void edit(DiveArea diveArea);

	/**
	 * 删除DiveArea
	 * 
	 * @param id
	 */
	public void delete(Integer id);

	public List<DiveArea> findAllByParams(DiveArea diveArea);

}
