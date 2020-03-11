package com.nxy.cms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nxy.cms.dao.ChannelMapper;
import com.nxy.cms.entity.Category;
import com.nxy.cms.entity.Channel;
import com.nxy.cms.service.ChannelService;

@Service
public class ChannelServiceImpl implements ChannelService {
	@Resource
	private ChannelMapper channelMapper;
	@Override
	public List<Channel> selects() {
		// TODO Auto-generated method stub
		return channelMapper.selects();
	}
	@Override
	public List<Category> selectsid(Integer ChannelId) {
		// TODO Auto-generated method stub
		return channelMapper.selectsid(ChannelId);
	}
	

}
