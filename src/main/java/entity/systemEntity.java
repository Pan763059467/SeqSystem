package entity;

public class systemEntity {
    private String systemname;
    private String systemtype;
    private String systemedition;
    private String systemframework;
    private String systemsummary;

    public String getSystemname() {
        return systemname;
    }

    public void setSystemname(String systemname) {
        this.systemname = systemname;
    }

    public String getSystemtype() {
        return systemtype;
    }

    public void setSystemtype(String systemtype) {
        this.systemtype = systemtype;
    }

    public String getSystemedition() {
        return systemedition;
    }

    public void setSystemedition(String systemedition) {
        this.systemedition = systemedition;
    }

    public String getSystemframework() {
        return systemframework;
    }

    public void setSystemframework(String systemframework) {
        this.systemframework = systemframework;
    }

    public String getSystemsummary() {
        return systemsummary;
    }

    public void setSystemsummary(String systemsummary) {
        this.systemsummary = systemsummary;
    }

    public systemEntity(String systemname, String systemtype, String systemedition, String systemframework, String systemsummary) {
        this.systemname = systemname;
        this.systemtype = systemtype;
        this.systemedition = systemedition;
        this.systemframework = systemframework;
        this.systemsummary = systemsummary;
    }

    public systemEntity() {
    }
}
