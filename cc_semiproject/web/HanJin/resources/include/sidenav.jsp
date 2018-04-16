<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member" %>
<% Member mem = (Member)session.getAttribute("loginUser"); %>
				<p>
					<a href="/cs/HanJin/views/insuranceReservation.jsp">보험약관</a>
				</p>
				<p>
					<a href="/cs/HanJin/views/reservationInfo.jsp">예약 설명</a>
				</p>
				<p>
				<% if(mem != null){ %>
					<a href="/cs/HanJin/views/reservationView.jsp">회원 예약</a>
				<% }else{ %>
					<a href="/cs/HanJin/views/noMemberReservation.jsp">비회원 예약</a>
				<% } %>
				</p>
				<!-- <p>
					<a href="longReservation.jsp">장기 예약</a>
				</p> -->
	
