package com.icia.study.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.study.dto.BoardDTO;

@Repository
public class BoardRepository {
	@Autowired
	private SqlSessionTemplate sql;
	
	public void write(BoardDTO board) {
		sql.insert("Board.write",board);
	}

	public List<BoardDTO> writeAll() {
		return sql.selectList("Board.writeAll");
	}

	public List<BoardDTO> pagingList(Map<String, Integer> pagingParam) {
		return sql.selectList("Board.pagingList", pagingParam);
	}

	public int boardCount() {
		return sql.selectOne("Board.count");
	}

	public BoardDTO detail(long b_number) {
		return sql.selectOne("Board.detail",b_number);
	}

	public void hits(long b_number) {
		sql.update("Board.hits",b_number);
		
	}

	public void delete(long b_number) {
		sql.delete("Board.delete",b_number);
		
	}

	public void update(BoardDTO board) {
		sql.update("Board.update",board);
	}

	public List<BoardDTO> search(Map<String, String> searchParam) {
		return sql.selectList("Board.search", searchParam);
	}

}
