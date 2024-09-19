
package com.human.service;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service("mailService")
public class MailService {

	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private HttpSession session;
	
	public String createNumber() {
		Random random = new Random();
		StringBuilder key = new StringBuilder();

		for (int i = 0; i < 4; i++) {
			int index = random.nextInt(3);

			switch (index) {
			case 0:
				key.append((char) (random.nextInt(26) + 97));
				break;
			case 1:
				key.append((char) (random.nextInt(26) + 65));
				break;
			case 2:
				key.append(random.nextInt(10));
				break;
			}
		}
		return key.toString();
	}
	
	//@Async
	public void sendMail(String to, String subject, String body) {
		String number = createNumber();
		String newBody = body + "\n\n랜덤 코드: " + number;
		
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom("ticket@gmail.com", "사이트이름");
			messageHelper.setSubject(subject);
			messageHelper.setTo(to);
			messageHelper.setText(newBody); // 랜덤 문자열이 포함된 본문
			mailSender.send(message);
			System.out.println("newBody:"+newBody);
			System.out.println("body:"+body);
			
			// 세션에 인증 코드를 저장
			session.setAttribute("authCode", number);
			session.setMaxInactiveInterval(60); // 인증코드 유호시간 1분
			System.out.println(session.getAttribute("authCode"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
