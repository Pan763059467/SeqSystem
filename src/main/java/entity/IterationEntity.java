package entity;

import java.util.Date;

public class IterationEntity {
    private int id_catalog;
    private int id_template;
    private int id_document;
    private String content;
    private String title;
    private int first_index;
    private int second_index;
    private int third_index;
    private int fourth_index;
    private int ID_ITER2;
    private int ID_ITER;
    private String ITER_NAME;
    private int Stage;
    private Date DATA_1;
    private Date DATA_2;
    private String PERSON;
    private int W_HOURS;
    private int F_HOURS;
    private int S_HOURS;
    private int B_HOURS;

    public String getITER_NAME() {
        return ITER_NAME;
    }

    public void setITER_NAME(String ITER_NAME) {
        this.ITER_NAME = ITER_NAME;
    }

    public int getId_catalog() {
        return id_catalog;
    }

    public void setId_catalog(int id_catalog) {
        this.id_catalog = id_catalog;
    }

    public int getId_template() {
        return id_template;
    }

    public void setId_template(int id_template) {
        this.id_template = id_template;
    }

    public int getId_document() {
        return id_document;
    }

    public void setId_document(int id_document) {
        this.id_document = id_document;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getFirst_index() {
        return first_index;
    }

    public void setFirst_index(int first_index) {
        this.first_index = first_index;
    }

    public int getSecond_index() {
        return second_index;
    }

    public void setSecond_index(int second_index) {
        this.second_index = second_index;
    }

    public int getThird_index() {
        return third_index;
    }

    public void setThird_index(int third_index) {
        this.third_index = third_index;
    }

    public int getFourth_index() {
        return fourth_index;
    }

    public void setFourth_index(int fourth_index) {
        this.fourth_index = fourth_index;
    }

    public int getID_ITER2() {
        return ID_ITER2;
    }

    public void setID_ITER2(int ID_ITER2) {
        this.ID_ITER2 = ID_ITER2;
    }

    public int getID_ITER() {
        return ID_ITER;
    }

    public void setID_ITER(int ID_ITER) {
        this.ID_ITER = ID_ITER;
    }

    public int getStage() {
        return Stage;
    }

    public void setStage(int stage) {
        Stage = stage;
    }

    public Date getDATA_1() {
        return DATA_1;
    }

    public void setDATA_1(Date DATA_1) {
        this.DATA_1 = DATA_1;
    }

    public Date getDATA_2() {
        return DATA_2;
    }

    public void setDATA_2(Date DATA_2) {
        this.DATA_2 = DATA_2;
    }

    public String getPERSON() {
        return PERSON;
    }

    public void setPERSON(String PERSON) {
        this.PERSON = PERSON;
    }

    public int getW_HOURS() {
        return W_HOURS;
    }

    public void setW_HOURS(int w_HOURS) {
        W_HOURS = w_HOURS;
    }

    public int getF_HOURS() {
        return F_HOURS;
    }

    public void setF_HOURS(int f_HOURS) {
        F_HOURS = f_HOURS;
    }

    public int getS_HOURS() {
        return S_HOURS;
    }

    public void setS_HOURS(int s_HOURS) {
        S_HOURS = s_HOURS;
    }

    public int getB_HOURS() {
        return B_HOURS;
    }

    public void setB_HOURS(int b_HOURS) {
        B_HOURS = b_HOURS;
    }

    public IterationEntity(int id_catalog, int id_template, int id_document, String content, String title, int first_index, int second_index, int third_index, int fourth_index, int ID_ITER2, int ID_ITER, String ITER_NAME, int stage, Date DATA_1, Date DATA_2, String PERSON, int w_HOURS, int f_HOURS, int s_HOURS, int b_HOURS) {
        this.id_catalog = id_catalog;
        this.id_template = id_template;
        this.id_document = id_document;
        this.content = content;
        this.title = title;
        this.first_index = first_index;
        this.second_index = second_index;
        this.third_index = third_index;
        this.fourth_index = fourth_index;
        this.ID_ITER2 = ID_ITER2;
        this.ID_ITER = ID_ITER;
        this.ITER_NAME = ITER_NAME;
        Stage = stage;
        this.DATA_1 = DATA_1;
        this.DATA_2 = DATA_2;
        this.PERSON = PERSON;
        W_HOURS = w_HOURS;
        F_HOURS = f_HOURS;
        S_HOURS = s_HOURS;
        B_HOURS = b_HOURS;
    }

    public IterationEntity() {
    }
}
