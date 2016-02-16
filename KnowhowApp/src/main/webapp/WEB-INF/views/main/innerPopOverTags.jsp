<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:forEach begin="0" end="19" var="tag" varStatus="status">
	<a href="#" class="popoverTags">#${mTagList.get(status.index).tag }</a>
</c:forEach>