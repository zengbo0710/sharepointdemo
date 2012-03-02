<%@page import="com.sharepoint.demo.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<input type="hidden" id="id" name="id" value="${tbMaintenance.id}"/>

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
		<form:input path="title" id="title" cssClass="" maxlength="200" />
		<font color='red'><form:errors path="title"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<fmt:message key="ALIAS_DESCRIPTIONS"/>:
		</td>		
		<td>
		<form:input path="descriptions" id="descriptions" cssClass="" maxlength="1000" />
		<font color='red'><form:errors path="descriptions"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<fmt:message key="ALIAS_LOCATION"/>:
		</td>		
		<td>
		<form:input path="location" id="location" cssClass="" maxlength="500" />
		<font color='red'><form:errors path="location"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<fmt:message key="ALIAS_LINK"/>:
		</td>		
		<td>
		<form:input path="link" id="link" cssClass="" maxlength="500" />
		<font color='red'><form:errors path="link"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<fmt:message key="ALIAS_INFORMATION"/>:
		</td>		
		<td>
		<form:input path="information" id="information" cssClass="" maxlength="1000" />
		<font color='red'><form:errors path="information"/></font>
		</td>
	</tr>	
	
		