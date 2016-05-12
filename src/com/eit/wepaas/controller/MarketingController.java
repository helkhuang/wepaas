package com.eit.wepaas.controller;

import java.io.IOException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import io.rancher.Rancher;
import io.rancher.base.TypeCollection;
import io.rancher.service.TemplateReadmeService;
import io.rancher.service.TemplatesService;
import io.rancher.type.Templates;
import okhttp3.Response;
import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;

/**
 * 云应用市场管理
 * @author helk
 * @since 1.0
 */
@Controller
@RequestMapping("/marketing")
public class MarketingController {
	
	@Resource(name="rancherCatalogClient")
	private Rancher rancherCatalogClient;
	
	/**
	 * 云应用列表
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/app/list")
	public String listMarketingApp(Model model) throws IOException{
		TemplatesService templatesService = rancherCatalogClient.type(TemplatesService.class);
		TypeCollection<Templates> templates =  templatesService.list().execute().body();
		model.addAttribute("templates", templates.getData());
		return "marketing/app/list";
	}
	
	/**
	 * 云应用列表
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/app/detail")
	public String listMarketingApp(String id,Model model) throws IOException{
		TemplatesService templatesService = rancherCatalogClient.type(TemplatesService.class);
		Templates template =  templatesService.get(id).execute().body();
		//获取readme
		TemplateReadmeService readmeService = rancherCatalogClient.type(TemplateReadmeService.class);
		//readmeService.
		ResponseBody readmeBody = readmeService.get(id).execute().body();
		String readme = readmeBody.string();
		template.setReadme(readme);
		model.addAttribute("template", template);
		return "marketing/app/detail";
	}
}
