/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2012
 */

package com.maintenance.demo.dao;

import static cn.org.rapid_framework.util.ObjectUtils.isNotEmpty;

import java.util.List;

import javacommon.base.BaseSpringJdbcDao;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import cn.org.rapid_framework.page.Page;

import com.maintenance.demo.model.TbIncomingTasks;
import com.maintenance.demo.vo.query.TbIncomingTasksQuery;

/**
 * @author badqiu email:badqiu(a)gmail.com
 * @version 1.0
 * @since 1.0
 */

@Repository
public class TbIncomingTasksDao extends BaseSpringJdbcDao<TbIncomingTasks,java.lang.Integer> {
	
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
			  	+ "/~ and t.completionApproval = {completionApproval} ~/"
			  	+ "/~ and t.reasonsSuspicion = {reasonsSuspicion} ~/"
			  	+ "/~ and t.verified = {verified} ~/"
			  	+ "/~ and t.instructions = {instructions} ~/"
			  	+ "/~ and t.report = {report} ~/"
			  	+ "/~ and t.create_by = {createBy} ~/"
			  	+ "/~ and t.rank = {rank} ~/"
			  	+ "/~ and t.signature = {signature} ~/"
			  	+ "/~ and t.remark2 = {remark2} ~/"
			  	+ "/~ and t.remark = {remark} ~/"
			  	+ "/~ and t.link = {link} ~/"
			  	+ "/~ and t.approved = {approved} ~/"
			  	+ "/~ and t.percentage = {percentage} ~/"
			  	+ "/~ and t.sign_to = {signTo} ~/"
			  	+ "/~ and t.job_id = {jobId} ~/"
			  	+ "/~ and t.remark3 = {remark3} ~/"
			  	+ "/~ and t.remark4 = {remark4} ~/"
			  	+ "/~ and t.process_time = {processTime} ~/"
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
		if(isNotEmpty(query.getCompletionApproval())) {
            sql2.append(" and t.completionApproval = :completionApproval ");
        }
		if(isNotEmpty(query.getReasonsSuspicion())) {
            sql2.append(" and t.reasonsSuspicion = :reasonsSuspicion ");
        }
		if(isNotEmpty(query.getVerified())) {
            sql2.append(" and t.verified = :verified ");
        }
		if(isNotEmpty(query.getInstructions())) {
            sql2.append(" and t.instructions = :instructions ");
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
		if(isNotEmpty(query.getPercentage())) {
            sql2.append(" and t.percentage = :percentage ");
        }
		if(isNotEmpty(query.getSignTo())) {
            sql2.append(" and t.sign_to = :signTo ");
        }
		if(isNotEmpty(query.getJobId())) {
            sql2.append(" and t.job_id = :jobId ");
        }
		if(isNotEmpty(query.getRemark3())) {
            sql2.append(" and t.remark3 = :remark3 ");
        }
		if(isNotEmpty(query.getRemark4())) {
            sql2.append(" and t.remark4 = :remark4 ");
        }
		if(isNotEmpty(query.getProcessTime())) {
            sql2.append(" and t.process_time = :processTime ");
        }
		if(isNotEmpty(query.getSortColumns())) {
            sql2.append(" order by :sortColumns ");
        }
		
		return pageQuery(sql,query);
	}

}