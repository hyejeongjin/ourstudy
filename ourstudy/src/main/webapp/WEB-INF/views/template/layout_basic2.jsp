<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico" type="image/x-icon" sizes="16x16" />
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<tiles:insertAttribute name="sidebar"/>
<div id="main">
	<div id="main_body">
		<tiles:insertAttribute name="body"/>
	</div>
</div>
<div id="main_footer">
	<tiles:insertAttribute name="footer"/>
</div>
</body>
</html>



