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


public class TbMasterQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** it */
	private java.lang.Integer id;
	/** createdBy */
	private java.lang.String createdBy;
	/** modifiedBy */
	private java.lang.String modifiedBy;
	/** version */
	private java.lang.String version;
	/** type */
	private java.lang.Integer type;

	public java.lang.Integer getId() {
		return this.id;
	}
	
	public void setIt(java.lang.Integer value) {
		this.id = value;
	}
	
	public java.lang.String getCreatedBy() {
		return this.createdBy;
	}
	
	public void setCreatedBy(java.lang.String value) {
		this.createdBy = value;
	}
	
	public java.lang.String getModifiedBy() {
		return this.modifiedBy;
	}
	
	public void setModifiedBy(java.lang.String value) {
		this.modifiedBy = value;
	}
	
	public java.lang.String getVersion() {
		return this.version;
	}
	
	public void setVersion(java.lang.String value) {
		this.version = value;
	}
	
	public java.lang.Integer getType() {
		return this.type;
	}
	
	public void setType(java.lang.Integer value) {
		this.type = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

