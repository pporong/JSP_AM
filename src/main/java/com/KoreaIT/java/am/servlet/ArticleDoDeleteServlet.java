package com.KoreaIT.java.am.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
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

@WebServlet("/article/doDelete")
public class ArticleDoDeleteServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html; charset=UTF-8");
		
		// 로그인 권한 체크
		HttpSession session = request.getSession();
		if (session.getAttribute("loginedMemberLoginId") == null) {
			response.getWriter().append(
					String.format("<script>alert('!! 로그인 후 이용 가능 합니다. !!'); location.replace('../member/login');</script>"));
			return;
		}

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

			int id = Integer.parseInt(request.getParameter("id"));
			
			SecSql sql = SecSql.from("SELECT *");
			sql.append("FROM article");
			sql.append("WHERE id = ?", id);

			Map<String, Object> articleRow = DBUtil.selectRow(conn, sql);

			int loginedMemberId = (int) session.getAttribute("loginedMemberId");

			if (loginedMemberId != (int) articleRow.get("memberId")) {
				response.getWriter().append(String
						.format("<script>alert('!! 해당 게시물에 대한 권한이 없습니다. !!'); location.replace('../article/list');</script>"));
				return;
			}

			// 삭제
			sql = SecSql.from("DELETE");
			sql.append("FROM article");
			sql.append("WHERE id = ? ", id);

			DBUtil.delete(conn, sql);

			response.getWriter().append(
					String.format("<script>alert('%d번 글이 삭제 되었습니다. :)'); location.replace('list');</script>", id));

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