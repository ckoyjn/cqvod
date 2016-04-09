package com.guanglumedia.cms.order.entity;

public class PurRelation {
    private String filmName;
    /* 查询开始时间 */
    private String starttime;
    /* 查询结束时间 */
    private String endtime;
    /* 订购时间 */
    private String paytime;
    /* 订购总数 */
    private String paytotal;
    /* 订购总额 */
    private String paysum;
    public String getFilmName() {
        return filmName;
    }
    public void setFilmName(String filmName) {
        this.filmName = filmName;
    }
    public String getStarttime() {
        return starttime;
    }
    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }
    public String getEndtime() {
        return endtime;
    }
    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }
    public String getPaytime() {
        return paytime;
    }
    public void setPaytime(String paytime) {
        this.paytime = paytime;
    }
    public String getPaytotal() {
        return paytotal;
    }
    public void setPaytotal(String paytotal) {
        this.paytotal = paytotal;
    }
    public String getPaysum() {
        return paysum;
    }
    public void setPaysum(String paysum) {
        this.paysum = paysum;
    }
}
