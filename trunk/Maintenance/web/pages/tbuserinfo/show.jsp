<%@page import="com.maintenance.demo.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=TbUserInfo.TABLE_ALIAS%><fmt:message key="Information"/></title>
</rapid:override>

<rapid:override name="content">
	<form:form modelAttribute="tbuserinfo"  >
		<input type="button" value="<fmt:message key="Back_to_list"/>" onclick="window.location='${ctx}/tbuserinfo'"/>
		<input type="button" value="<fmt:message key="Back"/>" onclick="history.back();"/>
		
		<input type="hidden" id="id" name="id" value="${tbUserInfo.id}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=TbUserInfo.ALIAS_USER_NAME%></td>	
				<td><c:out value='${tbUserInfo.userName}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=TbUserInfo.ALIAS_PASSWORD%></td>	
				<td><c:out value='${tbUserInfo.password}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=TbUserInfo.ALIAS_DESCRIPTION%></td>	
				<td><c:out value='${tbUserInfo.description}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=TbUserInfo.ALIAS_ROLE%></td>	
				<td><c:out value='${tbUserInfo.role}'/></td>
			</tr>
		</table>
	</form:form>
</rapid:override>

<%@ include file="base.jsp" %>