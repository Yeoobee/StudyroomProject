package com.icia.study.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.icia.study.dto.BoardDTO;
import com.icia.study.dto.PageDTO;
import com.icia.study.service.BoardService;

@Controller
@RequestMapping(value="/board/*")
public class BoardController {
	@Autowired
	private BoardService bs;

	// 리뷰게시판 열기
	@RequestMapping(value="review", method=RequestMethod.GET)
	public String reviewform(Model model) {
		List<BoardDTO> bList = bs.writeAll();
		model.addAttribute("bList",bList);
		return "redirect:/board/paging";
	}
	
	// 글 작성 페이지 열기
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String writeform() {
		return "/board/write";
	}
	
	// 글 쓰기
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write(@ModelAttribute BoardDTO board) throws IllegalStateException, IOException {
		bs.write(board);
		return "redirect:/board/paging";
	}
	
	// 페이징
		@RequestMapping(value="paging", method=RequestMethod.GET)
		// value: 파라미터이름, required: 필수여부, defaultValue: 기본값(page 요청값이 없으면 1로 세팅)
		public String paging(@RequestParam(value="page", required=false, defaultValue="1")int page, Model model) {
			
			List<BoardDTO> bList = bs.pagingList(page);
			PageDTO paging = bs.paging(page);
			model.addAttribute("bList", bList);
			model.addAttribute("paging", paging);
			return "board/review";
		}
		
		// 글 상세정보보기
		@RequestMapping(value="detail", method=RequestMethod.GET)
		public String detail(@RequestParam("b_number") long b_number,Model model) {
			bs.hits(b_number);
			BoardDTO board = bs.detail(b_number);
			model.addAttribute("board",board);
			return "/board/detail";			
		}
		
		// 글 삭제하기
		@RequestMapping(value="delete", method=RequestMethod.GET)
		public String delete(@RequestParam("b_number") long b_number) {
			bs.delete(b_number);
			return "redirect:/board/paging"; 
		}
		
		// 글 수정페이지 열기
		@RequestMapping(value="update", method=RequestMethod.GET)
		public String updateform(@RequestParam("b_number") long b_number, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page) {
			BoardDTO board = bs.detail(b_number);
			model.addAttribute("board",board);
			model.addAttribute("page",page);
			return "board/update"; 
		}
		
		
		// 글 수정하기
		@RequestMapping(value="update", method=RequestMethod.POST)
		public String update(@ModelAttribute BoardDTO board, @RequestParam(value="page", required=false, defaultValue="1")int page) throws IllegalStateException, IOException {
			bs.update(board);
			return "redirect:/board/detail?b_number="+board.getB_number() + "&page=" + page;
		}
		
		// 검색기능
		@RequestMapping(value="search", method=RequestMethod.GET)
		public String search(@RequestParam("searchtype") String searchtype,@RequestParam("keyword") String keyword, Model model) {
			List<BoardDTO> bList= bs.search(searchtype, keyword);
			model.addAttribute("bList",bList);
			return "/board/review";
		}
		
}
