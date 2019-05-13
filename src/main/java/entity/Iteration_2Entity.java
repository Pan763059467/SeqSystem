package entity;

import org.omg.CORBA.DATA_CONVERSION;

import java.util.Date;

public class Iteration_2Entity {
    private int ID_ITER;
    private int ID_PROJECT;
    private String ITER_NAME;
    private Date DATA;
    private int ID_DOCUMENT;

    public int getID_ITER() {
        return ID_ITER;
    }

    public void setID_ITER(int ID_ITER) {
        this.ID_ITER = ID_ITER;
    }

    public int getID_PROJECT() {
        return ID_PROJECT;
    }

    public void setID_PROJECT(int ID_PROJECT) {
        this.ID_PROJECT = ID_PROJECT;
    }

    public String getITER_NAME() {
        return ITER_NAME;
    }

    public void setITER_NAME(String ITER_NAME) {
        this.ITER_NAME = ITER_NAME;
    }

    public Date getDATA() {
        return DATA;
    }

    public void setDATA(Date DATA) {
        this.DATA = DATA;
    }

    public int getID_DOCUMENT() {
        return ID_DOCUMENT;
    }

    public void setID_DOCUMENT(int ID_DOCUMENT) {
        this.ID_DOCUMENT = ID_DOCUMENT;
    }

    public Iteration_2Entity(int ID_ITER, int ID_PROJECT, String ITER_NAME, Date DATA, int ID_DOCUMENT) {
        this.ID_ITER = ID_ITER;
        this.ID_PROJECT = ID_PROJECT;
        this.ITER_NAME = ITER_NAME;
        this.DATA = DATA;
        this.ID_DOCUMENT = ID_DOCUMENT;
    }

    public Iteration_2Entity() {
    }
}
