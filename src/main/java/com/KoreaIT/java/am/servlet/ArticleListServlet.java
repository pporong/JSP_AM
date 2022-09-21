package com.KoreaIT.java.am.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.KoreaIT.java.am.config.Config;
import com.KoreaIT.java.am.exception.SQLErrorException;
import com.KoreaIT.java.am.util.DBUtil;
import com.KoreaIT.java.am.util.SecSql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/article/list")
public class ArticleListServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html; charset=UTF-8");

		// DB 연결

		Connection conn = null;

		String driverName = Config.getDBDriverClassName();

		try {
			Class.forName(driverName);

		} catch (ClassNotFoundException e) {
			System.out.println("** 예외 : 클래스가 없습니다. **");
			System.out.println("프로그램을 종료합니다. :(");
			return;
		}

		try {
			conn = DriverManager.getConnection(Config.getDBUrl(), Config.getDBUser(), Config.getDBPassword());
			
			int page= 1;
			
			if (request.getParameter("page") != null && request.getParameter("page").length() != 0) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			
			int itemsInAPage = 10;
			
			int limitFrom = (page - 1) * itemsInAPage;
			
			SecSql sql = SecSql.from("SELECT COUNT(*) AS cnt");
			sql.append("FROM article");
			
			// 총 게시물 갯수
			int totalCount = DBUtil.selectRowIntValue(conn, sql);
			
			// 총 페이지 수
			int totalPage = (int)Math.ceil((double)totalCount / itemsInAPage);
			

			
			 sql = SecSql.from("SELECT *"); sql.append("FROM article");
			 sql.append("ORDER BY id DESC"); sql.append("LIMIT ?, ?", limitFrom,
			 itemsInAPage);
			 

			/*
			 * sql.append("SELECT A.*, M.name AS extra__writer");
			 * sql.append("FROM article as A"); sql.append("INNER JOIN member as M");
			 * sql.append("ON A.memberId = M.id"); sql.append("ORDER BY A.id DESC");
			 * sql.append("LIMIT ?, ?", limitFrom, itemsInAPage);
			 */
			
			List<Map<String, Object>> articleRows = DBUtil.selectRows(conn, sql);
			
			request.setAttribute("page", page);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("articleRows", articleRows);
			request.getRequestDispatcher("/jsp/article/list.jsp").forward(request, response);
			
			String title = request.getParameter("title");
			String body = request.getParameter("body");
			/* String extra__writer = request.getParameter("extra__writer"); */
			
			HttpSession session = request.getSession();
			
			int loginedMemberId = (int) session.getAttribute("loginedMemberId");

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (SQLErrorException e) {
			e.getOrigin().printStackTrace();
		} finally {
			try {
				if (conn != null && !conn.isClosed()) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}