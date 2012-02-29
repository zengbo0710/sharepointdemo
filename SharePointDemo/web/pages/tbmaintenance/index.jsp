<%@page import="com.sharepoint.demo.model.*" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><fmt:message key="TABLE_MAINTENANCE"/></title>
	
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
					<td class="tdLabel"><fmt:message key="ALIAS_TYPE" /></td>		
					<td>
						<input value="${query.type}" id="type" name="type" maxlength="10"  class="validate-integer max-value-2147483647"/>
					</td>
					<td class="tdLabel"><fmt:message key="ALIAS_TITLE" /></td>		
					<td>
						<input value="${query.title}" id="title" name="title" maxlength="200"  class=""/>
					</td>
					<td class="tdLabel"><fmt:message key="ALIAS_DESCRIPTIONS" /></td>		
					<td>
						<input value="${query.descriptions}" id="descriptions" name="descriptions" maxlength="1000"  class=""/>
					</td>
					<td class="tdLabel"><fmt:message key="ALIAS_LOCATION" /></td>		
					<td>
						<input value="${query.location}" id="location" name="location" maxlength="500"  class=""/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><fmt:message key="ALIAS_LINK" /></td>		
					<td>
						<input value="${query.link}" id="link" name="link" maxlength="500"  class=""/>
					</td>
					<td class="tdLabel"><fmt:message key="ALIAS_INFORMATION" /></td>		
					<td>
						<input value="${query.information}" id="information" name="information" maxlength="1000"  class=""/>
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="<fmt:message key="Search"/>" onclick="getReferenceForm(this).action='${ctx}/tbmaintenance'"/>
			<input type="button" class="stdButton" style="width:80px" value="<fmt:message key="Add"/>" onclick="window.location = '${ctx}/tbmaintenance/new'"/>
			<input type="button" class="stdButton" style="width:80px" value="<fmt:message key="Delete"/>" onclick="doRestBatchDelete('${ctx}/tbmaintenance','items',document.forms.queryForm)"/>
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
				<th sortColumn="type" ><fmt:message key="ALIAS_TYPE"/></th>
				<th sortColumn="Title" ><fmt:message key="ALIAS_TITLE"/></th>
				<th sortColumn="Descriptions" ><<fmt:message key="ALIAS_DESCRIPTIONS"/></th>
				<th sortColumn="Location" ><fmt:message key="ALIAS_LOCATION"/></th>
				<th sortColumn="Link" ><fmt:message key="ALIAS_LINK"/></th>
				<th sortColumn="Information" ><fmt:message key="ALIAS_INFORMATION"/></th>
	
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
				<td><c:out value='${item.descriptions}'/>&nbsp;</td>
				<td><c:out value='${item.location}'/>&nbsp;</td>
				<td><c:out value='${item.link}'/>&nbsp;</td>
				<td><c:out value='${item.information}'/>&nbsp;</td>
				<td>
					<a href="${ctx}/tbmaintenance/${item.id}"><fmt:message key="View"/></a>&nbsp;&nbsp;
					<a href="${ctx}/tbmaintenance/${item.id}/edit"><fmt:message key="Modify"/></a>&nbsp;&nbsp;
					<a href="${ctx}/tbmaintenance/${item.id}" onclick="doRestDelete(this,'<fmt:message key="Are_you_sure_to_delete"/>');return false;"><fmt:message key="Delete"/></a>
				</td>
			  </tr>
			  
		  	  </c:forEach>
		  </tbody>
		</table>
	
		<simpletable:pageToolbar page="${page}">
		<!-- 显示在这里是为了提示你如何自定义表头,可修改模板删除此行 -->
		</simpletable:pageToolbar>
		
	</div>
	</form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>
