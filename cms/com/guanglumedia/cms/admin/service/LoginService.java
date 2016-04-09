package com.guanglumedia.cms.admin.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guanglumedia.cms.admin.dao.LoginDao;
import com.guanglumedia.cms.admin.dao.ResourceDao;
import com.guanglumedia.cms.admin.entity.Resource;
import com.guanglumedia.cms.admin.entity.User;
import com.guanglumedia.cms.common.Global;
import com.guanglumedia.cms.common.tinytree.TinyTreeBean;
import com.guanglumedia.common.util.StringUtils;
import com.guanglumedia.common.util.security.MD5Utils;

@Service
public class LoginService {
	@Autowired
	private LoginDao logindao;
	@Autowired
	private ResourceDao resourcedao;
	
	public boolean doLogin(String loginName, String password, HttpSession session) {
		boolean result = false;
		User user=logindao.CheckUserLogin(loginName,MD5Utils.getMD5(password));
		if(user!=null){
			Set<String> rights=logindao.getUserRightByGroupID(user.getGroupID());
			List<Resource> resources=this.resourcedao.findResourcesByGroupID(user.getGroupID());
			List<TinyTreeBean> TreeBeans = buildMenuPrivilegeTree(resources,rights);
			session.setAttribute(Global.Session_User, user);
			session.setAttribute(Global.Session_Resource,TreeBeans);
			session.setAttribute(Global.Session_Rights, rights);
			result=true;
		}
		return result;
	}
	private List<TinyTreeBean> buildMenuPrivilegeTree(List<Resource> entMenuPrivileges, Set<String> rights){
		TinyTreeBean root = new TinyTreeBean("0", null);
		Map<String,TinyTreeBean> menuIdTreeMap = new HashMap<String,TinyTreeBean>();
		menuIdTreeMap.put("0", root);
		for (Resource each : entMenuPrivileges) {
			TinyTreeBean node = new TinyTreeBean(each.getId(), each.getResourcename());
			node.setUrl(each.getAction());
			node.selectStyle();
			if (StringUtils.isEmpty(each.getSort()))
				node.setOrderId("9999999999");
			else {
				node.setOrderId(each.getSort());
			}
			menuIdTreeMap.put(each.getId(), node);
		}
		for (Resource each : entMenuPrivileges) {
			TinyTreeBean parent = (TinyTreeBean)menuIdTreeMap.get(each.getParentId());
			if (parent == null) {
				continue;
			}
			parent.addChild((TinyTreeBean)menuIdTreeMap.get(each.getId()));
			rights.add(each.getAction());
		}
		return ((TinyTreeBean)menuIdTreeMap.get("0")).getChildren();
		}
}
