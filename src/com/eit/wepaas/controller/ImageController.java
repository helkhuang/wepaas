package com.eit.wepaas.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import io.rancher.Rancher;
import io.rancher.base.TypeCollection;
import io.rancher.service.ImageService;
import io.rancher.type.Image;

/**
 * 镜像管理
 * @author helk
 * @since 1.0
 */
@Controller
@RequestMapping("/image")
public class ImageController {
	
	@Resource(name="rancherclient")
	private Rancher rancherClient;
	
	/**
	 * 镜像列表
	 * @return
	 */
	@RequestMapping(value="/list")
	public String listImage(){
		return "image/list";
	}
	
	/**
	 * 镜像列表
	 * @return
	 */
	@RequestMapping(value="/build/list")
	public String listBuildImage(){
		return "image/build/list";
	}
	
	/**
	 * 镜像列表
	 * @return
	 */
	@RequestMapping(value="/build/new")
	public String  newBuildImage(){
		return "image/build/new";
	}
	
	/**
	 * 获取集群数据
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/data",produces="application/json;charset=UTF-8")
	@ResponseBody  
	public String queryImageData(HttpServletResponse response) throws IOException{
		//ProjectService projectService = rancherClient.type(ProjectService.class);
		ImageService imageService = rancherClient.type(ImageService.class);
		TypeCollection<Image> images = imageService.list().execute().body();
		response.setContentType("application/json;charset=UTF-8");
		return JSON.toJSONString(images);
	}
}
