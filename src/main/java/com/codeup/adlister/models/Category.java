package com.codeup.adlister.models;

public class Category {
    private long id;
    private long ad_id;
    private String name;

    public Category(long id, long ad_id, String name) {
        this.id = id;
        this.ad_id = ad_id;
        this.name = name;
    }

    public Category() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getAd_id() {
        return ad_id;
    }

    public void setAd_id(long ad_id) {
        this.ad_id = ad_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
