package com.KoreaIT.java.am.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.KoreaIT.java.am.dto.Article;
import com.KoreaIT.java.am.service.ArticleService;
import com.KoreaIT.java.am.util.DBUtil;
import com.KoreaIT.java.am.util.SecSql;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ArticleController {

	private HttpServletRequest request;
	private HttpServletResponse response;
	private Connection conn;
	private ArticleService articleService;

	public ArticleController(HttpServletRequest request, HttpServletResponse response, Connection conn) {
		this.request = request;
		this.response = response;
		this.conn = conn;
		
		articleService = new ArticleService(conn);
//		memberService = new MemberService(conn);
	}

	// article/list
	public void showList() throws ServletException, IOException {
		
		int page = 1;

		if (request.getParameter("page") != null && request.getParameter("page").length() != 0) {
			page = Integer.parseInt(request.getParameter("page"));
		}
	
		int totalPage = articleService.getForPrintListTotalPage();
		
		List<Article> articles = articleService.getForPrintArticles(page);
		
		request.setAttribute("page", page);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("articleRows", articles);
		request.getRequestDispatcher("/jsp/article/list.jsp").forward(request, response);
		
	}

	// article/write
	public void doWrite() throws ServletException, IOException {
		
	}
	
	/*
	 * // article/delete public void doDelete() throws ServletException, IOException
	 * {
	 * 
	 * articleService.doDelete(id);
	 * 
	 * Map<String, Object> articleRow = DBUtil.selectRow(conn, sql);
	 * 
	 * int loginedMemberId = articleService.getLoginedMemberId();
	 * 
	 * 
	 * 
	 * if (loginedMemberId != (int) articleRow.get("memberId")) {
	 * response.getWriter().append(String
	 * .format("<script>alert('!! 해당 게시물에 대한 권한이 없습니다. !!'); location.replace('../article/list');</script>"
	 * )); return;
	 * 
	 * 
	 * 
	 * response.getWriter().append( String.
	 * format("<script>alert('%d번 글이 삭제 되었습니다. :)'); location.replace('list');</script>"
	 * , id));
	 * 
	 * }
	 * 
	 * 
	 * }
	 */
	
}