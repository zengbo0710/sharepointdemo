/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2012
 */

package com.sharepoint.demo.service;

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


public class TbMaintenanceManagerTest extends BaseManagerTestCase{

	private TbMaintenanceManager manager;
	
	@Autowired
	public void setTbMaintenanceManager(TbMaintenanceManager manager) {
		this.manager = manager;
	}

    @Override
    protected String[] getDbUnitDataFiles() {
        //通过 TestMethodContext.getMethodName() 可以得到当前正在运行的测试方法名称
        return new String[]{"classpath:testdata/common.xml","classpath:testdata/TbMaintenance.xml",
                            "classpath:testdata/TbMaintenance_"+TestMethodContext.getMethodName()+".xml"};
    }

	//数据库单元测试前会开始事务，结束时会回滚事务，所以测试方法可以不用关心测试数据的删除
	@Test
	public void crud() {

		TbMaintenance obj = newTbMaintenance();
		manager.save(obj);
		manager.getEntityDao().flush();
		
		manager.update(obj);
		manager.getEntityDao().flush();
		
		assertNotNull(obj.getId());
		
		manager.removeById(obj.getId());
		manager.getEntityDao().flush();
	
	}
	
	public static TbMaintenance newTbMaintenance() {
		TbMaintenance obj = new TbMaintenance();
		
	  	obj.setType(new java.lang.Integer("1"));
	  	obj.setTitle(new java.lang.String("1"));
	  	obj.setDescriptions(new java.lang.String("1"));
	  	obj.setLocation(new java.lang.String("1"));
	  	obj.setLink(new java.lang.String("1"));
	  	obj.setInformation(new java.lang.String("1"));
		return obj;
	}
}
