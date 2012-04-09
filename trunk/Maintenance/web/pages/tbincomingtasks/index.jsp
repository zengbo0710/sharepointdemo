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
		
		function downloadReport(url) {
			window.open(url,'Download');
		}
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
					<td class="tdLabel"><%=TbIncomingTasks.ALIAS_CREATE_BY%></td>		
					<td>
						<input value="${query.createBy}" id="createBy" name="createBy" maxlength="10"  class="validate-integer max-value-2147483647"/>
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
				<th sortColumn="job_id" ><%=TbIncomingTasks.ALIAS_JOB_ID%></th>
				<th sortColumn="planned_date" ><%=TbIncomingTasks.ALIAS_PLANNED_DATE%></th>
				<th sortColumn="assigned_date" ><%=TbIncomingTasks.ALIAS_ASSIGNED_DATE%></th>
				<th sortColumn="status" ><%=TbIncomingTasks.ALIAS_STATUS%></th>
				
				<th sortColumn="verified" ><%=TbIncomingTasks.ALIAS_VERIFIED%></th>
				
				<th sortColumn="report" ><%=TbIncomingTasks.ALIAS_REPORT%></th>
				<th sortColumn="rank" ><%=TbIncomingTasks.ALIAS_RANK%></th>
				<th sortColumn="signature" ><%=TbIncomingTasks.ALIAS_SIGNATURE%></th>
				
				<th sortColumn="remark" ><%=TbIncomingTasks.ALIAS_REMARK%></th>
				<th sortColumn="percentage" ><%=TbIncomingTasks.ALIAS_PERCENTAGE%></th>
				<th sortColumn="sign_to" ><%=TbIncomingTasks.ALIAS_SIGN_TO%></th>
				
				<c:if test="${sessionScope.userInfo.role<1}">
				<th sortColumn="remark2" ><%=TbIncomingTasks.ALIAS_REMARK2%></th>
				<th sortColumn="instructions" ><%=TbIncomingTasks.ALIAS_INSTRUCTIONS%></th>
				<th sortColumn="status_report" ><%=TbIncomingTasks.ALIAS_STATUS_REPORT%></th>
				<th sortColumn="completionApproval" ><%=TbIncomingTasks.ALIAS_COMPLETION_APPROVAL%></th>
				<th sortColumn="reasonsSuspicion" ><%=TbIncomingTasks.ALIAS_REASONS_SUSPICION%></th>
				<th sortColumn="link" ><%=TbIncomingTasks.ALIAS_LINK%></th>
				<th sortColumn="create_by" ><%=TbIncomingTasks.ALIAS_CREATE_BY%></th>
				<th sortColumn="action" ><%=TbIncomingTasks.ALIAS_ACTION%></th>
				<th sortColumn="completion_approval" ><%=TbIncomingTasks.ALIAS_COMPLETION_APPROVAL%></th>
				<th sortColumn="reasons_suspicion" ><%=TbIncomingTasks.ALIAS_REASONS_SUSPICION%></th>
				<th sortColumn="approved" ><%=TbIncomingTasks.ALIAS_APPROVED%></th>
				<th sortColumn="remark3" ><%=TbIncomingTasks.ALIAS_REMARK3%></th>
				<th sortColumn="remark4" ><%=TbIncomingTasks.ALIAS_REMARK4%></th>
				<th sortColumn="process_time" ><%=TbIncomingTasks.ALIAS_PROCESS_TIME%></th>
				</c:if>
	
				<th><fmt:message key="Operation"/></th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  
			  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><input type="checkbox" name="items" value="${item.id}"></td>
				<td><a href="demo/demo${status.index+1}.html" target="_blank"><c:out value='${item.jobId}'/></a>&nbsp;</td>
				<td><c:out value='${item.plannedDateString}'/>&nbsp;</td>
				<td><c:out value='${item.assignedDateString}'/>&nbsp;</td>
				<td>
					<c:set value='${item.status}' var='key'/>
					<c:out value='${statusMap[key+0]}' />&nbsp;
			    </td>
			
				<td>
					<c:set value='${item.verified}' var='key'/>
					<c:out value='${verifiedMap[key+0]}' />&nbsp;
				</td>
				
				<td><a href="javascript:downloadReport('${item.link}')"><c:out value='${item.report}'/></a>&nbsp;</td>
				<td>
					<c:set value='${item.verified}' var='key'/>
					<c:out value='${rankMap[key+0]}' />&nbsp;
				</td>
				<td><c:out value='${item.signature}'/>&nbsp;</td>
				
				<td><c:out value='${item.remark}'/>&nbsp;</td>
				<td><c:out value='${item.percentage}'/>%&nbsp;</td>
				<td>
					<c:set value='${item.signTo}' var='key'/>
					<c:out value='${userMap[key+0]}' />&nbsp;
				</td>
				
				
				<c:if test="${sessionScope.userInfo.role<1}">
				<td><c:out value='${item.remark2}'/>&nbsp;</td>
				<td><c:out value='${item.instructions}'/>&nbsp;</td>
				<td><c:out value='${item.statusReport}'/>&nbsp;</td>
				<td><c:out value='${item.completionApproval}'/>&nbsp;</td>
				<td><c:out value='${item.reasonsSuspicion}'/>&nbsp;</td>
				<td><c:out value='${item.link}'/>&nbsp;</td>
				<td>
					<c:set value='${item.createBy}' var='key'/>
					<c:out value='${createByMap[key+0]}' />&nbsp;
				</td>
				<td><c:out value='${item.action}'/>&nbsp;</td>
				<td><c:out value='${item.completionApproval}'/>&nbsp;</td>
				<td><c:out value='${item.reasonsSuspicion}'/>&nbsp;</td>
				<td>
					<c:set value='${item.approved}' var='key'/>
					<c:out value='${approvedMap[key+0]}' />&nbsp;	
				</td>
				<td><c:out value='${item.remark3}'/>&nbsp;</td>
				<td><c:out value='${item.remark4}'/>&nbsp;</td>
				<td><c:out value='${item.processTime}'/>&nbsp;</td>
				</c:if>
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
