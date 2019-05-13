package entity;

import java.sql.Timestamp;
import java.util.Date;

public class TrackEntity {
    private int ID_TRACK;
    private int ID_CATALOG;
    private String USER_NAME;
    private Timestamp DATE;
    private String WHERE1;
    private String BEFORE1;
    private String AFTER1;

    public int getID_TRACK() {
        return ID_TRACK;
    }

    public void setID_TRACK(int ID_TRACK) {
        this.ID_TRACK = ID_TRACK;
    }

    public int getID_CATALOG() {
        return ID_CATALOG;
    }

    public void setID_CATALOG(int ID_CATALOG) {
        this.ID_CATALOG = ID_CATALOG;
    }

    public String getUSER_NAME() {
        return USER_NAME;
    }

    public void setUSER_NAME(String USER_NAME) {
        this.USER_NAME = USER_NAME;
    }

    public Timestamp getDATE() {
        return DATE;
    }

    public void setDATE(Timestamp DATE) {
        this.DATE = DATE;
    }

    public String getWHERE1() {
        return WHERE1;
    }

    public void setWHERE1(String WHERE1) {
        this.WHERE1 = WHERE1;
    }

    public String getBEFORE1() {
        return BEFORE1;
    }

    public void setBEFORE1(String BEFORE1) {
        this.BEFORE1 = BEFORE1;
    }

    public String getAFTER1() {
        return AFTER1;
    }

    public void setAFTER1(String AFTER1) {
        this.AFTER1 = AFTER1;
    }

    public TrackEntity(int ID_TRACK, int ID_CATALOG, String USER_NAME, Timestamp DATE, String WHERE1, String BEFORE1, String AFTER1) {
        this.ID_TRACK = ID_TRACK;
        this.ID_CATALOG = ID_CATALOG;
        this.USER_NAME = USER_NAME;
        this.DATE = DATE;
        this.WHERE1 = WHERE1;
        this.BEFORE1 = BEFORE1;
        this.AFTER1 = AFTER1;
    }

    public TrackEntity() {
    }
}
