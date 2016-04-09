package com.guanglumedia.cms.admin.entity;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.guanglumedia.common.util.StringUtils;

public class Resource implements Serializable{
  private static final long serialVersionUID = 3580102697353440729L;
  private String id;
  private Resource parent;
  private String resourcename;
  private String resourcedesc;
  private String parentId;
  private String action;
  private String status;
  private String sort;
  private String parentName;
  private String createtime;
  private String resourceId;
  
  public String getResourceId() {
    return resourceId;
}

public void setResourceId(String resourceId) {
    this.resourceId = resourceId;
}

private Set<Resource> children = new HashSet<Resource>(0);

  public String getParentName() {
	return parentName;
}

public void setParentName(String parentName) {
	this.parentName = parentName;
}

public String getResourcedesc() {
	return resourcedesc;
}

public void setResourcedesc(String resourcedesc) {
	this.resourcedesc = resourcedesc;
}

public String getCreatetime() {
	return createtime;
}

public void setCreatetime(String createtime) {
	this.createtime = createtime;
}

public String getAction() {
	return action;
}

public void setAction(String action) {
	this.action = action;
}

public String getSort() {
	return sort;
}

public void setSort(String sort) {
	this.sort = sort;
}

public String getResourcename() {
	return resourcename;
}

public void setResourcename(String resourcename) {
	this.resourcename = resourcename;
}



  public Set<Resource> getChildren(){
	  return this.children;
  }

  public void setChildren(Set<Resource> children) {
	  this.children = children;
  }

  public String getId() {
	  return this.id;
  }

  public void setId(String id) {
	  this.id = id;
  }

  public Resource getParent() {
	  return this.parent;
  }

  public void setParent(Resource parent) {
	  this.parent = parent;
  }




  public String getParentId() {
	  return this.parentId;
  }

  public void setParentId(String parentId) {
	  this.parentId = parentId;
  }


  public String getStatus() {
	  return this.status;
  }

  public void setStatus(String status) {
	  this.status = status;
  }

  public Resource(){
  }

  public Resource(String id, Resource parent, String resourcename,  String parentId,  String action,  String status, String sort,  String parentName, Set<Resource> children){
	  this.id = id;
	  this.parent = parent;
	  this.resourcename=resourcename;
	  this.parentId = parentId;
	  this.status = status;
	  this.action=action;
	  this.sort=sort;
	  this.parentName = parentName;
	  this.children = children;
  }

  public int hashCode(){
	  int result = 1;
	  result = 31 * result + (this.children == null ? 0 : this.children.hashCode());
	  result = 31 * result + (this.id == null ? 0 : this.id.hashCode());
	  result = 31 * result + (this.action == null ? 0 : this.action.hashCode());
	  result = 31 * result + (this.resourcename == null ? 0 : this.resourcename.hashCode());
	  result = 31 * result + (this.sort == null ? 0 : this.sort.hashCode());
	  result = 31 * result + (this.parent == null ? 0 : this.parent.hashCode());
	  result = 31 * result + (this.parentId == null ? 0 : this.parentId.hashCode());
	  result = 31 * result + (this.parentName == null ? 0 : this.parentName.hashCode());
	  result = 31 * result + (this.status == null ? 0 : this.status.hashCode());
	  return result;
  	}

  	public boolean equals(Object obj){
  		if (obj == null)
  			return false;
  		if ((obj instanceof Resource)) {
  			Resource resources = (Resource)obj;
  			if ((this.resourcename == null) && (resources.resourcename == null)) {
  				return true;
  			}
  			if ((!StringUtils.isEmpty(resources.resourcename)) && (this.resourcename.equals(resources.resourcename))) {
  				return true;
  			}
  		}
  		return false;
  	}
}