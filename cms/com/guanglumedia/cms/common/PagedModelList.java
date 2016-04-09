package com.guanglumedia.cms.common;

import java.util.ArrayList;
import java.util.List;
import org.apache.commons.collections.CollectionUtils;

public class PagedModelList<T>{
	private int pageId;
	private int pageSize;
	private int pageCount;
	private int totalCount;
	private List<T> pagedModelList;
	public static String[] pageRowSelect = { "10", "15", "20", "50", "100" };
	private boolean isShowRowSelect = false;

	public PagedModelList(){
	}

	public PagedModelList(int totalCount) {
		this.pageId = 1;
		this.pageSize = 2147483647;
		this.totalCount = totalCount;
		this.pageCount = 1;
		this.pagedModelList = new ArrayList<T>();
  }

  public PagedModelList(int pageID, int pageSize, int totalCount) {
	  	this.pageId = pageID;
	  	this.pageSize = pageSize;
	  	this.totalCount = totalCount;
	  	this.pagedModelList = new ArrayList<T>();
	  	setPageCount();
  }

  public PagedModelList(int pageSize, int pageCount){
	  	this.pageSize = pageSize;
	  	this.pageCount = pageCount;
	  	this.pagedModelList = new ArrayList<T>();
  }

  public int getPageCount() {
	  	return this.pageCount;
  }

  public List<T> getPagedModelList() {
	  	return this.pagedModelList;
  }

  public Object[] getPagedModels() {
	  	return this.pagedModelList.toArray(new Object[this.pagedModelList.size()]);
  }

  public void addModel(T t) {
	  	this.pagedModelList.add(t);
  }

  @SuppressWarnings("unchecked")
  public void addModels(List<T> modelList) {
	  	if (CollectionUtils.isEmpty(modelList))
	  		return;
	  	for (Object t : modelList) {
	  		this.pagedModelList.add((T) t);
	  	}
	  	setPageCount();
  }

  public int getPageId() {
	  return this.pageId;
  }

  public int getPageSize() {
	  return this.pageSize;
  }

  public int getTotalCount() {
	  return this.totalCount;
  }

  public void setTotalCount(int totalCount) {
	  this.totalCount = totalCount;
  }

  protected void setPageCount(){
	  if (this.pageSize <= 0) {
		  this.pageCount = 1;
	  } else {
		  int pn = this.totalCount / this.pageSize;
		  if (this.totalCount % this.pageSize != 0)
			  pn++;
		  if (pn == 0)
			  pn++;
		  this.pageCount = pn;
	  }
  }

  public int[] getPages() {
	  int count = this.totalCount / this.pageSize;
	  if (this.totalCount % this.pageSize > 0)
		  count++;
	  int[] pages = new int[count];
	  for (int i = 0; i < count; i++) {
		  pages[i] = i;
    }
	  return pages;
  }

  public boolean isShowRowSelect() {
	  return this.isShowRowSelect;
  }

  public void setShowRowSelect(boolean isShowRowSelect) {
	  this.isShowRowSelect = isShowRowSelect;
  }

  public String[] getPageRowSelect() {
	  return pageRowSelect;
  }
}
