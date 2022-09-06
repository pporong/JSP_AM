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
		response.getWriter().append("< 9단 > <br>");
		response.setContentType("text/html; charset=UTF-8");
		
		
		int dan = 9;
		for(int i = 1; i <= 9; i++) {
			response.getWriter().append(String.format(" %d X %d = %d <br>", dan, i, dan * i));
		}
	}
}
