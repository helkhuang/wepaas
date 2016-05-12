package io.rancher.type;

import java.util.Collection;
import java.util.Map;

import io.rancher.base.AbstractType;

public class Templates extends AbstractType {
    
    private Map<String, Object> data;
    
    private Map<String, Object> links;
    
    private String name;
    
    public String getReadme() {
		return readme;
	}

	public void setReadme(String readme) {
		this.readme = readme;
	}

	private String readme;
    
    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Map<String, Object> getLinks() {
		return links;
	}

	public void setLinks(Map<String, Object> links) {
		this.links = links;
	}

	private String path;
    
    public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

//	public String getUpgradeVersionLinks() {
//		return upgradeVersionLinks;
//	}
//
//	public void setUpgradeVersionLinks(String upgradeVersionLinks) {
//		this.upgradeVersionLinks = upgradeVersionLinks;
//	}

	public String getCatalogId() {
		return catalogId;
	}

	public void setCatalogId(String catalogId) {
		this.catalogId = catalogId;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDefaultVersion() {
		return defaultVersion;
	}

	public void setDefaultVersion(String defaultVersion) {
		this.defaultVersion = defaultVersion;
	}

	//private String upgradeVersionLinks;
    
    public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLastUpdated() {
		return lastUpdated;
	}

	public void setLastUpdated(String lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	private String description;
    
    private String lastUpdated;
    
    private String message;
    
    private String state;
    
    private String uri;
    
    private String catalogId;
    
    private String category;
    
    private String defaultVersion;
    
    private Map<String,Object> versionLinks;
    
    private String lastestVersionId;
    
    public String getLastestVersionId() {
    	Collection<Object> versionLinksValues = versionLinks.values();
    	int size = versionLinksValues.size();
    	String lastestId = (String)versionLinksValues.toArray()[size-1];
    	this.lastestVersionId = lastestId.split("/")[5];
		return lastestVersionId;
	}

	public void setLastestVersionId(String lastestVersionId) {
		this.lastestVersionId = lastestVersionId;
	}

	public Map<String, Object> getVersionLinks() {
		return versionLinks;
	}

	public void setVersionLinks(Map<String,Object> versionLinks) {
		this.versionLinks = versionLinks;
	}

	public String getResourceType() {
		return resourceType;
	}

	public void setResourceType(String resourceType) {
		this.resourceType = resourceType;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	private String resourceType;
    
    private String type;
    
    private String transitioning;
    
    private String transitioningMessage;
    
    private Integer transitioningProgress;
    
    public Map<String, Object> getData() {
        return this.data;
    }

    public void setData(Map<String, Object> data) {
      this.data = data;
    }
    
    
    
    
    public String getTransitioning() {
        return this.transitioning;
    }

    public void setTransitioning(String transitioning) {
      this.transitioning = transitioning;
    }
    
    public String getTransitioningMessage() {
        return this.transitioningMessage;
    }

    public void setTransitioningMessage(String transitioningMessage) {
      this.transitioningMessage = transitioningMessage;
    }
    
    public Integer getTransitioningProgress() {
        return this.transitioningProgress;
    }

    public void setTransitioningProgress(Integer transitioningProgress) {
      this.transitioningProgress = transitioningProgress;
    }
    
}
