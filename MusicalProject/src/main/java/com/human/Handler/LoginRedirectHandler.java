package com.human.Handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class LoginRedirectHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// 로그인에 성공하면 이동하는 페이지
		List<String> roleNames=new ArrayList<String>();
		//권한들 읽어오기(로그인한 사람의)/roleNames에 추가 
		for (GrantedAuthority authority : authentication.getAuthorities()) {
		    roleNames.add(authority.getAuthority());
		    System.out.println("==role.authority==" + authority.getAuthority());
		}		
		//권한에 따라 페이지 이동
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/ex/admin/admin");
			return;
		}
		if(roleNames.contains("ROLE_SUPERADMIN")) {
			response.sendRedirect("/ex/admin/admin");
			return;
		}
		if(roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/ex/member/myPage");
			return;
		}
	}

}
