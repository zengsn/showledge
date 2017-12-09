package com.caitou.dto;

import java.io.Serializable;
import java.util.List;


/**
 * 
 * 
 * @author _wind
 *
 */


public class MapBean implements Serializable {
	
	private boolean expanded;
	private String id;
	private String topic;
	private String direction;
	
	private List<MapBean> children;

	public boolean isExpanded() {
		return expanded;
	}

	public void setExpanded(boolean expanded) {
		this.expanded = expanded;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public List<MapBean> getChildren() {
		return children;
	}

	public void setChildren(List<MapBean> children) {
		this.children = children;
	}

	@Override
	public String toString() {
		return "MapBean [expanded=" + expanded + ", id=" + id + ", topic=" + topic + ", direction=" + direction
				+ ", children=" + children + "]";
	}

	public MapBean(boolean expanded, String id, String topic, String direction, List<MapBean> children) {
		super();
		this.expanded = expanded;
		this.id = id;
		this.topic = topic;
		this.direction = direction;
		this.children = children;
	}

	public MapBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((topic == null) ? 0 : topic.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MapBean other = (MapBean) obj;
		if (topic == null) {
			if (other.topic != null)
				return false;
		} else if (!topic.equals(other.topic))
			return false;
		return true;
	}
	
	
	
	
	
}




































