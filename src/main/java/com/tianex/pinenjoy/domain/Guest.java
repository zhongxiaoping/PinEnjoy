package com.tianex.pinenjoy.domain;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.sql.Timestamp;

@Entity
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "freqChangeRegion")
@Table(name = "t_guest")
public class Guest implements Serializable {
    private static final long serialVersionUID = -2482254577660374966L;

    private String guestId;

    private String homeAccountNickname;

    private String guestAccountNickname;
    private String guestAccountId;
    private String guestAccountThumb;
    private Timestamp guestLastVisitedTime;

    public Guest() {
    }

    public Guest(String guestAccountNickname, Timestamp guestLastVisitedTime) {
        this.guestAccountNickname = guestAccountNickname;
        this.guestLastVisitedTime = guestLastVisitedTime;
    }

    @Id
    @Column(name = "guest_id")
    public String getGuestId() {
        return guestId;
    }

    public void setGuestId(String guestId) {
        this.guestId = guestId;
    }

    @Column(name = "guest_lastVisitedTime")
    public Timestamp getGuestLastVisitedTime() {
        return guestLastVisitedTime;
    }

    public void setGuestLastVisitedTime(Timestamp guestLastVisitedTime) {
        this.guestLastVisitedTime = guestLastVisitedTime;
    }

    @Column(name = "guest_accountThumb")
    public String getGuestAccountThumb() {
        return guestAccountThumb;
    }

    public void setGuestAccountThumb(String guestAccountThumb) {
        this.guestAccountThumb = guestAccountThumb;
    }

    @Column(name = "guest_guestAccountNickname")
    public String getGuestAccountNickname() {
        return guestAccountNickname;
    }

    public void setGuestAccountNickname(String guestAccountNickname) {
        this.guestAccountNickname = guestAccountNickname;
    }

    @Column(name = "guest_homeAccountNickname")
    public String getHomeAccountNickname() {
        return homeAccountNickname;
    }

    public void setHomeAccountNickname(String homeAccountNickname) {
        this.homeAccountNickname = homeAccountNickname;
    }

    @Column(name = "guest_guestAccountId")
    public String getGuestAccountId() {
        return guestAccountId;
    }

    public void setGuestAccountId(String guestAccountId) {
        this.guestAccountId = guestAccountId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Guest guest = (Guest) o;

        return !(guestId != null ? !guestId.equals(guest.guestId) : guest.guestId != null);

    }

    @Override
    public int hashCode() {
        return guestId != null ? guestId.hashCode() : 0;
    }

    @Override
    public String toString() {
        return "Guest{" +
                "guestId='" + guestId + '\'' +
                ", guestAccountNickname='" + guestAccountNickname + '\'' +
                ", guestAccountThumb='" + guestAccountThumb + '\'' +
                ", guestLastVisitedTime=" + guestLastVisitedTime +
                '}';
    }

}
