package com.guanglumedia.cms.common.tinytree;
import java.util.ArrayList;
import java.util.List;

import com.guanglumedia.common.util.StringUtils;

public class TinyTreeBean{
	private String id;
	private String name;
	private String url;
	private boolean leaf = true;
	private boolean checked;
	private boolean disabled;
	private boolean hide;
	private String style;
	private String parentId;
	private String orderId;
	private long childCount = 0L;
	private List<TinyTreeBean> children = new ArrayList<TinyTreeBean>();

	public TinyTreeBean(){}

	public TinyTreeBean(String id, String name) {
		this.id = id;
		this.name = name;
	}

	public boolean isHide() {
		return this.hide;
	}

	public void setHide(boolean hide) {
		this.hide = hide;
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public boolean isLeaf() {
		return this.leaf;
	}

	public void setLeaf(boolean leaf) {
		this.leaf = leaf;
	}

	public boolean isChecked() {
		return this.checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public boolean isDisabled() {
		return this.disabled;
	}

	public void setDisabled(boolean disabled) {
		this.disabled = disabled;
	}

	public List<TinyTreeBean> getChildren() {
		return this.children;
	}

	public void setChildren(List<TinyTreeBean> children) {
		this.children = children;
		if (children!=null&&children.size()>0) {
			setLeaf(true);
		} else {
			setLeaf(false);
			this.childCount += children.size();
		}
	}

	public void addChild(TinyTreeBean child) {
		this.children.add(child);
		setLeaf(false);
		this.childCount += 1L;
	}

	public long getChildCount() {
		return this.childCount;
	}

	public void setChildCount(long childCount) {
		this.childCount = childCount;
		if (childCount > 0L)
			setLeaf(false);
		else
			setLeaf(true);
	}

	public String getOrderId(){
		return this.orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getStyle() {
		return this.style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getParentId() {
		return this.parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public void selectStyle(){
		if (StringUtils.isEmpty(this.name)) {
			return;
		}
		if (this.name.length() == 2)
			this.style = "mm";
		else if (this.name.length() == 3)
			this.style = "mm3";
		else if (this.name.length() == 4)
			this.style = "mm2";
		else
			this.style = "mm";
	}
}