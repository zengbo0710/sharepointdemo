/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2012
 */

package com.maintenance.demo.service;

import java.util.List;

import javacommon.base.BaseHibernateDao;
import javacommon.base.BaseManager;
import javacommon.base.EntityDao;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.org.rapid_framework.page.Page;

import com.maintenance.demo.dao.TbUserInfoDao;
import com.maintenance.demo.model.TbUserInfo;
import com.maintenance.demo.vo.query.TbUserInfoQuery;

/**
 * @author badqiu email:badqiu(a)gmail.com
 * @version 1.0
 * @since 1.0
 */

@Service
@Transactional
public class TbUserInfoManager extends BaseManager<TbUserInfo,java.lang.Integer>{

	private TbUserInfoDao tbUserInfoDao;
	/**增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,请注意大小写*/
	public void setTbUserInfoDao(TbUserInfoDao dao) {
		this.tbUserInfoDao = dao;
	}
	public EntityDao getEntityDao() {
		return this.tbUserInfoDao;
	}
	
	@Transactional(readOnly=true)
	public Page findPage(TbUserInfoQuery query) {
		return tbUserInfoDao.findPage(query);
	}
	
	@Transactional(readOnly=true)
	public TbUserInfo getByUserName(java.lang.String v) {
		return tbUserInfoDao.getByUserName(v);
	}	
	
	public TbUserInfo getByNameAndPwd(String userName){
		TbUserInfo tbUserInfoList = tbUserInfoDao.getByUserName(userName);
		if(tbUserInfoList!=null){
			return tbUserInfoList;
		}
		return null;
	}
	
}
