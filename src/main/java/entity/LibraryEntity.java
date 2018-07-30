package entity;

import java.util.List;
import java.util.Date;

public class LibraryEntity {
    private int id_library;
    private String name;
    private int id_template;

    private int id_user;
    private int collect_num;
    private String mention;
    private Date time;
    private int flag;
    private String user_name;
    private String title;

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getMention() {
        return mention;
    }

    public void setMention(String mention) {
        this.mention = mention;
    }

    public int getId_library() {
        return id_library;
    }

    public void setId_library(int id_library) {
        this.id_library = id_library;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId_template() {
        return id_template;
    }

    public void setId_template(int id_template) {
        this.id_template = id_template;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public int getCollect_num() {
        return collect_num;
    }

    public void setCollect_num(int collect_num) {
        this.collect_num = collect_num;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public LibraryEntity(int id_library, String name, int id_template, int id_user, int collect_num, String mention, Date time, int flag, String user_name, String title) {
        this.id_library = id_library;
        this.name = name;
        this.id_template = id_template;
        this.id_user = id_user;
        this.collect_num = collect_num;
        this.mention = mention;
        this.time = time;
        this.flag = flag;
        this.user_name = user_name;
        this.title = title;
    }

    public LibraryEntity() {
    }
}
