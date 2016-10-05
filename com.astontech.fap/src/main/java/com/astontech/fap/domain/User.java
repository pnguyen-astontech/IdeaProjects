package com.astontech.fap.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.Entity;

/**
 * Created by petenguy1 on 10/3/2016.
 */
@Entity
@JsonIgnoreProperties(ignoreUnknown = true)
public class User extends Person {

    private String username;
    private String password;

    private String ppUrl;

    public User() {
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPpUrl() {
        return ppUrl;
    }

    public void setPpUrl(String ppUrl) {
        this.ppUrl = ppUrl;
    }
}
