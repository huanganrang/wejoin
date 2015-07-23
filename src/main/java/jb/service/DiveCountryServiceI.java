package jb.service;

import java.util.List;

import jb.pageModel.DiveCountry;
import jb.pageModel.DataGrid;
import jb.pageModel.PageHelper;

/**
 * 
 * @author John
 * 
 */
public interface DiveCountryServiceI {

	/**
	 * 获取DiveCountry数据表格
	 * 
	 * @param diveCountry
	 *            参数
	 * @param ph
	 *            分页帮助类
	 * @return
	 */
	public DataGrid dataGrid(DiveCountry diveCountry, PageHelper ph);

	/**
	 * 添加DiveCountry
	 * 
	 * @param diveCountry
	 */
	public void add(DiveCountry diveCountry);

	/**
	 * 获得DiveCountry对象
	 * 
	 * @param id
	 * @return
	 */
	public DiveCountry get(Integer id);

	/**
	 * 修改DiveCountry
	 * 
	 * @param diveCountry
	 */
	public void edit(DiveCountry diveCountry);

	/**
	 * 删除DiveCountry
	 * 
	 * @param id
	 */
	public void delete(Integer id);

	public List<DiveCountry> findAllByAdCode(String adCode);
}
