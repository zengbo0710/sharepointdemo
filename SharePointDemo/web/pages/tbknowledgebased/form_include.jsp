<%@page import="com.sharepoint.demo.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<input type="hidden" id="id" name="id" value="${tbKnowledgeBased.id}"/>

	<tr>	
		<td class="tdLabel">
			<fmt:message key="ALIAS_TYPE"/>:
		</td>		
		<td>
		<form:select path="type" id="type" cssClass="validate-number">
			<form:option value="" label="-- please select --"></form:option>
			<form:options items="${type}"/>
		</form:select>
		<font color='red'><form:errors path="type"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<fmt:message key="ALIAS_TITLE"/>:
		</td>		
		<td>
		<form:input path="title" id="title" cssClass="" maxlength="300" />
		<font color='red'><form:errors path="title"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<fmt:message key="ALIAS_DESCRIPTIONS"/>:
		</td>		
		<td>
		<form:textarea path="description" id="description" cssClass="" maxlength="2000" />
		<font color='red'><form:errors path="description"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<fmt:message key="ALIAS_LOCATION"/>:
		</td>		
		<td>
		<form:input path="location" id="location" cssClass="" maxlength="200" />
		<font color='red'><form:errors path="location"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<fmt:message key="ALIAS_SOLUTIONS"/>:
		</td>		
		<td>
		<form:textarea path="solutions" id="solutions" cssClass="" maxlength="2000" />
		<font color='red'><form:errors path="solutions"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<fmt:message key="ALIAS_SOLUTIONS_DOC"/>:
		</td>		
		<td>
		<form:input path="solutionsDoc" id="solutionsDoc" cssClass="" maxlength="200" />
		<font color='red'><form:errors path="solutionsDoc"/></font>
		</td>
	</tr>	
	
		