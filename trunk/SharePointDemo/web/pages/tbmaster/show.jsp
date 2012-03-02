<%@page import="com.sharepoint.demo.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><fmt:message key="TABLE_MASTER"/> <fmt:message key="Information"/></title>
</rapid:override>

<rapid:override name="content">
	<form:form modelAttribute="tbmaster"  >
		<input type="button" value="<fmt:message key="Back_to_list"/>" onclick="window.location='${ctx}/tbmaster'"/>
		<input type="button" value="<fmt:message key="Back"/>" onclick="history.back();"/>
		
		<input type="hidden" id="it" name="it" value="${tbMaster.id}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><fmt:message key="ALIAS_CREATED_BY"/></td>	
				<td><c:out value='${tbMaster.createdBy}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><fmt:message key="ALIAS_MODIFIED_BY"/></td>	
				<td><c:out value='${tbMaster.modifiedBy}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><fmt:message key="ALIAS_VERSION"/></td>	
				<td><c:out value='${tbMaster.version}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><fmt:message key="ALIAS_TYPE"/></td>	
				<td><c:out value='${tbMaster.type}'/></td>
			</tr>
		</table>
	</form:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>