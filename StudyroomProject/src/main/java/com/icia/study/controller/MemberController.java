package com.icia.study.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icia.study.dto.MemberDTO;
import com.icia.study.service.MemberService;

@Controller
@RequestMapping(value="/member/*")
public class MemberController {
	@Autowired
	private MemberService ms;
	
	// 로그인창 열기
	@RequestMapping(value="signin", method=RequestMethod.GET)
	public String signinform() {
		return "/member/signin";
	}
	
	// 회원가입창 열기
		@RequestMapping(value="signup", method=RequestMethod.GET)
		public String signupform() {
			return "/member/signup";
		}
	// 회원가입 DB 저장
	@RequestMapping(value="signup", method=RequestMethod.POST)
	public String signup(@ModelAttribute MemberDTO member) {
		ms.signup(member);
		return "redirect:/";
	}
	
	// 아이디 중복확인 체크
	@RequestMapping(value="idDuplicate", method=RequestMethod.POST)
	public @ResponseBody String idDuplicate(@RequestParam("m_id") String m_id) {
		String result = ms.idDuplicate(m_id);
		return result;
	}
	
	// 로그인
	@RequestMapping(value="signin",method=RequestMethod.POST)
	public String signin(@ModelAttribute MemberDTO member) {
		String result = ms.signin(member);
		return result;
	}
	
	// 로그아웃
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	} 
	
	// 회원리스트 창 열기
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String memberlist(Model model) {
		List<MemberDTO> mList = ms.memberlist();
		model.addAttribute("mList",mList);
		return "/member/list";
	}
	
	// 회원삭제
	@RequestMapping(value="delete",method=RequestMethod.GET)
	public String delete(@RequestParam("m_number") long m_number) {
		ms.delete(m_number);
		return "redirect:/member/list";
	}
	
	// 마이페이지
	@RequestMapping(value="findById", method=RequestMethod.GET)
	public String findById(@RequestParam("m_number") long m_number, Model model) {
		MemberDTO member = ms.findById(m_number);
		model.addAttribute("member",member);
		return "/member/findById";
	}

	
}
