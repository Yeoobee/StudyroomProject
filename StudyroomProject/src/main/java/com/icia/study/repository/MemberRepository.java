package com.icia.study.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.study.dto.MemberDTO;

@Repository
public class MemberRepository {
	@Autowired
	private SqlSessionTemplate sql;
	
	public void signup(MemberDTO member) {
		sql.insert("Member.signup", member);
		
	}

	public String idDuplicate(String m_id) {
		return sql.selectOne("Member.idDuplicate", m_id);
	}

	public MemberDTO signin(MemberDTO member) {
		return sql.selectOne("Member.signin",member);
	}

	public List<MemberDTO> memberlist() {
		return sql.selectList("Member.memberlist");
	}

	public void delete(long m_number) {
		sql.delete("Member.delete",m_number);
		
	}

	public MemberDTO findById(long m_number) {
		return sql.selectOne("Member.findById",m_number);
	}

}
