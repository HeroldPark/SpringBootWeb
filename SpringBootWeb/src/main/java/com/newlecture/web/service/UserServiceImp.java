package com.newlecture.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newlecture.web.dao.UserDao;
import com.newlecture.web.entity.User;
import com.newlecture.web.entity.UserView;

// @Component, @Service, @Controller, @Repository, @Configuration 모두 가능
@Service
public class UserServiceImp implements UserService {

	@Autowired
	private UserDao UserDao;
	
	@Override
	public List<UserView> getViewList(boolean pub) {
		// TODO Auto-generated method stub
		return getViewList(1, "title", "", pub);
	}

	@Override
	public List<UserView> getViewList(String field, String query, boolean pub) {
		// TODO Auto-generated method stub
		return getViewList(1, field, query, pub);
	}

	@Override
	public List<UserView> getViewList(int page, String field, String query, boolean pub) {
		int size = 10;
		int offset = 0 +(page-1)*size;	// page=1->0, 2->10, 3->20 => an=a1+(n-1)d => 0 +(page-1)*10
		List<UserView> list = UserDao.getViewList(offset, size, field, query, pub);
		return list;
	}

	@Override
	public int getCount(boolean pub) {
		// TODO Auto-generated method stub
		return getCount("title", "", pub);
	}

	@Override
	public int getCount(String field, String query, boolean pub) {
		// TODO Auto-generated method stub
		return UserDao.getCount(field, query, pub);
	}

	@Override
	public int updatePubAll(int[] pubIds, int[] closeIds) {
		int result = 0;
		result += UserDao.updatePubAll(pubIds, true);
		result += UserDao.updatePubAll(closeIds, false);
		
		return result;
	}
	
//	@Override
//	public int updatePubAll(int[] Ids, boolean pub) {
//		// TODO Auto-generated method stub
//		return UserDao.updatePubAll(Ids, pub);
//	}

	@Override
	public int deleteAll(int[] ids) {
		// TODO Auto-generated method stub
		return UserDao.deleteAll(ids);
	}
	
	@Override
	public int update(User User) {
		// TODO Auto-generated method stub
		return UserDao.update(User);
	}
	
	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return UserDao.delete(id);
	}

	@Override
	public int insert(User User) {
		// TODO Auto-generated method stub
		return UserDao.insert(User);
	}

	@Override
	public UserView getView(int id) {
		UserView User = UserDao.getView(id);
		return User;
	}

	@Override
	public User getNext(int id) {
		// TODO Auto-generated method stub
		return UserDao.getNext(id);
	}

	@Override
	public User getPrev(int id) {
		// TODO Auto-generated method stub
		return UserDao.getPrev(id);
	}
}
