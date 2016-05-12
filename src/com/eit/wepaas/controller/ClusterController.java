package com.eit.wepaas.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.eit.wepaas.utils.Msg;

import io.rancher.Rancher;
import io.rancher.base.TypeCollection;
import io.rancher.service.ProjectService;
import io.rancher.type.Account;
import io.rancher.type.Project;
import io.rancher.type.ServiceEnginer;

/**
 * 集群管理
 * @author helk
 * @since 1.0
 */
@Controller
@RequestMapping("/cluster")
public class ClusterController {
	
	@Resource(name="rancherclient")
	private Rancher rancherClient;
	
	
	
	/**
	 * 集群列表
	 * @return
	 */
	@RequestMapping(value="/list")
	public String listCluster(){
		return "cluster/list";
	}
	
	/**
	 * 添加集群
	 * @param name  用户名
	 * @param description 描述
	 * @param orchestration 类型  cattle Kubernetes swarm
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/add",produces="application/json;charset=UTF-8",method=RequestMethod.POST)
	public String addCluster(String name,String description,String orchestration,
			                  HttpServletResponse response) throws IOException{
		Project project = new Project();
		project.setName(name);
		project.setDescription(description);
		if(ServiceEnginer.Cattle.value().equals(orchestration)){
			project.setKubernetes(false);
			project.setSwarm(false);
		}else if(ServiceEnginer.Kubernetes.value().equals(orchestration)){
			project.setKubernetes(true);
			project.setSwarm(false);
		}else if(ServiceEnginer.Swarm.value().equals(orchestration)){
			project.setKubernetes(false);
			project.setSwarm(true);
		}
		ProjectService projectService = rancherClient.type(ProjectService.class);
		Project newProject = projectService.create(project).execute().body();
		response.setContentType("application/json;charset=UTF-8");
		Msg msg = new Msg(true,JSON.toJSONString(newProject));
		System.out.println(JSON.toJSONString(msg));
		return JSON.toJSONString(msg);
	}
	
	/**
	 * 删除集群
	 * @param clusterIds 删除集群编号数组
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/delete",produces="application/json;charset=UTF-8",
			        method=RequestMethod.POST)
	public String deleteCluster(String clusterIds,
			                  HttpServletResponse response) throws IOException{
		String[] clusterIdArrays = clusterIds.split(",");
		ProjectService projectService = rancherClient.type(ProjectService.class);
		for(String clusterId:clusterIdArrays){
			okhttp3.ResponseBody responseBody = projectService.delete(clusterId).execute().body();
			response.setContentType("application/json;charset=UTF-8");
		}
		Msg msg = new Msg(true,"");
		return JSON.toJSONString(msg);
	}
	
	/**
	 * 激活集群
	 * @param clusterIds 删除集群编号数组
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/activate",produces="application/json;charset=UTF-8",
			        method=RequestMethod.POST)
	public String activateCluster(String ids,
			                  HttpServletResponse response) throws IOException{
		String[] clusterIdArrays = ids.split(",");
		ProjectService projectService = rancherClient.type(ProjectService.class);
		for(String clusterId:clusterIdArrays){
			Account account = projectService.activate(clusterId).execute().body();
			response.setContentType("application/json;charset=UTF-8");
		}
		Msg msg = new Msg(true,"");
		return JSON.toJSONString(msg);
	}
	
	/**
	 * 禁用集群
	 * @param clusterIds 删除集群编号数组
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/deactivate",produces="application/json;charset=UTF-8",
			        method=RequestMethod.POST)
	public String deactivateCluster(String ids,
			                  HttpServletResponse response) throws IOException{
		String[] clusterIdArrays = ids.split(",");
		ProjectService projectService = rancherClient.type(ProjectService.class);
		for(String clusterId:clusterIdArrays){
			Account account = projectService.deactivate(clusterId).execute().body();
			response.setContentType("application/json;charset=UTF-8");
		}
		Msg msg = new Msg(true,"");
		return JSON.toJSONString(msg);
	}
	
	/**
	 * 获取集群数据
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/data",produces="application/json;charset=UTF-8")
	@ResponseBody  
	public String queryClusterData(HttpServletResponse response) throws IOException{
		//ProjectService projectService = rancherClient.type(ProjectService.class);
		ProjectService projectService = rancherClient.type(ProjectService.class);
		TypeCollection<Project> projects = projectService.list().execute().body();
		response.setContentType("application/json;charset=UTF-8");
		return JSON.toJSONString(projects);
	}
}
