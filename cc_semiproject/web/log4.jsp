<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="org.apache.commons.logging.Log" %> 
<%@ page import="org.apache.commons.logging.LogFactory" %>
<%@ page import="org.apache.log4j.*" %>
<%@ page import="java.util.Enumeration"%> 
<% Log logger = LogFactory.getLog( this.getClass()); %> 
<% logger.debug(this.getClass()); %> 
<% /* request 안의 모든 parameter 확인하기 */ 
	Enumeration params = request.getParameterNames(); logger.debug("======================================="); 
	while (params.hasMoreElements()){ 
		String name = (String)params.nextElement(); 
		logger.debug(name + " : " +request.getParameter(name)); 
	} 
	logger.debug("======================================="); 
%>  --%>
<%-- <% logger.debug( "This is a debug message from a jsp" ); %> 
<% logger.info( "This is another log message in the jsp" );%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>