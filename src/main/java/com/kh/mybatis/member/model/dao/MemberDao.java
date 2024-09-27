package com.kh.mybatis.member.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.kh.mybatis.member.model.vo.Member;

public class MemberDao {
	
	public Member loginMember(SqlSession sqlSession, Member m) {

		//Member loginUser = null;
		//sqlSession.selectOne("memberMapper.loginMember", m);
		//selectOne() : 조회된 결과가 없을 경우 null 반환
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public int insertMember(SqlSession sqlSession, Member m) {
		
		
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public int idConfirm(SqlSession sqlSession, Member m) {
		Member result = sqlSession.selectOne("memberMapper.idCheck", m);
		
		if(result != null) {
			return 1;
		} else {
			return 0;
		}
	}

	
	/*
	 * sqlSession 객체에서 제공하는 메소드를 통해 sql문을 실행하고 결과를 바로 받음
	 *  
	 * 결과 = sqlSession.SQL문 종류에 맞는 메소드("메퍼의 별칭.sql문의 id[, sql문 실행 시 필요한 데이터]);
	 *
	 */
}
