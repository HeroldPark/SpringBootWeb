package com.newlecture.web.service;

import java.util.List;

import com.newlecture.web.entity.User;
import com.newlecture.web.entity.UserView;

public interface UserService {

	List<UserView> getViewList(int page, String field, String query, boolean pub);

	List<UserView> getViewList(boolean pub);

	List<UserView> getViewList(String field, String query, boolean pub);

	int getCount(boolean pub);

	int getCount(String field, String query, boolean pub);

	int updatePubAll(int[] pubIds, int[] closeIds);

	int deleteAll(int[] ids);

	int update(User User);

	int delete(int id);

	int insert(User User);

	UserView getView(int id);

	User getNext(int id);

	User getPrev(int id);

}
