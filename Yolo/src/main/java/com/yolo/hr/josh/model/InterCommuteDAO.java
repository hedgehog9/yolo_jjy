package com.yolo.hr.josh.model;

import java.util.List;
import java.util.Map;

public interface InterCommuteDAO {

	// 출근 메소드
	int commuteStart(String fk_empno);

	// 출근했는지 확인하는 메소드
	CommuteVO checkCommute(String fk_empno);

	// 퇴근 메소드
	int commuteEnd(Map<String, String> paraMap);

	// 특정사원의 일주일 출근기록을 가져오는 메소드
	List<CommuteVO> mycommute(Map<String, String> paraMap);

}
