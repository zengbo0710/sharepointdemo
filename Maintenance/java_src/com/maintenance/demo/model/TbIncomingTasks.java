/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2012
 */

package com.maintenance.demo.model;

import javax.validation.constraints.*;
import org.hibernate.validator.constraints.*;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import javax.persistence.*;

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


public class TbIncomingTasks extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "TbIncomingTasks";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_ACTION = "action";
	public static final String ALIAS_PLANNED_DATE = "plannedDate";
	public static final String ALIAS_ASSIGNED_DATE = "assignedDate";
	public static final String ALIAS_STATUS = "status";
	public static final String ALIAS_STATUS_REPORT = "statusReport";
	public static final String ALIAS_COMPLETION_APPROVAL = "completionApproval";
	public static final String ALIAS_REASONS_SUSPICION = "reasonsSuspicion";
	public static final String ALIAS_VERIFIED = "verified";
	public static final String ALIAS_INSTRUCTIONS = "instructions";
	public static final String ALIAS_REPORT = "report";
	public static final String ALIAS_CREATE_BY = "createBy";
	public static final String ALIAS_RANK = "rank";
	public static final String ALIAS_SIGNATURE = "signature";
	public static final String ALIAS_REMARK2 = "remark2";
	public static final String ALIAS_REMARK = "remark";
	public static final String ALIAS_LINK = "link";
	public static final String ALIAS_APPROVED = "approved";
	
	//date formats
	public static final String FORMAT_PLANNED_DATE = DATE_FORMAT;
	public static final String FORMAT_ASSIGNED_DATE = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * id       db_column: id 
     */ 	
	
	private java.lang.Integer id;
    /**
     * action       db_column: action 
     */ 	
	@Length(max=100)
	private java.lang.String action;
    /**
     * plannedDate       db_column: planned_date 
     */ 	
	
	private java.util.Date plannedDate;
    /**
     * assignedDate       db_column: assigned_date 
     */ 	
	
	private java.util.Date assignedDate;
    /**
     * status       db_column: status 
     */ 	
	
	private java.lang.Integer status;
    /**
     * statusReport       db_column: status_report 
     */ 	
	@Length(max=500)
	private java.lang.String statusReport;
    /**
     * completionApproval       db_column: completion_approval 
     */ 	
	@Length(max=45)
	private java.lang.String completionApproval;
    /**
     * reasonsSuspicion       db_column: reasons_suspicion 
     */ 	
	@Length(max=2000)
	private java.lang.String reasonsSuspicion;
    /**
     * verified       db_column: verified 
     */ 	
	
	private java.lang.Integer verified;
    /**
     * instructions       db_column: Instructions 
     */ 	
	@Length(max=2000)
	private java.lang.String instructions;
    /**
     * report       db_column: report 
     */ 	
	@Length(max=2000)
	private java.lang.String report;
    /**
     * createBy       db_column: create_by 
     */ 	
	
	private java.lang.Integer createBy;
    /**
     * rank       db_column: rank 
     */ 	
	
	private java.lang.Integer rank;
    /**
     * signature       db_column: signature 
     */ 	
	@Length(max=200)
	private java.lang.String signature;
    /**
     * remark2       db_column: remark2 
     */ 	
	@Length(max=2000)
	private java.lang.String remark2;
    /**
     * remark       db_column: remark 
     */ 	
	@Length(max=2000)
	private java.lang.String remark;
    /**
     * link       db_column: link 
     */ 	
	@Length(max=200)
	private java.lang.String link;
    /**
     * approved       db_column: approved 
     */ 	
	
	private java.lang.Integer approved;
	//columns END
	
	//注意： spring_jdbc的MetadataCreateUtils.fromTable(Entity.class) 可以读取JPA annotation的标注信息
	//现支持 @Id,@Column,@Table标注

	public TbIncomingTasks(){
	}

	public TbIncomingTasks(
		java.lang.Integer id
	){
		this.id = id;
	}

	@Id
	public java.lang.Integer getId() {
		return this.id;
	}
	
	public void setId(java.lang.Integer value) {
		this.id = value;
	}
	
	public java.lang.String getAction() {
		return this.action;
	}
	
	public void setAction(java.lang.String value) {
		this.action = value;
	}
	
	@Transient
	public String getPlannedDateString() {
		return DateConvertUtils.format(getPlannedDate(), FORMAT_PLANNED_DATE);
	}
	public void setPlannedDateString(String value) {
		setPlannedDate(DateConvertUtils.parse(value, FORMAT_PLANNED_DATE,java.util.Date.class));
	}
	
	public java.util.Date getPlannedDate() {
		return this.plannedDate;
	}
	
	public void setPlannedDate(java.util.Date value) {
		this.plannedDate = value;
	}
	
	@Transient
	public String getAssignedDateString() {
		return DateConvertUtils.format(getAssignedDate(), FORMAT_ASSIGNED_DATE);
	}
	public void setAssignedDateString(String value) {
		setAssignedDate(DateConvertUtils.parse(value, FORMAT_ASSIGNED_DATE,java.util.Date.class));
	}
	
	public java.util.Date getAssignedDate() {
		return this.assignedDate;
	}
	
	public void setAssignedDate(java.util.Date value) {
		this.assignedDate = value;
	}
	
	public java.lang.Integer getStatus() {
		return this.status;
	}
	
	public void setStatus(java.lang.Integer value) {
		this.status = value;
	}
	
	public java.lang.String getStatusReport() {
		return this.statusReport;
	}
	
	public void setStatusReport(java.lang.String value) {
		this.statusReport = value;
	}
	
	public java.lang.String getCompletionApproval() {
		return this.completionApproval;
	}
	
	public void setCompletionApproval(java.lang.String value) {
		this.completionApproval = value;
	}
	
	public java.lang.String getReasonsSuspicion() {
		return this.reasonsSuspicion;
	}
	
	public void setReasonsSuspicion(java.lang.String value) {
		this.reasonsSuspicion = value;
	}
	
	public java.lang.Integer getVerified() {
		return this.verified;
	}
	
	public void setVerified(java.lang.Integer value) {
		this.verified = value;
	}
	
	public java.lang.String getInstructions() {
		return this.instructions;
	}
	
	public void setInstructions(java.lang.String value) {
		this.instructions = value;
	}
	
	public java.lang.String getReport() {
		return this.report;
	}
	
	public void setReport(java.lang.String value) {
		this.report = value;
	}
	
	public java.lang.Integer getCreateBy() {
		return this.createBy;
	}
	
	public void setCreateBy(java.lang.Integer value) {
		this.createBy = value;
	}
	
	public java.lang.Integer getRank() {
		return this.rank;
	}
	
	public void setRank(java.lang.Integer value) {
		this.rank = value;
	}
	
	public java.lang.String getSignature() {
		return this.signature;
	}
	
	public void setSignature(java.lang.String value) {
		this.signature = value;
	}
	
	public java.lang.String getRemark2() {
		return this.remark2;
	}
	
	public void setRemark2(java.lang.String value) {
		this.remark2 = value;
	}
	
	public java.lang.String getRemark() {
		return this.remark;
	}
	
	public void setRemark(java.lang.String value) {
		this.remark = value;
	}
	
	public java.lang.String getLink() {
		return this.link;
	}
	
	public void setLink(java.lang.String value) {
		this.link = value;
	}
	
	public java.lang.Integer getApproved() {
		return this.approved;
	}
	
	public void setApproved(java.lang.Integer value) {
		this.approved = value;
	}
	

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("Action",getAction())
			.append("PlannedDate",getPlannedDate())
			.append("AssignedDate",getAssignedDate())
			.append("Status",getStatus())
			.append("StatusReport",getStatusReport())
			.append("CompletionApproval",getCompletionApproval())
			.append("ReasonsSuspicion",getReasonsSuspicion())
			.append("Verified",getVerified())
			.append("Instructions",getInstructions())
			.append("Report",getReport())
			.append("CreateBy",getCreateBy())
			.append("Rank",getRank())
			.append("Signature",getSignature())
			.append("Remark2",getRemark2())
			.append("Remark",getRemark())
			.append("Link",getLink())
			.append("Approved",getApproved())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof TbIncomingTasks == false) return false;
		if(this == obj) return true;
		TbIncomingTasks other = (TbIncomingTasks)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

