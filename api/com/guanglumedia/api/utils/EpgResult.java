package com.guanglumedia.api.utils;

public class EpgResult {
    private String result;
    /*重庆新增*/
    private String ProdInstID;
    private int OweTotalFee;// 欠费总额
    private int Balance;//余额
    public String getResult() {
        return result;
    }
    public void setResult(String result) {
        this.result = result;
    }
    public String getProdInstID() {
        return ProdInstID;
    }
    public void setProdInstID(String prodInstID) {
        ProdInstID = prodInstID;
    }
    public int getOweTotalFee() {
        return OweTotalFee;
    }
    public void setOweTotalFee(int oweTotalFee) {
        OweTotalFee = oweTotalFee;
    }
    public int getBalance() {
        return Balance;
    }
    public void setBalance(int balance) {
        Balance = balance;
    }
}
