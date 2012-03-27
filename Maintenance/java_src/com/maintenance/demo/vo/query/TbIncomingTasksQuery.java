/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2012
 */

package com.maintenance.demo.vo.query;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import java.io.Serializable;

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


public class TbIncomingTasksQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** id */
	private java.lang.Integer id;
	/** action */
	private java.lang.String action;
	/** plannedDate */
	private java.util.Date plannedDateBegin;
	private java.util.Date plannedDateEnd;
	/** assignedDate */
	private java.util.Date assignedDateBegin;
	private java.util.Date assignedDateEnd;
	/** status */
	private java.lang.Integer status;
	/** statusReport */
	private java.lang.String statusReport;
	/** completionApproval */
	private java.lang.String completionApproval;
	/** reasonsSuspicion */
	private java.lang.String reasonsSuspicion;
	/** verified */
	private java.lang.Integer verified;
	/** instructions */
	private java.lang.String instructions;
	/** report */
	private java.lang.String report;
	/** createBy */
	private java.lang.Integer createBy;
	/** rank */
	private java.lang.Integer rank;
	/** signature */
	private java.lang.String signature;
	/** remark2 */
	private java.lang.String remark2;
	/** remark */
	private java.lang.String remark;
	/** link */
	private java.lang.String link;
	/** approved */
	private java.lang.Integer approved;

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
	
	public java.util.Date getPlannedDateBegin() {
		return this.plannedDateBegin;
	}
	
	public void setPlannedDateBegin(java.util.Date value) {
		this.plannedDateBegin = value;
	}	
	
	public java.util.Date getPlannedDateEnd() {
		return this.plannedDateEnd;
	}
	
	public void setPlannedDateEnd(java.util.Date value) {
		this.plannedDateEnd = value;
	}
	
	public java.util.Date getAssignedDateBegin() {
		return this.assignedDateBegin;
	}
	
	public void setAssignedDateBegin(java.util.Date value) {
		this.assignedDateBegin = value;
	}	
	
	public java.util.Date getAssignedDateEnd() {
		return this.assignedDateEnd;
	}
	
	public void setAssignedDateEnd(java.util.Date value) {
		this.assignedDateEnd = value;
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
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

