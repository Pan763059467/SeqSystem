package entity;

public class appEntity {
    private String appname;
    private String apptype;
    private String appaddress;
    private String appusage;

    public appEntity(String appname, String apptype, String appaddress, String appusage) {
        this.appname = appname;
        this.apptype = apptype;
        this.appaddress = appaddress;
        this.appusage = appusage;
    }

    public appEntity() {
    }

    public String getAppname() {
        return appname;
    }

    public void setAppname(String appname) {
        this.appname = appname;
    }

    public String getApptype() {
        return apptype;
    }

    public void setApptype(String apptype) {
        this.apptype = apptype;
    }

    public String getAppaddress() {
        return appaddress;
    }

    public void setAppaddress(String appaddress) {
        this.appaddress = appaddress;
    }

    public String getAppusage() {
        return appusage;
    }

    public void setAppusage(String appusage) {
        this.appusage = appusage;
    }
}


