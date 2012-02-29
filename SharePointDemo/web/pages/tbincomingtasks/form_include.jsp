<%@page import="com.sharepoint.demo.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<input type="hidden" id="id" name="id" value="${tbIncomingTasks.id}"/>

	<tr>	
		<td class="tdLabel">
			<fmt:message key="ALIAS_ACTION"/>:
		</td>		
		<td>
		<form:input path="action" id="action" cssClass="" maxlength="100" />
		<font color='red'><form:errors path="action"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<fmt:message key="ALIAS_PLANNED_DATE"/>:
		</td>		
		<td>
		<input value="${tbIncomingTasks.plannedDateString}" onclick="WdatePicker({dateFmt:'<%=TbIncomingTasks.FORMAT_PLANNED_DATE%>'})" id="plannedDateString" name="plannedDateString"  maxlength="0" class="" />
		<font color='red'><form:errors path="plannedDate"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<fmt:message key="ALIAS_ASSIGNED_DATE"/>:
		</td>		
		<td>
		<input value="${tbIncomingTasks.assignedDateString}" onclick="WdatePicker({dateFmt:'<%=TbIncomingTasks.FORMAT_ASSIGNED_DATE%>'})" id="assignedDateString" name="assignedDateString"  maxlength="0" class="" />
		<font color='red'><form:errors path="assignedDate"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<fmt:message key="ALIAS_STATUS"/>:
		</td>		
		<td>
		<form:input path="status" id="status" cssClass="validate-number" maxlength="12" />
		<font color='red'><form:errors path="status"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<fmt:message key="ALIAS_STATUS_REPORT"/>:
		</td>		
		<td>
		<form:textarea path="statusReport" id="statusReport" cssClass="" maxlength="500" />
		<font color='red'><form:errors path="statusReport"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<fmt:message key="ALIAS_COMPLETION_APPROVAL"/>:
		</td>		
		<td>
		<form:input path="completionApproval" id="completionApproval" cssClass="" maxlength="45" />
		<font color='red'><form:errors path="completionApproval"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<fmt:message key="ALIAS_REASONS_SUSPICION"/>:
		</td>		
		<td>
		<form:textarea path="reasonsSuspicion" id="reasonsSuspicion" cssClass="" maxlength="2000" />
		<font color='red'><form:errors path="reasonsSuspicion"/></font>
		</td>
	</tr>	
	
		