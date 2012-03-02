<%@page import="com.sharepoint.demo.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><fmt:message key="TABLE_INCOMING_TASKS"/>  <fmt:message key="Information"/></title>
</rapid:override>

<rapid:override name="content">
	<form:form modelAttribute="tbincomingtasks"  >
		<input type="button" value="Back to list" onclick="window.location='${ctx}/tbincomingtasks'"/>
		<input type="button" value="Back" onclick="history.back();"/>
		
		<input type="hidden" id="id" name="id" value="${tbIncomingTasks.id}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><fmt:message key="ALIAS_ACTION" /> </td>	
				<td><c:out value='${tbIncomingTasks.action}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><fmt:message key="ALIAS_PLANNED_DATE" /></td>	
				<td><c:out value='${tbIncomingTasks.plannedDateString}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><fmt:message key="ALIAS_ASSIGNED_DATE" /></td>	
				<td><c:out value='${tbIncomingTasks.assignedDateString}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><fmt:message key="ALIAS_STATUS" /></td>	
				<td>
					 <c:set value="${tbIncomingTasks.status}" var="key">  </c:set>
					 <c:out value="${status[key]}" />
				</td>
			</tr>
			<tr>	
				<td class="tdLabel"><fmt:message key="ALIAS_STATUS_REPORT" /></td>	
				<td><c:out value='${tbIncomingTasks.statusReport}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><fmt:message key="ALIAS_COMPLETION_APPROVAL" /></td>	
				<td><c:out value='${tbIncomingTasks.completionApproval}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><fmt:message key="ALIAS_REASONS_SUSPICION" /></td>	
				<td><c:out value='${tbIncomingTasks.reasonsSuspicion}'/></td>
			</tr>
		</table>
	</form:form>
</rapid:override>

<%@ include file="base.jsp" %>