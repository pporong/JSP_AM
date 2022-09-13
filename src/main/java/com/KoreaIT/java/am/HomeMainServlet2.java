package com.KoreaIT.java.am;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/home/printDan2")
public class HomeMainServlet2 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		// 파라미터 선언
		String inputedDan = request.getParameter("dan");
		if(inputedDan == null) {
			inputedDan = "1";
		}
		
		String inputedLimit = request.getParameter("limit");
		if(inputedLimit == null) {
			inputedLimit = "9";
		}
		
		String inputedColor = request.getParameter("color");
		if(inputedColor == null) {
			inputedColor = "";
		}

		// 파라미터를 정수화
		int dan = Integer.parseInt(inputedDan);
		int limit = Integer.parseInt(inputedLimit);		

		response.getWriter().append(String.format("<h2 style=\"color:%s\"> %d단 </h2>",inputedColor, dan));
		for(int i = 1; i <= limit; i++) {
			response.getWriter().append(String.format("<div style=\"color:%s\"> %d X %d = %d </div>",inputedColor, dan, i, dan * i));
		}
		
		// http://localhost:8081/JSP_AM/home/printDan?dan=88&limit=33&color=purple
		// -> 88*33단을 글씨 색깔 보라색으로 출력
		
	}
}
