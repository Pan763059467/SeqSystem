package entity;

public class environmentEntity {
    private String  environmenttype;
    private String  environmentconfigure;

    public String getEnvironmenttype() {
        return environmenttype;
    }

    public void setEnvironmenttype(String environmenttype) {
        this.environmenttype = environmenttype;
    }

    public String getEnvironmentconfigure() {
        return environmentconfigure;
    }

    public void setEnvironmentconfigure(String environmentconfigure) {
        this.environmentconfigure = environmentconfigure;
    }

    public environmentEntity(String environmenttype, String environmentconfigure) {
        this.environmenttype = environmenttype;
        this.environmentconfigure = environmentconfigure;
    }

    public environmentEntity() {
    }
}
