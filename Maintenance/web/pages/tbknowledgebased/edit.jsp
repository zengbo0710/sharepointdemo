<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=TbKnowledgeBased.TABLE_ALIAS%> <fmt:message key="Modify"/></title>
</rapid:override>

<rapid:override name="content">
	<form:form method="put" action="${ctx}/tbknowledgebased/${tbKnowledgeBased.id}" modelAttribute="tbKnowledgeBased">
		<input id="submitButton" name="submitButton" type="submit" value="<fmt:message key="Submit"/>" />
		<input type="button" value="<fmt:message key="Back_to_list"/>" onclick="window.location='${ctx}/tbknowledgebased'"/>
		<input type="button" value="<fmt:message key="Back"/>" onclick="history.back();"/>
		
		<table class="formTable">
		<%@ include file="form_include.jsp" %>
		</table>
	</form:form>
	
	<script>
		
		new Validation(document.forms[0],{onSubmit:true,onFormValidate : function(result,form) {
			var finalResult = result;
			
			
			return disableSubmit(finalResult,'submitButton');
		}});
	</script>
</rapid:override>

<%@ include file="base.jsp" %>