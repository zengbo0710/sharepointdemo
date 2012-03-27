<%@page import="com.maintenance.demo.model.*" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=TbIncomingTasks.TABLE_ALIAS%> <fmt:message key="Maintenance"/></title>
	
	<script src="${ctx}/scripts/rest.js" ></script>
	<link href="<c:url value="/widgets/simpletable/simpletable.css"/>" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
	
	<script type="text/javascript" >
		$(document).ready(function() {
			window.simpleTable = new SimpleTable('queryForm',${page.thisPageNumber},${page.pageSize},'${pageRequest.sortColumns}');
		});
	</script>
</rapid:override>

<rapid:override name="content">
	<form id="queryForm" name="queryForm" method="get" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend><fmt:message key="Search"/></legend>
			<table>
				<tr>	
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_ACTION%></td>		
					<td>
						<input value="${query.action}" id="action" name="action" maxlength="100"  class=""/>
					</td>
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_PLANNED_DATE%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.plannedDateBegin}' pattern='<%=TbIncomingTasks.FORMAT_PLANNED_DATE%>'/>" onclick="WdatePicker({dateFmt:'<%=TbIncomingTasks.FORMAT_PLANNED_DATE%>'})" id="plannedDateBegin" name="plannedDateBegin"   />
						<input value="<fmt:formatDate value='${query.plannedDateEnd}' pattern='<%=TbIncomingTasks.FORMAT_PLANNED_DATE%>'/>" onclick="WdatePicker({dateFmt:'<%=TbIncomingTasks.FORMAT_PLANNED_DATE%>'})" id="plannedDateEnd" name="plannedDateEnd"   />
					</td>
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_ASSIGNED_DATE%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.assignedDateBegin}' pattern='<%=TbIncomingTasks.FORMAT_ASSIGNED_DATE%>'/>" onclick="WdatePicker({dateFmt:'<%=TbIncomingTasks.FORMAT_ASSIGNED_DATE%>'})" id="assignedDateBegin" name="assignedDateBegin"   />
						<input value="<fmt:formatDate value='${query.assignedDateEnd}' pattern='<%=TbIncomingTasks.FORMAT_ASSIGNED_DATE%>'/>" onclick="WdatePicker({dateFmt:'<%=TbIncomingTasks.FORMAT_ASSIGNED_DATE%>'})" id="assignedDateEnd" name="assignedDateEnd"   />
					</td>
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_STATUS%></td>		
					<td>
						<input value="${query.status}" id="status" name="status" maxlength="10"  class="validate-integer max-value-2147483647"/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_STATUS_REPORT%></td>		
					<td>
						<input value="${query.statusReport}" id="statusReport" name="statusReport" maxlength="500"  class=""/>
					</td>
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_COMPLETION_APPROVAL%></td>		
					<td>
						<input value="${query.completionApproval}" id="completionApproval" name="completionApproval" maxlength="45"  class=""/>
					</td>
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_REASONS_SUSPICION%></td>		
					<td>
						<input value="${query.reasonsSuspicion}" id="reasonsSuspicion" name="reasonsSuspicion" maxlength="2000"  class=""/>
					</td>
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_COMPLETION_APPROVAL%></td>		
					<td>
						<input value="${query.completionApproval}" id="completionApproval" name="completionApproval" maxlength="45"  class=""/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_REASONS_SUSPICION%></td>		
					<td>
						<input value="${query.reasonsSuspicion}" id="reasonsSuspicion" name="reasonsSuspicion" maxlength="200"  class=""/>
					</td>
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_VERIFIED%></td>		
					<td>
						<input value="${query.verified}" id="verified" name="verified" maxlength="10"  class="validate-integer max-value-2147483647"/>
					</td>
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_INSTRUCTIONS%></td>		
					<td>
						<input value="${query.instructions}" id="instructions" name="instructions" maxlength="2000"  class=""/>
					</td>
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_REPORT%></td>		
					<td>
						<input value="${query.report}" id="report" name="report" maxlength="2000"  class=""/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_CREATE_BY%></td>		
					<td>
						<input value="${query.createBy}" id="createBy" name="createBy" maxlength="10"  class="validate-integer max-value-2147483647"/>
					</td>
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_RANK%></td>		
					<td>
						<input value="${query.rank}" id="rank" name="rank" maxlength="10"  class="validate-integer max-value-2147483647"/>
					</td>
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_SIGNATURE%></td>		
					<td>
						<input value="${query.signature}" id="signature" name="signature" maxlength="200"  class=""/>
					</td>
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_REMARK2%></td>		
					<td>
						<input value="${query.remark2}" id="remark2" name="remark2" maxlength="2000"  class=""/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_REMARK%></td>		
					<td>
						<input value="${query.remark}" id="remark" name="remark" maxlength="2000"  class=""/>
					</td>
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_LINK%></td>		
					<td>
						<input value="${query.link}" id="link" name="link" maxlength="200"  class=""/>
					</td>
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_APPROVED%></td>		
					<td>
						<input value="${query.approved}" id="approved" name="approved" maxlength="10"  class="validate-integer max-value-2147483647"/>
					</td>
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_PERCENTAGE%></td>		
					<td>
						<input value="${query.percentage}" id="percentage" name="percentage" maxlength="12"  class="validate-number "/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_SIGN_TO%></td>		
					<td>
						<input value="${query.signTo}" id="signTo" name="signTo" maxlength="10"  class="validate-integer max-value-2147483647"/>
					</td>
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_JOB_ID%></td>		
					<td>
						<input value="${query.jobId}" id="jobId" name="jobId" maxlength="10"  class="validate-integer max-value-2147483647"/>
					</td>
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_REMARK3%></td>		
					<td>
						<input value="${query.remark3}" id="remark3" name="remark3" maxlength="2000"  class=""/>
					</td>
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_REMARK4%></td>		
					<td>
						<input value="${query.remark4}" id="remark4" name="remark4" maxlength="2000"  class=""/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_PROCESS_TIME%></td>		
					<td>
						<input value="${query.processTime}" id="processTime" name="processTime" maxlength="10"  class="validate-integer max-value-2147483647"/>
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="<fmt:message key="Search"/>" onclick="getReferenceForm(this).action='${ctx}/tbincomingtasks'"/>
			<input type="button" class="stdButton" style="width:80px" value="<fmt:message key="Add"/>" onclick="window.location = '${ctx}/tbincomingtasks/new'"/>
			<input type="button" class="stdButton" style="width:80px" value="<fmt:message key="Delete"/>" onclick="doRestBatchDelete('${ctx}/tbincomingtasks','items',document.forms.queryForm)"/>
		<div>
	
	</div>
	
	<div class="gridTable">
	
		<simpletable:pageToolbar page="${page}">
		</simpletable:pageToolbar>
	
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  
			  <tr>
				<th style="width:1px;"> </th>
				<th style="width:1px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"></th>
				
				<th sortColumn="action" ><%=TbIncomingTasks.ALIAS_ACTION%></th>
				<th sortColumn="planned_date" ><%=TbIncomingTasks.ALIAS_PLANNED_DATE%></th>
				<th sortColumn="assigned_date" ><%=TbIncomingTasks.ALIAS_ASSIGNED_DATE%></th>
				<th sortColumn="status" ><%=TbIncomingTasks.ALIAS_STATUS%></th>
				<th sortColumn="status_report" ><%=TbIncomingTasks.ALIAS_STATUS_REPORT%></th>
				<th sortColumn="completion_approval" ><%=TbIncomingTasks.ALIAS_COMPLETION_APPROVAL%></th>
				<th sortColumn="reasons_suspicion" ><%=TbIncomingTasks.ALIAS_REASONS_SUSPICION%></th>
				<th sortColumn="completionApproval" ><%=TbIncomingTasks.ALIAS_COMPLETION_APPROVAL%></th>
				<th sortColumn="reasonsSuspicion" ><%=TbIncomingTasks.ALIAS_REASONS_SUSPICION%></th>
				<th sortColumn="verified" ><%=TbIncomingTasks.ALIAS_VERIFIED%></th>
				<th sortColumn="instructions" ><%=TbIncomingTasks.ALIAS_INSTRUCTIONS%></th>
				<th sortColumn="report" ><%=TbIncomingTasks.ALIAS_REPORT%></th>
				<th sortColumn="create_by" ><%=TbIncomingTasks.ALIAS_CREATE_BY%></th>
				<th sortColumn="rank" ><%=TbIncomingTasks.ALIAS_RANK%></th>
				<th sortColumn="signature" ><%=TbIncomingTasks.ALIAS_SIGNATURE%></th>
				<th sortColumn="remark2" ><%=TbIncomingTasks.ALIAS_REMARK2%></th>
				<th sortColumn="remark" ><%=TbIncomingTasks.ALIAS_REMARK%></th>
				<th sortColumn="link" ><%=TbIncomingTasks.ALIAS_LINK%></th>
				<th sortColumn="approved" ><%=TbIncomingTasks.ALIAS_APPROVED%></th>
				<th sortColumn="percentage" ><%=TbIncomingTasks.ALIAS_PERCENTAGE%></th>
				<th sortColumn="sign_to" ><%=TbIncomingTasks.ALIAS_SIGN_TO%></th>
				<th sortColumn="job_id" ><%=TbIncomingTasks.ALIAS_JOB_ID%></th>
				<th sortColumn="remark3" ><%=TbIncomingTasks.ALIAS_REMARK3%></th>
				<th sortColumn="remark4" ><%=TbIncomingTasks.ALIAS_REMARK4%></th>
				<th sortColumn="process_time" ><%=TbIncomingTasks.ALIAS_PROCESS_TIME%></th>
	
				<th><fmt:message key="Operation"/></th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  
			  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><input type="checkbox" name="items" value="${item.id}"></td>
				
				<td><c:out value='${item.action}'/>&nbsp;</td>
				<td><c:out value='${item.plannedDateString}'/>&nbsp;</td>
				<td><c:out value='${item.assignedDateString}'/>&nbsp;</td>
				<td>
					<c:set value='${item.status}' var='key'/>
					<c:out value='${statusMap[key+0]}' />&nbsp;
			    </td>
				<td><c:out value='${item.statusReport}'/>&nbsp;</td>
				<td><c:out value='${item.completionApproval}'/>&nbsp;</td>
				<td><c:out value='${item.reasonsSuspicion}'/>&nbsp;</td>
				<td><c:out value='${item.completionApproval}'/>&nbsp;</td>
				<td><c:out value='${item.reasonsSuspicion}'/>&nbsp;</td>
				<td>
					<c:set value='${item.verified}' var='key'/>
					<c:out value='${verifiedMap[key+0]}' />&nbsp;
				</td>
				<td><c:out value='${item.instructions}'/>&nbsp;</td>
				<td><c:out value='${item.report}'/>&nbsp;</td>
				<td>
					<c:set value='${item.createBy}' var='key'/>
					<c:out value='${createByMap[key+0]}' />&nbsp;
				</td>
				<td>
					<c:set value='${rank.verified}' var='key'/>
					<c:out value='${rankMap[key+0]}' />&nbsp;
				</td>
				<td><c:out value='${item.signature}'/>&nbsp;</td>
				<td><c:out value='${item.remark2}'/>&nbsp;</td>
				<td><c:out value='${item.remark}'/>&nbsp;</td>
				<td><c:out value='${item.link}'/>&nbsp;</td>
				<td>
					<c:set value='${item.approved}' var='key'/>
					<c:out value='${approvedMap[key+0]}' />&nbsp;	
				</td>
				<td><c:out value='${item.percentage}'/>&nbsp;</td>
				<td><c:out value='${item.signTo}'/>&nbsp;</td>
				<td><c:out value='${item.jobId}'/>&nbsp;</td>
				<td><c:out value='${item.remark3}'/>&nbsp;</td>
				<td><c:out value='${item.remark4}'/>&nbsp;</td>
				<td><c:out value='${item.processTime}'/>&nbsp;</td>
				<td>
					<a href="${ctx}/tbincomingtasks/${item.id}"><fmt:message key="View"/></a>&nbsp;&nbsp;
					<a href="${ctx}/tbincomingtasks/${item.id}/edit"><fmt:message key="Modify"/></a>&nbsp;&nbsp;
					<a href="${ctx}/tbincomingtasks/${item.id}" onclick="doRestDelete(this,'<fmt:message key="Are_you_sure_to_delete"/>');return false;"><fmt:message key="Delete"/></a>
				</td>
			  </tr>
			  
		  	  </c:forEach>
		  </tbody>
		</table>
	
		<simpletable:pageToolbar page="${page}">
		</simpletable:pageToolbar>
		
	</div>
	</form>
</rapid:override>

<%@ include file="base.jsp" %>
