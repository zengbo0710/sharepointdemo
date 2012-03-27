/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2012
 */

package com.maintenance.demo.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

import javacommon.base.*;
import javacommon.util.*;

import cn.org.rapid_framework.util.*;
import cn.org.rapid_framework.web.util.*;
import cn.org.rapid_framework.page.*;
import cn.org.rapid_framework.page.impl.*;

import com.maintenance.demo.model.*;
import com.maintenance.demo.dao.*;
import com.maintenance.demo.service.*;
import com.maintenance.demo.vo.query.*;

/**
 * @author badqiu email:badqiu(a)gmail.com
 * @version 1.0
 * @since 1.0
 */

@Service
@Transactional
public class TbIncomingTasksManager extends BaseManager<TbIncomingTasks,java.lang.Integer>{

	private TbIncomingTasksDao tbIncomingTasksDao;
	/**增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,请注意大小写*/
	public void setTbIncomingTasksDao(TbIncomingTasksDao dao) {
		this.tbIncomingTasksDao = dao;
	}
	public EntityDao getEntityDao() {
		return this.tbIncomingTasksDao;
	}
	
	@Transactional(readOnly=true)
	public Page findPage(TbIncomingTasksQuery query) {
		return tbIncomingTasksDao.findPage(query);
	}
	
}
