package com.guanglumedia.common.listener;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DistrictService{

  @Autowired
  private DistrictMapper districtMapper;

  public List<District> getAllDistrict(int maxLevel){
	  return this.districtMapper.getAllDistrict(maxLevel);
  }

  public List<District> getDistrictByUpid(int upid){
	  return this.districtMapper.getDistrictByUpid(upid);
  }
}