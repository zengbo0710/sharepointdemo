<%@page import="com.maintenance.demo.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<input type="hidden" id="id" name="id" value="${tbIncomingTasks.id}"/>

	<tr>	
		<td class="tdLabel">
			<%=TbIncomingTasks.ALIAS_ACTION%>:
		</td>		
		<td>
		<form:input path="action" id="action" cssClass="" maxlength="100" />
		<font color='red'><form:errors path="action"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=TbIncomingTasks.ALIAS_PLANNED_DATE%>:
		</td>		
		<td>
		<input value="${tbIncomingTasks.plannedDateString}" onclick="WdatePicker({dateFmt:'<%=TbIncomingTasks.FORMAT_PLANNED_DATE%>'})" id="plannedDateString" name="plannedDateString"  maxlength="0" class="" />
		<font color='red'><form:errors path="plannedDate"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=TbIncomingTasks.ALIAS_ASSIGNED_DATE%>:
		</td>		
		<td>
		<input value="${tbIncomingTasks.assignedDateString}" onclick="WdatePicker({dateFmt:'<%=TbIncomingTasks.FORMAT_ASSIGNED_DATE%>'})" id="assignedDateString" name="assignedDateString"  maxlength="0" class="" />
		<font color='red'><form:errors path="assignedDate"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=TbIncomingTasks.ALIAS_STATUS%>:
		</td>		
		<td>
		<form:select path="status" id="status" cssClass="validate-number">
			<form:option value="" label="-- please select --"></form:option>
			<form:options items="${status}"/>
		</form:select>
		<font color='red'><form:errors path="status"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=TbIncomingTasks.ALIAS_STATUS_REPORT%>:
		</td>		
		<td>
		<form:input path="statusReport" id="statusReport" cssClass="" maxlength="500" />
		<font color='red'><form:errors path="statusReport"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=TbIncomingTasks.ALIAS_COMPLETION_APPROVAL%>:
		</td>		
		<td>
		<form:input path="completionApproval" id="completionApproval" cssClass="" maxlength="45" />
		<font color='red'><form:errors path="completionApproval"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=TbIncomingTasks.ALIAS_REASONS_SUSPICION%>:
		</td>		
		<td>
		<form:input path="reasonsSuspicion" id="reasonsSuspicion" cssClass="" maxlength="2000" />
		<font color='red'><form:errors path="reasonsSuspicion"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=TbIncomingTasks.ALIAS_VERIFIED%>:
		</td>		
		<td>
		<form:select path="verified" id="verified" cssClass="validate-number">
			<form:option value="" label="-- please select --"></form:option>
			<form:options items="${verified}"/>
		</form:select>
		<font color='red'><form:errors path="verified"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=TbIncomingTasks.ALIAS_INSTRUCTIONS%>:
		</td>		
		<td>
		<form:input path="instructions" id="instructions" cssClass="" maxlength="2000" />
		<font color='red'><form:errors path="instructions"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=TbIncomingTasks.ALIAS_REPORT%>:
		</td>		
		<td>
		<form:input path="report" id="report" cssClass="" maxlength="2000" />
		<font color='red'><form:errors path="report"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=TbIncomingTasks.ALIAS_CREATE_BY%>:
		</td>		
		<td>
		<form:select path="createBy" id="createBy" cssClass="validate-number">
			<form:option value="" label="-- please select --"></form:option>
			<form:options items="${createBy}"/>
		</form:select>
		<font color='red'><form:errors path="createBy"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=TbIncomingTasks.ALIAS_RANK%>:
		</td>		
		<td>
		<form:select path="rank" id="rank" cssClass="validate-number">
			<form:option value="" label="-- please select --"></form:option>
			<form:options items="${rank}"/>
		</form:select>
		<font color='red'><form:errors path="rank"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=TbIncomingTasks.ALIAS_SIGNATURE%>:
		</td>		
		<td>
		<form:input path="signature" id="signature" cssClass="" maxlength="200" />
		<font color='red'><form:errors path="signature"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=TbIncomingTasks.ALIAS_REMARK2%>:
		</td>		
		<td>
		<form:input path="remark2" id="remark2" cssClass="" maxlength="2000" />
		<font color='red'><form:errors path="remark2"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=TbIncomingTasks.ALIAS_REMARK%>:
		</td>		
		<td>
		<form:input path="remark" id="remark" cssClass="" maxlength="2000" />
		<font color='red'><form:errors path="remark"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=TbIncomingTasks.ALIAS_LINK%>:
		</td>		
		<td>
		<form:input path="link" id="link" cssClass="" maxlength="200" />
		<font color='red'><form:errors path="link"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=TbIncomingTasks.ALIAS_APPROVED%>:
		</td>		
		<td>
		<form:select path="approved" id="approved" cssClass="validate-number">
			<form:option value="" label="-- please select --"></form:option>
			<form:options items="${approved}"/>
		</form:select>
		<font color='red'><form:errors path="approved"/></font>
		</td>
	</tr>	
	
		