/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2012
 */

package com.maintenance.demo.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.support.DataAccessUtils;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;
import static cn.org.rapid_framework.util.ObjectUtils.*;

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

@Repository
public class TbUserInfoDao extends BaseSpringJdbcDao<TbUserInfo,java.lang.Integer>{
	
	//注意: getSqlGenerator()可以生成基本的：增删改查sql语句, 通过这个父类已经封装了增删改查操作
    // sqlgenerator参考: http://code.google.com/p/rapid-framework/wiki/rapid_sqlgenerator
    
	public Class getEntityClass() {
		return TbUserInfo.class;
	}
	
	public void save(TbUserInfo entity) {
		String sql = getSqlGenerator().getInsertSql();
		insertWithIdentity(entity,sql); //for sqlserver and mysql
		
		//其它主键生成策略
		//insertWithOracleSequence(entity,"sequenceName",sql); //oracle sequence: 
		//insertWithDB2Sequence(entity,"sequenceName",sql); //db2 sequence:
		//insertWithUUID(entity,sql); //uuid
		//insertWithAssigned(entity,sql); //手工分配
	}
	
	public Page findPage(TbUserInfoQuery query) {
		//XsqlBuilder syntax,please see http://code.google.com/p/rapid-xsqlbuilder
		// [column]为字符串拼接, {column}为使用占位符. 如username='[username]',偷懒时可以使用字符串拼接 
		// [column] 为PageRequest的属性
		String sql = "select "+ getSqlGenerator().getColumnsSql("t") + " from tb_user_info t where 1=1 "
			  	+ "/~ and t.user_name = {userName} ~/"
			  	+ "/~ and t.password = {password} ~/"
			  	+ "/~ and t.description = {description} ~/"
			  	+ "/~ and t.role = {role} ~/"
				+ "/~ order by [sortColumns] ~/";
		
		//生成sql2的原因是为了不喜欢使用xsqlbuilder的同学，请修改生成器模板，删除本段的生成
		StringBuilder sql2 = new StringBuilder("select "+ getSqlGenerator().getColumnsSql("t") + " from tb_user_info t where 1=1 ");
		if(isNotEmpty(query.getId())) {
            sql2.append(" and t.id = :id ");
        }
		if(isNotEmpty(query.getUserName())) {
            sql2.append(" and t.user_name = :userName ");
        }
		if(isNotEmpty(query.getPassword())) {
            sql2.append(" and t.password = :password ");
        }
		if(isNotEmpty(query.getDescription())) {
            sql2.append(" and t.description = :description ");
        }
		if(isNotEmpty(query.getRole())) {
            sql2.append(" and t.role = :role ");
        }
		if(isNotEmpty(query.getSortColumns())) {
            sql2.append(" order by :sortColumns ");
        }
		
		return pageQuery(sql,query);
	}
	
	public TbUserInfo getByUserName(java.lang.String v) {
		String sql = "select " + getSqlGenerator().getColumnsSql("t") + " from tb_user_info t where user_name='"+v+"'";
		return (TbUserInfo)DataAccessUtils.singleResult(getSimpleJdbcTemplate().query(sql, ParameterizedBeanPropertyRowMapper.newInstance(TbUserInfo.class)));
	}

}
