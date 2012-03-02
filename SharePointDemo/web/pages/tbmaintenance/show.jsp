<%@page import="com.sharepoint.demo.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><fmt:message key="TABLE_MAINTENANCE"/> <fmt:message key="Information"/></title>
</rapid:override>

<rapid:override name="content">
	<form:form modelAttribute="tbmaintenance"  >
		<input type="button" value="<fmt:message key="Back_to_list"/>" onclick="window.location='${ctx}/tbmaintenance'"/>
		<input type="button" value="<fmt:message key="Back"/>" onclick="history.back();"/>
		
		<input type="hidden" id="id" name="id" value="${tbMaintenance.id}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><fmt:message key="ALIAS_TYPE"/></td>	
				<td>
					<c:set value='${tbMaintenance.type}' var='key'></c:set>
					<c:out value="${type[key]}" />&nbsp;
				</td>
			</tr>
			<tr>	
				<td class="tdLabel"><fmt:message key="ALIAS_TITLE"/></td>	
				<td><c:out value='${tbMaintenance.title}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><fmt:message key="ALIAS_DESCRIPTIONS"/></td>	
				<td><c:out value='${tbMaintenance.descriptions}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><fmt:message key="ALIAS_LOCATION"/></td>	
				<td><c:out value='${tbMaintenance.location}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><fmt:message key="ALIAS_LINK"/></td>	
				<td><c:out value='${tbMaintenance.link}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><fmt:message key="ALIAS_INFORMATION"/></td>	
				<td><c:out value='${tbMaintenance.information}'/></td>
			</tr>
		</table>
	</form:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>