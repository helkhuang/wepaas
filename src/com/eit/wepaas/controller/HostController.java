package com.eit.wepaas.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import io.rancher.Rancher;
import io.rancher.base.Filters;
import io.rancher.base.TypeCollection;
import io.rancher.service.HostService;
import io.rancher.service.RegistrationTokenService;
import io.rancher.type.Host;
import io.rancher.type.RegistrationToken;

/**
 * 主机管理
 * @author helk
 * @since 1.0
 */
@Controller
@RequestMapping("/host")
public class HostController {
	
	@Resource(name="rancherclient")
	private Rancher rancherClient;
	
	/**
	 * 主机列表
	 * @return
	 */
	@RequestMapping(value="/list")
	public String listHost(){
		return "host/list";
	}
	
	/**
	 * 主机详细页面
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/info")
	public String queryHostInfo(String hostId,Model model) throws IOException{
		HostService hostService = rancherClient.type(HostService.class);
		Host host = hostService.get(hostId).execute().body();
		
		model.addAttribute("host", host);
		return "host/xq";
	}
	
	/**
	 * 获取主机数据
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/data",produces="application/json;charset=UTF-8")
	@ResponseBody  
	public String queryHostData(HttpServletResponse response) throws IOException{
		//ProjectService projectService = rancherClient.type(ProjectService.class);
		HostService hostService = rancherClient.type(HostService.class);
		TypeCollection<Host> hosts = hostService.list().execute().body();
		response.setContentType("application/json;charset=UTF-8");
		return JSON.toJSONString(hosts);
	}
	
	/**
	 * 获取主机数据
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/registrationtokens",produces="application/json;charset=UTF-8")
	@ResponseBody  
	public String queryRegistrationtokens(String accountId, HttpServletResponse response) throws IOException{
		//ProjectService projectService = rancherClient.type(ProjectService.class);
		RegistrationTokenService registrationTokenService = rancherClient.type(RegistrationTokenService.class);
		Filters filters = new Filters();
		filters.put("accountId", accountId);
		TypeCollection<RegistrationToken> registrationToken = 
				                   registrationTokenService.list(filters).execute().body();
		response.setContentType("application/json;charset=UTF-8");
		return JSON.toJSONString(registrationToken);
	}
}
