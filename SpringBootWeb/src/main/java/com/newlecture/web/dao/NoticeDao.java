package com.newlecture.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.newlecture.web.entity.Notice;
import com.newlecture.web.entity.NoticeView;

@Mapper
public interface NoticeDao {

//	@Result(property="userName", column="user_name")
//	@Results({
//		@Result(property="regdate", column="reg_date"),
//		@Result(property="userName", column="user_name")
//	})
//	@Select("select * from noticeView")
//	@Select("SELECT * FROM noticeView "
//			+ "WHERE ${field} LIKE '%${query}%' "
//			+ "ORDER BY regdate "
//			+ "LIMIT #{offset}, #{size}")
	
	List<NoticeView> getViewList(int offset, int size, String field, String query, boolean pub);
	int getCount(String field, String query, boolean pub);
	NoticeView getView(int id);

	Notice getPrev(int id);
	Notice getNext(int id);

	int update(Notice notice);
	int insert(Notice notice);
	int delete(int id);

	int deleteAll(int[] ids);

//	방법 1 : pub과 close를 쌍으로 직관적 처리가 가능하다
//	int updatePubAll(int[] pubIds, int[] closeIds);

//	방법 2 : close 해야할 글들 또는 open 해야할 글들만 모아서 두번에 걸쳐 처리해야 한다.
	int updatePubAll(int[] Ids, boolean pub);
}

