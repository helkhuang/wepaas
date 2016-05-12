package com.eit.wepaas.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.eit.wepaas.utils.Msg;

import io.rancher.Rancher;
import io.rancher.base.Filters;
import io.rancher.base.TypeCollection;
import io.rancher.service.RegistryCredentialService;
import io.rancher.service.RegistryService;
import io.rancher.type.Registry;
import io.rancher.type.RegistryCredential;

/**
 * 镜像仓库管理
 * @author helk
 * @since 1.0
 */
@Controller
@RequestMapping("/registry")
public class RegistryController {
	
	@Resource(name="rancherclient")
	private Rancher rancherClient;
	
	/**
	 * 镜像仓库列表
	 * @return
	 */
	@RequestMapping(value="/list")
	public String listRegistry(){
		return "registry/list";
	}
	
	/**
	 * 获取镜像仓库数据
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/data",produces="application/json;charset=UTF-8")
	@ResponseBody  
	public String queryRegistryData(HttpServletResponse response) throws IOException{
		//获取存储池
		RegistryService   registryService = 
				                     rancherClient.type(RegistryService.class);
		Filters filters = new Filters();
		filters.put("include", "credentials");
		TypeCollection<Registry> registrys = registryService.
				                                       list(filters).execute().body();
		//获取权限信息
		RegistryCredentialService   registryCredentialService = 
                rancherClient.type(RegistryCredentialService.class);
		List<Registry> registryArrayList = registrys.getData();
		List<Registry> newRegistryArrayList = new ArrayList<Registry>();
		for(Registry registry:registryArrayList){
			String registryId = registry.getId();
			Filters filter = new Filters();
			filter.put("registryId", registryId);
			TypeCollection<RegistryCredential> registryCredentials = 
					registryCredentialService.list(filters).execute().body();
			registry.setRegistryCredential(registryCredentials.getData().get(0));
			newRegistryArrayList.add(registry);
		}
		response.setContentType("application/json;charset=UTF-8");
		Map<String,Object> registryData = new HashMap<String,Object>();
		registryData.put("data", newRegistryArrayList);
		return JSON.toJSONString(registryData);
	}
	
	/**
	 * 添加镜像仓库
	 * @param name  用户名
	 * @param description 描述
	 * @param orchestration 类型  cattle Kubernetes swarm
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/add",produces="application/json;charset=UTF-8",method=RequestMethod.POST)
	public String addRegistry(String serverAddress,String email,
			                  String publicValue,
			                  String secretValue,
			                  HttpServletResponse response) throws IOException{
		RegistryService   registryService = 
                rancherClient.type(RegistryService.class);
		Registry registry = new Registry();
		registry.setServerAddress(serverAddress);
		Registry newRegistry = registryService.create(registry).execute().body();
		//add registryCredential
		String registryId = newRegistry.getId();
		RegistryCredentialService   registryCredentialService = 
                rancherClient.type(RegistryCredentialService.class);
		RegistryCredential registryCredential = new RegistryCredential();
		registryCredential.setRegistryId(registryId);
		registryCredential.setPublicValue(publicValue);
		registryCredential.setSecretValue(secretValue);
		RegistryCredential newRegistryCredential = 
				registryCredentialService.create(registryCredential).execute().body();
		response.setContentType("application/json;charset=UTF-8");
		Msg msg = new Msg(true,JSON.toJSONString(newRegistryCredential));
		return JSON.toJSONString(msg);
	}
}
