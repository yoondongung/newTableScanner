package com.noshow.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.noshow.dao.MemberDao;
import com.noshow.service.MemberService;
import com.noshow.vo.Authority;
import com.noshow.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao dao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	@Transactional
	public void addMember(Member member, String role) {
		member.setMemberPassword(passwordEncoder.encode(member.getMemberPassword()));
		dao.insertMember(member);
		dao.insertAuthority(new Authority(member.getMemberId(), role));
/*		if(role.equals("ROLE_ADMIN")) {
			dao.insertAuthority(new Authority(member.getMemberId(), "ROLE_MEMBER"));
		}*/
	}

	@Override
	public Member getUserByMemberId(String MemberId) {
		return dao.selectMemberByMemberId(MemberId);
	}

	@Override
	public void updateUserProfile(Member member) {
		member.setMemberPassword(passwordEncoder.encode(member.getMemberPassword()));
		dao.updateMemberByMemberId(member);
		System.out.println(member);
	}
	

	
}
