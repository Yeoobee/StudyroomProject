package com.icia.study.service;

import java.util.List;

import com.icia.study.dto.MemberDTO;

public interface MemberService {

	void signup(MemberDTO member);

	String idDuplicate(String m_id);

	String signin(MemberDTO member);

	List<MemberDTO> memberlist();

	void delete(long m_number);

	MemberDTO findById(long m_number);

}
