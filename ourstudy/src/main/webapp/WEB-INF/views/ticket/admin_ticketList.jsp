<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 중앙 컨텐츠 시작 -->
<script type="text/javascript">
	
</script>
<div class="container">
	<h3>이용권 목록</h3>
	<button type="button" class="btn btn-primary"
		onclick="location.href='admin_write.do'">이용권 등록하기</button>
	<div class="container d-flex justify-content-center">
		<c:if test="${count == 0}">
			<table class="table table-group-divider align-center">
				<tr>
					<td>표시할 이용권이 없습니다</td>
				</tr>
			</table>
		</c:if>
		<c:if test="${count > 0}">
			<c:forEach var="ticket" items="${list}">
				<div class="card" style="width: 40rem;">
					<div class="card-body">
						<a href="admin_ticketModify.do?ticket_num=${ticket.ticket_num}">${ticket.ticket_name}</a>
						<div style="float: right;"><fmt:formatNumber value="${ticket.ticket_price}"/>원</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
</div>
<!-- 중앙 컨텐츠 끝 -->