package com.newlecture.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.newlecture.web.entity.Notice;
import com.newlecture.web.entity.NoticeView;

@Mapper
public interface NoticeDao {

//	@Result(property="memberName", column="member_name")
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
//	방법 1
//	int updatePubAll(int[] pubIds, int[] closeIds);
//	방법 2
	int updatePubAll(int[] Ids, boolean pub);
}

