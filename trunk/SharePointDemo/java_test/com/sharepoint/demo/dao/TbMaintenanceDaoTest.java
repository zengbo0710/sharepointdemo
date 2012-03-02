/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2012
 */

package com.sharepoint.demo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.junit.Test;

import cn.org.rapid_framework.test.context.TestMethodContext;

import static junit.framework.Assert.*;

import java.util.*;

import javacommon.base.*;
import javacommon.util.*;

import cn.org.rapid_framework.util.*;
import cn.org.rapid_framework.web.util.*;
import cn.org.rapid_framework.page.*;
import cn.org.rapid_framework.page.impl.*;

import com.sharepoint.demo.model.*;
import com.sharepoint.demo.dao.*;
import com.sharepoint.demo.service.*;
import com.sharepoint.demo.vo.query.*;

/**
 * @author badqiu email:badqiu(a)gmail.com
 * @version 1.0
 * @since 1.0
 */


public class TbMaintenanceDaoTest extends BaseDaoTestCase{
	
	private TbMaintenanceDao dao;
	
	@Autowired
	public void setTbMaintenanceDao(TbMaintenanceDao dao) {
		this.dao = dao;
	}

	@Override 
	protected String[] getDbUnitDataFiles() {
	    //通过 TestMethodContext.getMethodName() 可以得到当前正在运行的测试方法名称
		return new String[]{"classpath:testdata/common.xml","classpath:testdata/TbMaintenance.xml",
		                    "classpath:testdata/TbMaintenance_"+TestMethodContext.getMethodName()+".xml"};
	}
	
	//数据库单元测试前会开始事务，结束时会回滚事务，所以测试方法可以不用关心测试数据的删除
	@Test
	public void findPage() {

		TbMaintenanceQuery query = newTbMaintenanceQuery();
		Page page = dao.findPage(query);
		
		assertEquals(pageNumber,page.getThisPageNumber());
		assertEquals(pageSize,page.getPageSize());
		List resultList = (List)page.getResult();
		assertNotNull(resultList);
		
	}
	
	static int pageNumber = 1;
	static int pageSize = 10;	
	public static TbMaintenanceQuery newTbMaintenanceQuery() {
		TbMaintenanceQuery query = new TbMaintenanceQuery();
		query.setPageNumber(pageNumber);
		query.setPageSize(pageSize);
		query.setSortColumns(null);
		
	  	query.setType(new Integer("1"));
	  	query.setTitle(new String("1"));
	  	query.setDescriptions(new String("1"));
	  	query.setLocation(new String("1"));
	  	query.setLink(new String("1"));
	  	query.setInformation(new String("1"));
		return query;
	}
	
}
