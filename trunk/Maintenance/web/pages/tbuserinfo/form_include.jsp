<%@page import="com.maintenance.demo.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<input type="hidden" id="id" name="id" value="${tbUserInfo.id}"/>

	<tr>	
		<td class="tdLabel">
			<%=TbUserInfo.ALIAS_USER_NAME%>:
		</td>		
		<td>
		<form:input path="userName" id="userName" cssClass="" maxlength="45" />
		<font color='red'><form:errors path="userName"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=TbUserInfo.ALIAS_PASSWORD%>:
		</td>		
		<td>
		<form:input path="password" id="password" cssClass="" maxlength="45" />
		<font color='red'><form:errors path="password"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=TbUserInfo.ALIAS_DESCRIPTION%>:
		</td>		
		<td>
		<form:input path="description" id="description" cssClass="" maxlength="1000" />
		<font color='red'><form:errors path="description"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=TbUserInfo.ALIAS_ROLE%>:
		</td>		
		<td>
		<form:input path="role" id="role" cssClass="validate-number " maxlength="12" />
		<font color='red'><form:errors path="role"/></font>
		</td>
	</tr>	
	
		