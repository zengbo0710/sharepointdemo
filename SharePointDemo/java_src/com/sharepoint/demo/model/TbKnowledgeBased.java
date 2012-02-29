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


public class TbKnowledgeBased extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "TbKnowledgeBased";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_TYPE = "type";
	public static final String ALIAS_TITLE = "title";
	public static final String ALIAS_DESCRIPTION = "description";
	public static final String ALIAS_LOCATION = "location";
	public static final String ALIAS_SOLUTIONS = "solutions";
	public static final String ALIAS_SOLUTIONS_DOC = "solutionsDoc";
	
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
     * title       db_column: title 
     */ 	
	@Length(max=300)
	private java.lang.String title;
    /**
     * description       db_column: description 
     */ 	
	@Length(max=2000)
	private java.lang.String description;
    /**
     * location       db_column: location 
     */ 	
	@Length(max=200)
	private java.lang.String location;
    /**
     * solutions       db_column: solutions 
     */ 	
	@Length(max=2000)
	private java.lang.String solutions;
    /**
     * solutionsDoc       db_column: solutions_doc 
     */ 	
	@Length(max=200)
	private java.lang.String solutionsDoc;
	//columns END
	
	//注意： spring_jdbc的MetadataCreateUtils.fromTable(Entity.class) 可以读取JPA annotation的标注信息
	//现支持 @Id,@Column,@Table标注

	public TbKnowledgeBased(){
	}

	public TbKnowledgeBased(
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
	
	public java.lang.String getDescription() {
		return this.description;
	}
	
	public void setDescription(java.lang.String value) {
		this.description = value;
	}
	
	public java.lang.String getLocation() {
		return this.location;
	}
	
	public void setLocation(java.lang.String value) {
		this.location = value;
	}
	
	public java.lang.String getSolutions() {
		return this.solutions;
	}
	
	public void setSolutions(java.lang.String value) {
		this.solutions = value;
	}
	
	public java.lang.String getSolutionsDoc() {
		return this.solutionsDoc;
	}
	
	public void setSolutionsDoc(java.lang.String value) {
		this.solutionsDoc = value;
	}
	

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("Type",getType())
			.append("Title",getTitle())
			.append("Description",getDescription())
			.append("Location",getLocation())
			.append("Solutions",getSolutions())
			.append("SolutionsDoc",getSolutionsDoc())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof TbKnowledgeBased == false) return false;
		if(this == obj) return true;
		TbKnowledgeBased other = (TbKnowledgeBased)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

