package com.eit.wepaas.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;

import io.rancher.Rancher;
import io.rancher.base.Filters;
import io.rancher.base.TypeCollection;
import io.rancher.service.EnvironmentService;
import io.rancher.service.ServiceService;
import io.rancher.type.Environment;
import io.rancher.type.Service;

/**
 * 我的应用管理
 * @author helk
 * @since 1.0
 */
@Controller
@RequestMapping("/application")
public class ApplicationController {
	
	@Resource(name="rancherclient")
	private Rancher rancherClient;
	
	/**
	 * 我的应用列表
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/own/list")
	public String listApplication(Model model) throws IOException{
		EnvironmentService environmentService = rancherClient.type(EnvironmentService.class);
		TypeCollection<Environment> environments = 
				                         environmentService.list().execute().body();
		model.addAttribute("environments", environments.getData());
		return "application/own/list";
	}
	
	/**
	 * 我的应用服务详情页面
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/own/service/detail")
	public String listApplicationServiceDetail(Model model,String serviceId) 
			                                         throws IOException{
		ServiceService serviceService = rancherClient.type(ServiceService.class);
		Service service = serviceService.get(serviceId).execute().body();
		System.out.println(JSON.toJSONString(service));
		model.addAttribute("service", service);
		return "application/own/service/detail";
	}
	
	/**
	 * 我的应用详情页面
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/own/detail")
	public String listApplicationDetail(Model model,String envId,String name) 
			                                         throws IOException{
		ServiceService serviceService = rancherClient.type(ServiceService.class);
		Filters filters = new Filters();
		filters.put("environmentId", envId);
		TypeCollection<Service> services = 
				serviceService.list(filters).execute().body();
		List<Service> servicesList = services.getData();
		int servicesNum = 0;
		int containerNum = 0;
		if(servicesList!=null&&servicesList.size()>0){
			for(Service service:servicesList){
				containerNum = containerNum + service.getInstances().size();
			}
			servicesNum = servicesList.size();
		}else{
			servicesList = new ArrayList<Service>();
		}
		System.out.println(JSON.toJSONString(servicesList));
		model.addAttribute("services", servicesList);
		model.addAttribute("servicesNum", servicesNum);
		model.addAttribute("containerNum", containerNum);
		model.addAttribute("appname",name);
		return "application/own/detail";
	}
}
