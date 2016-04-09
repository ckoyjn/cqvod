package com.guanglumedia.cms.card.entity;

public class CardEpk {
    private static final int maxEpkBit8 = 4;
    private static final int maxEpkBit16 = 9;
    private String epkName;
    private String type;
    private String epkDateEnd;
    private String epkPerval;
    private Integer epkNum;
    private String epkRemark;
    private String epkStatus;//1激活，2未激活，3已下发
    private String epkIds;

    private Integer epkId;
    private Long evcnId;

    public String getEpkStatus() {
        return epkStatus;
    }

    public void setEpkStatus(String epkStatus) {
        this.epkStatus = epkStatus;
    }

    public String getEpkIds() {
        return epkIds;
    }

    public void setEpkIds(String epkIds) {
        this.epkIds = epkIds;
    }

    public int getMaxEpkBit() {
        return maxEpkBit8;
    }

    public int getMaxEpkBit(int type) {
        return type == 0 ? maxEpkBit8 : maxEpkBit16;
    }

    public Long getEvcnId() {
        return evcnId;
    }

    public void setEvcnId(Long evcnId) {
        this.evcnId = evcnId;
    }

    public Integer getEpkId() {
        return epkId;
    }

    public void setEpkId(Integer epkId) {
        this.epkId = epkId;
    }

    public String getEpkName() {
        return epkName;
    }

    public void setEpkName(String epkName) {
        this.epkName = epkName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getEpkDateEnd() {
        return epkDateEnd;
    }

    public void setEpkDateEnd(String epkDateEnd) {
        this.epkDateEnd = epkDateEnd;
    }

    public String getEpkPerval() {
        return epkPerval;
    }

    public void setEpkPerval(String epkPerval) {
        this.epkPerval = epkPerval;
    }

    public Integer getEpkNum() {
        return epkNum;
    }

    public void setEpkNum(Integer epkNum) {
        this.epkNum = epkNum;
    }

    public String getEpkRemark() {
        return epkRemark;
    }

    public void setEpkRemark(String epkRemark) {
        this.epkRemark = epkRemark;
    }

}
