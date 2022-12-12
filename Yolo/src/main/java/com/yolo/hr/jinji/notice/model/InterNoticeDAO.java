package com.yolo.hr.jinji.notice.model;

import java.util.List;
import java.util.Map;

public interface InterNoticeDAO {

	// 전체 부서 조회하기
	List<Map<String, String>> getDeptList();

	// 체크된 부서 목록 가져오기
	List<Map<String, String>> getChooseDept(String str_empno);
	
	// 공지글 작성하기
	void getSenNotice(NoticeVO noticevo);

	// 전체 공지 리스트 보여주기
	List<Map<String, String>> getAllNoticeList(String empno);

	// 전체 공지사항 공지글 1개 보여주기(ajax)
	Map<String, String> showNoticeContent(String notino);

	// 공지 작성시 해당 공지 받는 사원 번호 알아오기
	List<String> getEmpnoList(String fk_deptno);

	// seq 최신 공지번호 알아오기
	String getSeqNotino(String empno);

	// 내가 쓴 공지리스트 기져오기
	List<Map<String, String>> getMyNoticeList(String empno);

	// 내가 쓴 공지사항 공지글 1개 보여주기(ajax)
	Map<String, String> showMyNoticeContent(String notino);

	// 로그인 유저가 속해 있는 부서의 해당 공지 리스트 보여주기
	List<Map<String, String>> depNoticeList(String fk_deptno);

	// 부서 공지리스트 공지 1개 내용 조회하기(ajax)
	Map<String, String> showDeptNoticeContent(String notino);

	// 공지글 수정을 위한 원래 공지글 조회하기
	NoticeVO getEditNotice(String notino);


		
}
