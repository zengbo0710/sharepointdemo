/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2012
 */

package com.sharepoint.demo.vo.query;

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

import com.sharepoint.demo.model.*;
import com.sharepoint.demo.dao.*;
import com.sharepoint.demo.service.*;
import com.sharepoint.demo.vo.query.*;

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
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

