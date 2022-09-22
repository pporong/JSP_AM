package com.KoreaIT.java.am.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.KoreaIT.java.am.dto.Article;
import com.KoreaIT.java.am.util.DBUtil;
import com.KoreaIT.java.am.util.SecSql;

public class ArticleDao {

	private Connection conn;

	public ArticleDao(Connection conn) {
		this.conn = conn;
	}

	public int doWrite(String title, String body) {
		
		SecSql sql = new SecSql();
		sql.append("INSERT INTO article");
		sql.append(" SET regDate = NOW()");
		sql.append(", updateDate = NOW()");
		sql.append(", title = ?", title);
		sql.append(", `body` = ?", body);

		int id = DBUtil.insert(conn, sql);

		return id;
	}

	public boolean isArticleExists(int id) {
		
		SecSql sql = new SecSql();
		sql.append("SELECT COUNT(*) > 0");
		sql.append("FROM article");
		sql.append("WHERE id = ?", id);

		return DBUtil.selectRowBooleanValue(conn, sql);
	}

	public int getTotalCount() {
		SecSql sql = SecSql.from("SELECT COUNT(*) AS cnt");
		sql.append("FROM article");
		
		return DBUtil.selectRowIntValue(conn, sql);
	}
	
	
	public List<Article> getArticles(int itemsInAPage, int limitFrom) {
		
		SecSql sql = SecSql.from("SELECT A.*, M.name AS extra__writer");
		sql.append("FROM article AS A");
		sql.append("INNER JOIN `member` AS M");
		sql.append("ON A.memberId = M.id");
		sql.append("ORDER BY A.id DESC");
		
		sql.append("LIMIT ?, ?", limitFrom, itemsInAPage);
		
		List<Map<String, Object>> articleRows = DBUtil.selectRows(conn, sql);
		
		List<Article> articles = new ArrayList<>();
		
		for(Map<String, Object> articleRow : articleRows) {
			articles.add(new Article(articleRow));
		}
		return articles;
	}

	/*
	 * public void doDelete(int id) {
	 * 
	 * int id = Integer.parseInt(request.getParameter("id"));
	 * 
	 * SecSql sql = new SecSql(); sql.append("DELETE FROM article");
	 * sql.append("WHERE id = ?", id);
	 * 
	 * DBUtil.delete(conn, sql);
	 * 
	 * 
	 * }
	 */

	
	
}
