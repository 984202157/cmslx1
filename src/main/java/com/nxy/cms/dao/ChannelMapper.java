package com.nxy.cms.dao;

import java.util.List;

import com.nxy.cms.entity.Category;
import com.nxy.cms.entity.Channel;

public interface ChannelMapper {
	List<Channel> selects();
	List<Category> selectsid(Integer ChannelId);
}
