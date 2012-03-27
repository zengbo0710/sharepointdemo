<%@page import="com.maintenance.demo.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=TbIncomingTasks.TABLE_ALIAS%><fmt:message key="Information"/></title>
</rapid:override>

<rapid:override name="content">
	<form:form modelAttribute="tbincomingtasks"  >
		<input type="button" value="<fmt:message key="Back_to_list"/>" onclick="window.location='${ctx}/tbincomingtasks'"/>
		<input type="button" value="<fmt:message key="Back"/>" onclick="history.back();"/>
		
		<input type="hidden" id="id" name="id" value="${tbIncomingTasks.id}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=TbIncomingTasks.ALIAS_ACTION%></td>	
				<td><c:out value='${tbIncomingTasks.action}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=TbIncomingTasks.ALIAS_PLANNED_DATE%></td>	
				<td><c:out value='${tbIncomingTasks.plannedDateString}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=TbIncomingTasks.ALIAS_ASSIGNED_DATE%></td>	
				<td><c:out value='${tbIncomingTasks.assignedDateString}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=TbIncomingTasks.ALIAS_STATUS%></td>	
				<td><c:out value='${tbIncomingTasks.status}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=TbIncomingTasks.ALIAS_STATUS_REPORT%></td>	
				<td><c:out value='${tbIncomingTasks.statusReport}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=TbIncomingTasks.ALIAS_COMPLETION_APPROVAL%></td>	
				<td><c:out value='${tbIncomingTasks.completionApproval}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=TbIncomingTasks.ALIAS_REASONS_SUSPICION%></td>	
				<td><c:out value='${tbIncomingTasks.reasonsSuspicion}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=TbIncomingTasks.ALIAS_VERIFIED%></td>	
				<td><c:out value='${tbIncomingTasks.verified}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=TbIncomingTasks.ALIAS_INSTRUCTIONS%></td>	
				<td><c:out value='${tbIncomingTasks.instructions}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=TbIncomingTasks.ALIAS_REPORT%></td>	
				<td><c:out value='${tbIncomingTasks.report}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=TbIncomingTasks.ALIAS_CREATE_BY%></td>	
				<td><c:out value='${tbIncomingTasks.createBy}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=TbIncomingTasks.ALIAS_RANK%></td>	
				<td><c:out value='${tbIncomingTasks.rank}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=TbIncomingTasks.ALIAS_SIGNATURE%></td>	
				<td><c:out value='${tbIncomingTasks.signature}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=TbIncomingTasks.ALIAS_REMARK2%></td>	
				<td><c:out value='${tbIncomingTasks.remark2}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=TbIncomingTasks.ALIAS_REMARK%></td>	
				<td><c:out value='${tbIncomingTasks.remark}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=TbIncomingTasks.ALIAS_LINK%></td>	
				<td><c:out value='${tbIncomingTasks.link}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=TbIncomingTasks.ALIAS_APPROVED%></td>	
				<td><c:out value='${tbIncomingTasks.approved}'/></td>
			</tr>
		</table>
	</form:form>
</rapid:override>

<%@ include file="base.jsp" %>