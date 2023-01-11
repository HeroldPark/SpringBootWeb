package com.newlecture.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.newlecture.web.entity.User;
import com.newlecture.web.entity.UserView;

@Mapper
public interface UserDao {

	List<UserView> getViewList(int offset, int size, String field, String query, boolean pub);

	int getCount(String field, String query, boolean pub);

	int updatePubAll(int[] pubIds, boolean b);

	int deleteAll(int[] ids);

	int update(User user);

	int delete(int id);

	int insert(User user);

	UserView getView(int id);

	User getPrev(int id);

	User getNext(int id);

}
