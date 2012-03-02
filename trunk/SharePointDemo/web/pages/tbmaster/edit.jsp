<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><fmt:message key="TABLE_MASTER"/> <fmt:message key="Modify"/></title>
</rapid:override>

<rapid:override name="content">
	<form:form method="put" action="${ctx}/tbmaster/${tbMaster.it}" modelAttribute="tbMaster">
		<input id="submitButton" name="submitButton" type="submit" value="<fmt:message key="Submit"/>" />
		<input type="button" value="<fmt:message key="Back_to_list"/>" onclick="window.location='${ctx}/tbmaster'"/>
		<input type="button" value="<fmt:message key="Back"/>" onclick="history.back();"/>
		
		<table class="formTable">
		<%@ include file="form_include.jsp" %>
		</table>
	</form:form>
	
	<script>
		
		new Validation(document.forms[0],{onSubmit:true,onFormValidate : function(result,form) {
			var finalResult = result;
			
			//在这里添加自定义验证
			
			return disableSubmit(finalResult,'submitButton');
		}});
	</script>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>