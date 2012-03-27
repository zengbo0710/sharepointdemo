/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2012
 */

package com.maintenance.demo.dao;

import java.io.Serializable;
import java.util.List;

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
public class TbIncomingTasksDao extends BaseSpringJdbcDao<TbIncomingTasks,java.lang.Integer>{
	
	//注意: getSqlGenerator()可以生成基本的：增删改查sql语句, 通过这个父类已经封装了增删改查操作
    // sqlgenerator参考: http://code.google.com/p/rapid-framework/wiki/rapid_sqlgenerator
    
	public Class getEntityClass() {
		return TbIncomingTasks.class;
	}
	
	public void save(TbIncomingTasks entity) {
		String sql = getSqlGenerator().getInsertSql();
		insertWithIdentity(entity,sql); //for sqlserver and mysql
		
		//其它主键生成策略
		//insertWithOracleSequence(entity,"sequenceName",sql); //oracle sequence: 
		//insertWithDB2Sequence(entity,"sequenceName",sql); //db2 sequence:
		//insertWithUUID(entity,sql); //uuid
		//insertWithAssigned(entity,sql); //手工分配
	}
	
	public Page findPage(TbIncomingTasksQuery query) {
		//XsqlBuilder syntax,please see http://code.google.com/p/rapid-xsqlbuilder
		// [column]为字符串拼接, {column}为使用占位符. 如username='[username]',偷懒时可以使用字符串拼接 
		// [column] 为PageRequest的属性
		String sql = "select "+ getSqlGenerator().getColumnsSql("t") + " from tb_incoming_tasks t where 1=1 "
			  	+ "/~ and t.action = {action} ~/"
				+ "/~ and t.planned_date >= {plannedDateBegin} ~/"
				+ "/~ and t.planned_date <= {plannedDateEnd} ~/"
				+ "/~ and t.assigned_date >= {assignedDateBegin} ~/"
				+ "/~ and t.assigned_date <= {assignedDateEnd} ~/"
			  	+ "/~ and t.status = {status} ~/"
			  	+ "/~ and t.status_report = {statusReport} ~/"
			  	+ "/~ and t.completion_approval = {completionApproval} ~/"
			  	+ "/~ and t.reasons_suspicion = {reasonsSuspicion} ~/"
			  	+ "/~ and t.verified = {verified} ~/"
			  	+ "/~ and t.Instructions = {instructions} ~/"
			  	+ "/~ and t.report = {report} ~/"
			  	+ "/~ and t.create_by = {createBy} ~/"
			  	+ "/~ and t.rank = {rank} ~/"
			  	+ "/~ and t.signature = {signature} ~/"
			  	+ "/~ and t.remark2 = {remark2} ~/"
			  	+ "/~ and t.remark = {remark} ~/"
			  	+ "/~ and t.link = {link} ~/"
			  	+ "/~ and t.approved = {approved} ~/"
				+ "/~ order by [sortColumns] ~/";
		
		//生成sql2的原因是为了不喜欢使用xsqlbuilder的同学，请修改生成器模板，删除本段的生成
		StringBuilder sql2 = new StringBuilder("select "+ getSqlGenerator().getColumnsSql("t") + " from tb_incoming_tasks t where 1=1 ");
		if(isNotEmpty(query.getId())) {
            sql2.append(" and t.id = :id ");
        }
		if(isNotEmpty(query.getAction())) {
            sql2.append(" and t.action = :action ");
        }
		if(isNotEmpty(query.getPlannedDateBegin())) {
		    sql2.append(" and t.planned_date >= :plannedDateBegin ");
		}
		if(isNotEmpty(query.getPlannedDateEnd())) {
            sql2.append(" and t.planned_date <= :plannedDateEnd ");
        }
		if(isNotEmpty(query.getAssignedDateBegin())) {
		    sql2.append(" and t.assigned_date >= :assignedDateBegin ");
		}
		if(isNotEmpty(query.getAssignedDateEnd())) {
            sql2.append(" and t.assigned_date <= :assignedDateEnd ");
        }
		if(isNotEmpty(query.getStatus())) {
            sql2.append(" and t.status = :status ");
        }
		if(isNotEmpty(query.getStatusReport())) {
            sql2.append(" and t.status_report = :statusReport ");
        }
		if(isNotEmpty(query.getCompletionApproval())) {
            sql2.append(" and t.completion_approval = :completionApproval ");
        }
		if(isNotEmpty(query.getReasonsSuspicion())) {
            sql2.append(" and t.reasons_suspicion = :reasonsSuspicion ");
        }
		if(isNotEmpty(query.getVerified())) {
            sql2.append(" and t.verified = :verified ");
        }
		if(isNotEmpty(query.getInstructions())) {
            sql2.append(" and t.Instructions = :instructions ");
        }
		if(isNotEmpty(query.getReport())) {
            sql2.append(" and t.report = :report ");
        }
		if(isNotEmpty(query.getCreateBy())) {
            sql2.append(" and t.create_by = :createBy ");
        }
		if(isNotEmpty(query.getRank())) {
            sql2.append(" and t.rank = :rank ");
        }
		if(isNotEmpty(query.getSignature())) {
            sql2.append(" and t.signature = :signature ");
        }
		if(isNotEmpty(query.getRemark2())) {
            sql2.append(" and t.remark2 = :remark2 ");
        }
		if(isNotEmpty(query.getRemark())) {
            sql2.append(" and t.remark = :remark ");
        }
		if(isNotEmpty(query.getLink())) {
            sql2.append(" and t.link = :link ");
        }
		if(isNotEmpty(query.getApproved())) {
            sql2.append(" and t.approved = :approved ");
        }
		if(isNotEmpty(query.getSortColumns())) {
            sql2.append(" order by :sortColumns ");
        }
		
		return pageQuery(sql,query);
	}
	

}
