<%@page import="com.sharepoint.demo.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<input type="hidden" id="id" name="id" value="${tbMaster.id}"/>

	<tr>	
		<td class="tdLabel">
			<fmt:message key="ALIAS_CREATED_BY"/>:
		</td>		
		<td>
		<form:input path="createdBy" id="createdBy" cssClass="" maxlength="100" />
		<font color='red'><form:errors path="createdBy"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<fmt:message key="ALIAS_MODIFIED_BY"/>:
		</td>		
		<td>
		<form:input path="modifiedBy" id="modifiedBy" cssClass="" maxlength="100" />
		<font color='red'><form:errors path="modifiedBy"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<fmt:message key="ALIAS_VERSION"/>:
		</td>		
		<td>
		<form:input path="version" id="version" cssClass="" maxlength="100" />
		<font color='red'><form:errors path="version"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<fmt:message key="ALIAS_TYPE"/>:
		</td>		
		<td>
		<form:input path="type" id="type" cssClass="validate-integer max-value-2147483647" maxlength="10" />
		<font color='red'><form:errors path="type"/></font>
		</td>
	</tr>	
	
		