package com.nxy.cms.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nxy.cms.entity.Category;
import com.nxy.cms.entity.Channel;
import com.nxy.cms.service.ChannelService;

@RequestMapping("channel")
@Controller
public class ChannelController {
	@Resource
	private ChannelService channelService;
	
	@ResponseBody
	@RequestMapping("channels")
	public List<Channel> channels(){
		return channelService.selects();
	}
	
	@ResponseBody
	@RequestMapping("selectsid")
	public List<Category> selectsid(Integer channelId){
		return channelService.selectsid(channelId);
	}
 }
