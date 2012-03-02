<%@page import="com.sharepoint.demo.model.*" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><fmt:message key="TABLE_INCOMING_TASKS"/> <fmt:message key="Maintenance"/></title>
	
	<script src="${ctx}/scripts/rest.js" ></script>
	<link href="<c:url value="/widgets/simpletable/simpletable.css"/>" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
	
	<script type="text/javascript" >
		$(document).ready(function() {
			// 分页需要依赖的初始化动作
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
					<td class="tdLabel"><fmt:message key="ALIAS_ACTION" /></td>		
					<td>
						<input value="${query.action}" id="action" name="action" maxlength="100"  class=""/>
					</td>
					<td class="tdLabel"><fmt:message key="ALIAS_PLANNED_DATE" /></td>		
					<td>
						<input value="<fmt:formatDate value='${query.plannedDateBegin}' pattern='<%=TbIncomingTasks.FORMAT_PLANNED_DATE%>'/>" onclick="WdatePicker({dateFmt:'<%=TbIncomingTasks.FORMAT_PLANNED_DATE%>'})" id="plannedDateBegin" name="plannedDateBegin"   />
						<input value="<fmt:formatDate value='${query.plannedDateEnd}' pattern='<%=TbIncomingTasks.FORMAT_PLANNED_DATE%>'/>" onclick="WdatePicker({dateFmt:'<%=TbIncomingTasks.FORMAT_PLANNED_DATE%>'})" id="plannedDateEnd" name="plannedDateEnd"   />
					</td>
					<td class="tdLabel"><fmt:message key="ALIAS_ASSIGNED_DATE" /></td>		
					<td>
						<input value="<fmt:formatDate value='${query.assignedDateBegin}' pattern='<%=TbIncomingTasks.FORMAT_ASSIGNED_DATE%>'/>" onclick="WdatePicker({dateFmt:'<%=TbIncomingTasks.FORMAT_ASSIGNED_DATE%>'})" id="assignedDateBegin" name="assignedDateBegin"   />
						<input value="<fmt:formatDate value='${query.assignedDateEnd}' pattern='<%=TbIncomingTasks.FORMAT_ASSIGNED_DATE%>'/>" onclick="WdatePicker({dateFmt:'<%=TbIncomingTasks.FORMAT_ASSIGNED_DATE%>'})" id="assignedDateEnd" name="assignedDateEnd"   />
					</td>
					<td class="tdLabel"><fmt:message key="ALIAS_STATUS" /></td>		
					<td>
						<input value="${query.status}" id="status" name="status" maxlength="12"  class="validate-number "/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><fmt:message key="ALIAS_STATUS_REPORT" /></td>		
					<td>
						<input value="${query.statusReport}" id="statusReport" name="statusReport" maxlength="500"  class=""/>
					</td>
					<td class="tdLabel"><fmt:message key="ALIAS_COMPLETION_APPROVAL" /></td>		
					<td>
						<input value="${query.completionApproval}" id="completionApproval" name="completionApproval" maxlength="45"  class=""/>
					</td>
					<td class="tdLabel"><fmt:message key="ALIAS_REASONS_SUSPICION" /></td>		
					<td>
						<input value="${query.reasonsSuspicion}" id="reasonsSuspicion" name="reasonsSuspicion" maxlength="2000"  class=""/>
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
	<br>
	<div class="gridTable">
	
		<simpletable:pageToolbar page="${page}">
		<!-- 显示在这里是为了提示你如何自定义表头,可修改模板删除此行 -->
		</simpletable:pageToolbar>
	
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  
			  <tr>
				<th style="width:1px;"> </th>
				<th style="width:1px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"></th>
				
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="action" ><fmt:message key="ALIAS_ACTION"/></th>
				<th sortColumn="planned_date" ><fmt:message key="ALIAS_PLANNED_DATE"/></th>
				<th sortColumn="assigned_date" ><fmt:message key="ALIAS_ASSIGNED_DATE"/></th>
				<th sortColumn="status" ><fmt:message key="ALIAS_STATUS"/></th>
				<th sortColumn="status_report" ><fmt:message key="ALIAS_STATUS_REPORT"/></th>
				<th sortColumn="completion_approval" ><fmt:message key="ALIAS_COMPLETION_APPROVAL"/></th>
				<th sortColumn="reasons_suspicion" ><fmt:message key="ALIAS_REASONS_SUSPICION"/></th>
	
				<th><fmt:message key="Operation"/></th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="statusInd">
		  	  
			  <tr class="${statusInd.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${page.thisPageFirstElementNumber + statusInd.index}</td>
				<td><input type="checkbox" name="items" value="${item.id}"></td>
				
				<td><c:out value='${item.action}'/>&nbsp;</td>
				<td><c:out value='${item.plannedDateString}'/>&nbsp;</td>
				<td><c:out value='${item.assignedDateString}'/>&nbsp;</td>
				<td>
					<c:set value='${item.status}' var='key'></c:set>
					<c:out value="${status[key]}" />&nbsp;
				</td>
				<td><c:out value='${item.statusReport}'/>&nbsp;</td>
				<td><c:out value='${item.completionApproval}'/>&nbsp;</td>
				<td><c:out value='${item.reasonsSuspicion}'/>&nbsp;</td>
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
		<!--显示在这里是为了提示你如何自定义表头,可修改模板删除此行-->
		</simpletable:pageToolbar>
		
	</div>
	</form>
</rapid:override>

<%@ include file="base.jsp" %>
