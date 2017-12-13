package com.noshow.service;

import java.util.List;

import com.noshow.vo.Board;

public interface BoardService {
	
	/**
	 * 게시판 글 등록
	 * @param board
	 * @return
	 */
	int addBoard(Board board);
	
	/**
	 * 게시판 글 수정
	 * @param memberId
	 * @return
	 */
	void updateBoard(Board board);
	
	/**
	 * boardNum를 받아 글 삭제
	 * @param boardNum
	 * @return
	 */
	void deleteBoard(int boardNum);

	List<Board> boardList();
	
	Board boardListByNum(int boardNum);
}
