package com.icia.study.service;

import java.io.IOException;
import java.util.List;

import com.icia.study.dto.BoardDTO;
import com.icia.study.dto.PageDTO;

public interface BoardService {

	void write(BoardDTO board) throws IllegalStateException, IOException;

	List<BoardDTO> writeAll();

	List<BoardDTO> pagingList(int page);

	PageDTO paging(int page);

	BoardDTO detail(long b_number);

	void hits(long b_number);

	void delete(long b_number);

	void update(BoardDTO board) throws IllegalStateException, IOException;

	List<BoardDTO> search(String searchtype, String keyword);


}
