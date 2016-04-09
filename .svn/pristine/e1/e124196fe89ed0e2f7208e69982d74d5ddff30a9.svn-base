package com.guanglumedia.cms.admin.service;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.cms.admin.dao.ResourceDao;
import com.guanglumedia.cms.admin.dao.RoleDao;
import com.guanglumedia.cms.admin.entity.Resource;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.common.tinytree.TinyTreeBean;
import com.guanglumedia.common.util.StringUtils;

@Service
public class ResourceService {
	@Autowired
	private ResourceDao resourcedao;
	@Autowired
	private RoleDao roledao;
	@Transactional
	public PagedModelList<Resource> findAllResourceList(Resource resource,int pageNo, int pageRow) throws UnsupportedEncodingException {
	    if (resource.getResourcename()!= null) {
            String resourcename = new String(resource.getResourcename().getBytes("ISO-8859-1"), "utf-8");
            resource.setResourcename(resourcename);
        }
	    if (resource.getResourcedesc() != null) {
            String resourcedesc = new String(resource.getResourcedesc().getBytes("ISO-8859-1"), "utf-8");
            resource.setResourcedesc(resourcedesc);
        }
	    if (resource.getAction() != null) {
            String action = new String(resource.getAction().getBytes("ISO-8859-1"), "utf-8");
            resource.setAction(action);;
        }
	    
	    List<Resource> list = this.resourcedao.findResourceList(resource, new RowBounds((pageNo - 1) * pageRow, pageRow));
		int count=this.resourcedao.findCount();
		PagedModelList<Resource> pml = new PagedModelList<Resource>(pageNo, pageRow, count);
		pml.addModels(list);
		return pml;
	}
	public int AddResource(Resource resource) {
		return this.resourcedao.addResource(resource);
	}
	public int UpdateResource(Resource resource) {
		return this.resourcedao.updateResource(resource);
	}
	public Resource getResourceById(int id) {
		return this.resourcedao.getResourceById(id);
	}
	public int DelResource(int id) {
		return this.resourcedao.delResource(id);
	}
	public List<Resource> findResourceList() {
		return this.resourcedao.findAllResourceList();
	}
	public String bindResourceTree(int id) {
		JSONArray result=new JSONArray();
		List<Resource> resources=this.resourcedao.findAllResourceList();
		Set<String> select = this.roledao.findRoleResource(id);
		Map<String,List<Resource>>ResourceMap=new HashMap<String,List<Resource>>();
		for (Resource each : resources) {
			if(ResourceMap.containsKey(each.getParentId())){
				ResourceMap.get(each.getParentId()).add(each);
			}else{
				List<Resource> chidrens=new ArrayList<Resource>();
				chidrens.add(each);
				ResourceMap.put(each.getParentId(),chidrens);
			}
		}
		for (Resource each : resources) {
			if("0".equals(each.getParentId())){
				JSONObject job=new JSONObject();
				job.put("id",each.getId());
				job.put("name",each.getResourcename());
				job.put("checked",select.contains(each.getId()));
				JSONArray ja=new JSONArray();
				if(ResourceMap.containsKey(each.getId())){
					job.put("leaf",false);
					for(Resource r:ResourceMap.get(each.getId())){
						JSONObject jo=new JSONObject();
						jo.put("id",r.getId());
						jo.put("name",r.getResourcename());
						jo.put("checked",select.contains(r.getId()));
						jo.put("leaf",true);
						ja.add(jo);
					}
				}else{
					job.put("leaf",true);
				}
				job.put("children",ja);
				result.add(job);
			}
		}
		return result.toString();
	}
	public List<Resource> getAllParents() {
		return this.resourcedao.getAllParents();
	}
	public int hasResourceName(String resourcename, String id) {
		return resourcedao.hasResourceName(resourcename, id);
	}
	

}
