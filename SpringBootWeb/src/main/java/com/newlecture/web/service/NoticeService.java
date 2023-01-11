package com.newlecture.web.service;

import java.sql.SQLException;
import java.util.List;

import com.newlecture.web.entity.Notice;
import com.newlecture.web.entity.NoticeView;

public interface NoticeService {

	// 페이지 요청할때
	List<NoticeView> getViewList(boolean pub);
	
	// 검색 요청할때
	List<NoticeView> getViewList(String field, String query, boolean pub);
	
	// 페이지 요청할때
	List<NoticeView> getViewList(int page, String field, String query, boolean pub);
	
	int getCount(boolean pub);
	
	int getCount(String field, String query, boolean pub);

	//	List<NoticeView> getList();
	
	// 자세한 페이지 요청할때
	NoticeView getView(int id);
	
	Notice getNext(int id);
	
	Notice getPrev(int id);

	int updatePubAll(int[] pubids, int[] closeIds);
//	int updatePubAll(int[] Ids, boolean pub);
	
	int deleteAll(int[] ids);

	int update(Notice notice) throws SQLException, ClassNotFoundException;
	int delete(int id) throws ClassNotFoundException, SQLException;
	int insert(Notice notice) throws SQLException, ClassNotFoundException;	
}
