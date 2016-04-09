package com.guanglumedia.cms.special.entity;

public class Special {
    private String id;
    private String name;
    private String status;// 1、上线 0、下线
    private String createtime;
    private String identify;
    private String movieIDs;
    private String movieNames;
    

    public String getIdentify() {
        return identify;
    }

    public void setIdentify(String identify) {
        this.identify = identify;
    }

    public String getMovieIDs() {
        return movieIDs;
    }

    public void setMovieIDs(String movieIDs) {
        this.movieIDs = movieIDs;
    }

    public String getMovieNames() {
        return movieNames;
    }

    public void setMovieNames(String movieNames) {
        this.movieNames = movieNames;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }


    public String getStatus() {
        return status;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }


    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }


}
