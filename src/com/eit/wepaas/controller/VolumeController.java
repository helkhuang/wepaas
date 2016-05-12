package com.eit.wepaas.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
import io.rancher.service.ProjectService;
import io.rancher.service.StoragePoolService;
import io.rancher.service.VolumeService;
import io.rancher.type.Account;
import io.rancher.type.StoragePool;
import io.rancher.type.Volume;

/**
 * 磁盘管理
 * @author helk
 * @since 1.0
 */
@Controller
@RequestMapping("/volume")
public class VolumeController {
	
	@Resource(name="rancherclient")
	private Rancher rancherClient;
	
	/**
	 * 磁盘列表
	 * @return
	 */
	@RequestMapping(value="/list")
	public String listVolume(){
		return "volume/list";
	}
	
	/**
	 * 添加磁盘
	 * @param name  磁盘名称
	 * @param description  磁盘描述
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/add",produces="application/json;charset=UTF-8",method=RequestMethod.POST)
	public String addVolume(String name,String description,HttpServletRequest request,
			                  HttpServletResponse response) throws IOException{
		String[] keys = request.getParameterValues("key");
		String[] values = request.getParameterValues("value");
		String poolId = request.getParameter("poolId");
		poolId = "1sp7";
		String pid = "1a5";
		Map<String,Object> driverOpts = new HashMap<String,Object>();
		for(int i=0;i<keys.length;i++){
			driverOpts.put(keys[i], values[i]);
		}
		Volume volume = new Volume();
		volume.setName(name);
		//volume.setAccountId(pid);
		volume.setDescription(description);
		volume.setDriver("convoy-gluster");
		volume.setDriverOpts(driverOpts);
		VolumeService   volumeService = 
                rancherClient.type(VolumeService.class);
		Volume newVolume = volumeService.create(volume).execute().body();
		response.setContentType("application/json;charset=UTF-8");
		Msg msg = new Msg(true,JSON.toJSONString(newVolume));
		System.out.println(JSON.toJSONString(msg));
		return JSON.toJSONString(msg);
	}
	
	/**
	 * 获取磁盘数据
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/data",produces="application/json;charset=UTF-8")
	@ResponseBody  
	public String queryVolumeData(HttpServletResponse response) throws IOException{
		//获取存储池
		StoragePoolService   storagePoolService = 
				                     rancherClient.type(StoragePoolService.class);
		Filters filters = new Filters();
		filters.put("driverName", "convoy-gluster");
		TypeCollection<StoragePool> storagePools = storagePoolService.
				                                       list(filters).execute().body();
		List<Volume> volumes = new ArrayList<Volume>();
		String gb_storeagePool_id = "";
		for(StoragePool storagePool:storagePools.getData()){
			String storagePoolId = storagePool.getId();
			gb_storeagePool_id = storagePoolId;
			TypeCollection<Volume> volume = 
					storagePoolService.volumes(storagePoolId).execute().body();
			List<Volume> volumest = volume.getData();
			for(Volume vl:volumest){
				vl.setStoragePoolId(storagePoolId);
				volumes.add(vl);
			}
		}
		Map<String,Object> volumeMap = new HashMap<String,Object>();
		volumeMap.put("data", volumes);
		volumeMap.put("poolId", gb_storeagePool_id);
		response.setContentType("application/json;charset=UTF-8");
		return JSON.toJSONString(volumeMap);
	}
	
	/**
	 * 激活存储卷
	 * @param clusterIds 删除集群编号数组
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/activate",produces="application/json;charset=UTF-8",
			        method=RequestMethod.POST)
	public String activateVolume(String ids,
			                  HttpServletResponse response) throws IOException{
		String[] volumeIdArrays = ids.split(",");
		VolumeService volumeService = rancherClient.type(VolumeService.class);
		for(String volumeId:volumeIdArrays){
			Volume volume = volumeService.activate(volumeId).execute().body();
			response.setContentType("application/json;charset=UTF-8");
		}
		Msg msg = new Msg(true,"");
		return JSON.toJSONString(msg);
	}
	
	/**
	 * 禁用存储卷
	 * @param clusterIds 删除集群编号数组
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/deactivate",produces="application/json;charset=UTF-8",
			        method=RequestMethod.POST)
	public String deactivateCluster(String ids,
			                  HttpServletResponse response) throws IOException{
		String[] volumeIdArrays = ids.split(",");
		VolumeService volumeService = rancherClient.type(VolumeService.class);
		for(String volumeId:volumeIdArrays){
			Volume volume = volumeService.deactivate(volumeId).execute().body();
			response.setContentType("application/json;charset=UTF-8");
		}
		Msg msg = new Msg(true,"");
		return JSON.toJSONString(msg);
	}
}
