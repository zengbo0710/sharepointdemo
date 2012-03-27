<%@page import="com.maintenance.demo.model.*" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=TbKnowledgeBased.TABLE_ALIAS%> <fmt:message key="Maintenance"/></title>
	
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
					<td class="tdLabel"><%=TbKnowledgeBased.ALIAS_TYPE%></td>		
					<td>
						<input value="${query.type}" id="type" name="type" maxlength="10"  class="validate-integer max-value-2147483647"/>
					</td>
					<td class="tdLabel"><%=TbKnowledgeBased.ALIAS_TITLE%></td>		
					<td>
						<input value="${query.title}" id="title" name="title" maxlength="300"  class=""/>
					</td>
					<td class="tdLabel"><%=TbKnowledgeBased.ALIAS_DESCRIPTION%></td>		
					<td>
						<input value="${query.description}" id="description" name="description" maxlength="2000"  class=""/>
					</td>
					<td class="tdLabel"><%=TbKnowledgeBased.ALIAS_LOCATION%></td>		
					<td>
						<input value="${query.location}" id="location" name="location" maxlength="200"  class=""/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=TbKnowledgeBased.ALIAS_SOLUTIONS%></td>		
					<td>
						<input value="${query.solutions}" id="solutions" name="solutions" maxlength="2000"  class=""/>
					</td>
					<td class="tdLabel"><%=TbKnowledgeBased.ALIAS_SOLUTIONS_DOC%></td>		
					<td>
						<input value="${query.solutionsDoc}" id="solutionsDoc" name="solutionsDoc" maxlength="200"  class=""/>
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="<fmt:message key="Search"/>" onclick="getReferenceForm(this).action='${ctx}/tbknowledgebased'"/>
			<input type="button" class="stdButton" style="width:80px" value="<fmt:message key="Add"/>" onclick="window.location = '${ctx}/tbknowledgebased/new'"/>
			<input type="button" class="stdButton" style="width:80px" value="<fmt:message key="Delete"/>" onclick="doRestBatchDelete('${ctx}/tbknowledgebased','items',document.forms.queryForm)"/>
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
				
				<th sortColumn="type" ><%=TbKnowledgeBased.ALIAS_TYPE%></th>
				<th sortColumn="title" ><%=TbKnowledgeBased.ALIAS_TITLE%></th>
				<th sortColumn="description" ><%=TbKnowledgeBased.ALIAS_DESCRIPTION%></th>
				<th sortColumn="location" ><%=TbKnowledgeBased.ALIAS_LOCATION%></th>
				<th sortColumn="solutions" ><%=TbKnowledgeBased.ALIAS_SOLUTIONS%></th>
				<th sortColumn="solutions_doc" ><%=TbKnowledgeBased.ALIAS_SOLUTIONS_DOC%></th>
	
				<th><fmt:message key="Operation"/></th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  
			  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><input type="checkbox" name="items" value="${item.id}"></td>
				
				<td><c:out value='${item.type}'/>&nbsp;</td>
				<td><c:out value='${item.title}'/>&nbsp;</td>
				<td><c:out value='${item.description}'/>&nbsp;</td>
				<td><c:out value='${item.location}'/>&nbsp;</td>
				<td><c:out value='${item.solutions}'/>&nbsp;</td>
				<td><c:out value='${item.solutionsDoc}'/>&nbsp;</td>
				<td>
					<a href="${ctx}/tbknowledgebased/${item.id}"><fmt:message key="View"/></a>&nbsp;&nbsp;
					<a href="${ctx}/tbknowledgebased/${item.id}/edit"><fmt:message key="Modify"/></a>&nbsp;&nbsp;
					<a href="${ctx}/tbknowledgebased/${item.id}" onclick="doRestDelete(this,'<fmt:message key="Are_you_sure_to_delete"/>');return false;"><fmt:message key="Delete"/></a>
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
