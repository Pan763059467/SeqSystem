package entity;

public class hardwareEntity {
    private String hardwarename;
    private String hardwaretype;
    private String hardwarefun;
    private String hardwarescene;

    public String getHardwarename() {
        return hardwarename;
    }

    public void setHardwarename(String hardwarename) {
        this.hardwarename = hardwarename;
    }

    public String getHardwaretype() {
        return hardwaretype;
    }

    public void setHardwaretype(String hardwaretype) {
        this.hardwaretype = hardwaretype;
    }

    public String getHardwarefun() {
        return hardwarefun;
    }

    public void setHardwarefun(String hardwarefun) {
        this.hardwarefun = hardwarefun;
    }

    public String getHardwarescene() {
        return hardwarescene;
    }

    public void setHardwarescene(String hardwarescene) {
        this.hardwarescene = hardwarescene;
    }

    public hardwareEntity(String hardwarename, String hardwaretype, String hardwarefun, String hardwarescene) {
        this.hardwarename = hardwarename;
        this.hardwaretype = hardwaretype;
        this.hardwarefun = hardwarefun;
        this.hardwarescene = hardwarescene;
    }

    public hardwareEntity() {
    }
}
