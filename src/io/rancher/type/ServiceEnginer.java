/**
 * 
 */
package io.rancher.type;

/**
 * 执行引擎枚举类
 * @author helk
 *
 */
public enum ServiceEnginer {
	Cattle("cattle"),Kubernetes("kubernetes"),Swarm("swarm");
	private String value;
	
	ServiceEnginer(String value){
		this.value = value;
	}
	
	public String value(){
		return value;
	}
}
