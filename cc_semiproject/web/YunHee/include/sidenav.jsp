<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member" %>
<% Member member = (Member)session.getAttribute("loginUser"); %>
		
				<p>
					<a href="/cs/mypage?email=<%= member.getEmail() %>">마이 페이지</a>
				</p>
				<p>
					<a href="/cs/reserview?num=<%= member.getMem_num() %>">예약 및 이용내역</a>
				</p>
				<p>
					<a href="/cs/gview">등급별 혜택보기</a>
				</p>
			
			<!-- <div class="col-sm-2 sidenav">
				<div class="well">
					<p>ADS</p>
					<img src="resources/gif/pop2.gif" width="100%;" height="90%;">
				</div>
			</div> -->

