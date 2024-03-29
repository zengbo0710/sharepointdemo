<%@page import="com.maintenance.demo.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=TbKnowledgeBased.TABLE_ALIAS%><fmt:message key="Information"/></title>
</rapid:override>

<rapid:override name="content">
	<form:form modelAttribute="tbknowledgebased"  >
		<input type="button" value="<fmt:message key="Back_to_list"/>" onclick="window.location='${ctx}/tbknowledgebased'"/>
		<input type="button" value="<fmt:message key="Back"/>" onclick="history.back();"/>
		
		<input type="hidden" id="id" name="id" value="${tbKnowledgeBased.id}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=TbKnowledgeBased.ALIAS_TYPE%></td>	
				<td><c:out value='${tbKnowledgeBased.type}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=TbKnowledgeBased.ALIAS_TITLE%></td>	
				<td><c:out value='${tbKnowledgeBased.title}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=TbKnowledgeBased.ALIAS_DESCRIPTION%></td>	
				<td><c:out value='${tbKnowledgeBased.description}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=TbKnowledgeBased.ALIAS_LOCATION%></td>	
				<td><c:out value='${tbKnowledgeBased.location}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=TbKnowledgeBased.ALIAS_SOLUTIONS%></td>	
				<td><c:out value='${tbKnowledgeBased.solutions}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=TbKnowledgeBased.ALIAS_SOLUTIONS_DOC%></td>	
				<td><c:out value='${tbKnowledgeBased.solutionsDoc}'/></td>
			</tr>
		</table>
	</form:form>
</rapid:override>

<%@ include file="base.jsp" %>