package entity;

public class webmainEntity {
    private String webmain;
    private String webedition;
    private String websummary;

    public String getWebmain() {
        return webmain;
    }

    public void setWebmain(String webmain) {
        this.webmain = webmain;
    }

    public String getWebedition() {
        return webedition;
    }

    public void setWebedition(String webedition) {
        this.webedition = webedition;
    }

    public String getWebsummary() {
        return websummary;
    }

    public void setWebsummary(String websummary) {
        this.websummary = websummary;
    }

    public webmainEntity(String webmain, String webedition, String websummary) {
        this.webmain = webmain;
        this.webedition = webedition;
        this.websummary = websummary;
    }

    public webmainEntity() {
    }
}
