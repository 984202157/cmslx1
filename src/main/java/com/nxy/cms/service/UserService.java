package com.nxy.cms.service;

import com.github.pagehelper.PageInfo;
import com.nxy.cms.entity.User;

public interface UserService {

	PageInfo<User> selects(User user, Integer page, Integer pageSize);

	int updateUser(User user);
	
	/**
	 * 
	 * @Title: insert 
	 * @Description: 注册用户
	 * @param user
	 * @return
	 * @return: int
	 */
	int insert(User user);
	/**
	 * 
	 * @Title: selectByUsername 
	 * @Description: 根据用户查询查询用户是否存在
	 * @param username
	 * @return
	 * @return: User
	 */
	User selectByUsername(String username);


}
