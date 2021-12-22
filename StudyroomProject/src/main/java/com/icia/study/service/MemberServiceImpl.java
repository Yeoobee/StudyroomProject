package com.icia.study.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.study.dto.MemberDTO;
import com.icia.study.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberRepository mr;
	@Autowired
	private HttpSession session;
	
	@Override
	public void signup(MemberDTO member) {
		mr.signup(member);
	}

	@Override
	public String idDuplicate(String m_id) {
		String result = mr.idDuplicate(m_id);
		if(result==null) {
			return "ok";
		}else {
			return "no";
		}
	}

	@Override
	public String signin(MemberDTO member) {
		// member는 회원가입할 때 화면에서 담아온 데이터고 loginMEmber는 DB에서 가져온 데이터고 구분을 잘해야해요 
		MemberDTO loginMember = mr.signin(member);
		// 두개를 출력해서 비교해봐요 그럼 아마 어디가 잘못됐는지 확인될겁니다
		// System.out.println(member.toString());
		// System.out.println(loginMember.toString()); // 다시 실행해서 여기 잘 나오나 확인
		if(loginMember!=null) {
			session.setAttribute("loginId", member.getM_id());
			session.setAttribute("loginName", loginMember.getM_name());	// member에는 id, pw 만 있겠죠.. 이름은 loginMember에 있을거고 다시해봐요
			session.setAttribute("loginNumber", loginMember.getM_number());	
			session.setAttribute("loginPassword", loginMember.getM_password());	
			return "redirect:/";
		} else {
			return "member/signin";
		}
	}

	@Override
	public List<MemberDTO> memberlist() {
		List<MemberDTO> mList = mr.memberlist();
		for(MemberDTO m: mList) {
			System.out.println(m);
		}
		return mList;
	}

	@Override
	public void delete(long m_number) {
		mr.delete(m_number);
		
	}

	@Override
	public MemberDTO findById(long m_number) {
		MemberDTO member = mr.findById(m_number);
		return member;
	}

}
