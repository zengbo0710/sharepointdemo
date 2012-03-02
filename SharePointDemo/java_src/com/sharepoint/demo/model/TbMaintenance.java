/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2012
 */

package com.sharepoint.demo.model;

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

import com.sharepoint.demo.model.*;
import com.sharepoint.demo.dao.*;
import com.sharepoint.demo.service.*;
import com.sharepoint.demo.vo.query.*;

/**
 * @author badqiu email:badqiu(a)gmail.com
 * @version 1.0
 * @since 1.0
 */


public class TbMaintenance extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "TbMaintenance";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_TYPE = "type";
	public static final String ALIAS_TITLE = "title";
	public static final String ALIAS_DESCRIPTIONS = "descriptions";
	public static final String ALIAS_LOCATION = "location";
	public static final String ALIAS_LINK = "link";
	public static final String ALIAS_INFORMATION = "information";
	
	//date formats
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * id       db_column: id 
     */ 	
	
	private java.lang.Integer id;
    /**
     * type       db_column: type 
     */ 	
	
	private java.lang.Integer type;
    /**
     * title       db_column: Title 
     */ 	
	@Length(max=200)
	private java.lang.String title;
    /**
     * descriptions       db_column: Descriptions 
     */ 	
	@Length(max=1000)
	private java.lang.String descriptions;
    /**
     * location       db_column: Location 
     */ 	
	@Length(max=500)
	private java.lang.String location;
    /**
     * link       db_column: Link 
     */ 	
	@Length(max=500)
	private java.lang.String link;
    /**
     * information       db_column: Information 
     */ 	
	@Length(max=1000)
	private java.lang.String information;
	//columns END
	
	//注意： spring_jdbc的MetadataCreateUtils.fromTable(Entity.class) 可以读取JPA annotation的标注信息
	//现支持 @Id,@Column,@Table标注

	public TbMaintenance(){
	}

	public TbMaintenance(
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
	
	public java.lang.Integer getType() {
		return this.type;
	}
	
	public void setType(java.lang.Integer value) {
		this.type = value;
	}
	
	public java.lang.String getTitle() {
		return this.title;
	}
	
	public void setTitle(java.lang.String value) {
		this.title = value;
	}
	
	public java.lang.String getDescriptions() {
		return this.descriptions;
	}
	
	public void setDescriptions(java.lang.String value) {
		this.descriptions = value;
	}
	
	public java.lang.String getLocation() {
		return this.location;
	}
	
	public void setLocation(java.lang.String value) {
		this.location = value;
	}
	
	public java.lang.String getLink() {
		return this.link;
	}
	
	public void setLink(java.lang.String value) {
		this.link = value;
	}
	
	public java.lang.String getInformation() {
		return this.information;
	}
	
	public void setInformation(java.lang.String value) {
		this.information = value;
	}
	

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("Type",getType())
			.append("Title",getTitle())
			.append("Descriptions",getDescriptions())
			.append("Location",getLocation())
			.append("Link",getLink())
			.append("Information",getInformation())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof TbMaintenance == false) return false;
		if(this == obj) return true;
		TbMaintenance other = (TbMaintenance)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

