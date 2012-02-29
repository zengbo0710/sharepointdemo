<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><fmt:message key="TABLE_INCOMING_TASKS"/> <fmt:message key="Add"/></title>
</rapid:override>

<rapid:override name="content">
	<form:form method="post" action="${ctx}/tbincomingtasks" modelAttribute="tbIncomingTasks" >
		<input type="button" value="<fmt:message key="Back_to_list"/>" onclick="window.location='${ctx}/tbincomingtasks'"/>
		<input type="button" value="<fmt:message key="Back"/>" onclick="history.back();"/>
		
		<table class="formTable">
		<%@ include file="form_include.jsp" %>
		</table>
		<input id="submitButton" name="submitButton" type="submit" value="<fmt:message key="Submit"/>" />
	</form:form>
	
	<script>
		
		new Validation(document.forms[0],{onSubmit:true,onFormValidate : function(result,form) {
			var finalResult = result;
			
			//在这里添加自定义验证
			
			return disableSubmit(finalResult,'submitButton');
		}});
	</script>
</rapid:override>

<%@ include file="base.jsp" %>
