package com.nxy.cms.service;

import java.util.List;

import com.nxy.cms.entity.Category;
import com.nxy.cms.entity.Channel;

public interface ChannelService {
	List<Channel> selects();
	List<Category> selectsid(Integer ChannelId);
}
