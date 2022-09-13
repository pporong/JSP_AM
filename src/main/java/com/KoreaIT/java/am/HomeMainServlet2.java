package com.KoreaIT.java.am;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/home/printDan")
public class HomeMainServlet2 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
		
		// 파라미터를 정수화
		int dan = Integer.parseInt(inputedDan);
		int limit = Integer.parseInt(inputedLimit);

		response.getWriter().append(String.format(" %d단 <br />", dan));
		for(int i = 1; i <= limit; i++) {
			response.getWriter().append(String.format(" %d X %d = %d <br>", dan, i, dan * i));
		}
		
	}
}
