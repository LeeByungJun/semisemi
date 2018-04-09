<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member" %>
<% Member member = (Member)session.getAttribute("loginUser"); %>
		
				<p>
					<a href="/cs/mypage?email=<%= member.getEmail() %>">마이 페이지</a>
				</p>
				<p>
					<a href="/cs/YunHee/views/reservation.jsp">예약 및 이용내역</a>
				</p>
				<p>
					<a href="/cs/gview">회원 등급 보기</a>
				</p>
			
			<!-- <div class="col-sm-2 sidenav">
				<div class="well">
					<p>ADS</p>
					<img src="resources/gif/pop2.gif" width="100%;" height="90%;">
				</div>
			</div> -->

