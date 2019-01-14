package entity;

public class communEntity {
    private String communname;
    private String communabb;
    private String communtype;
    private String commundescribe;

    public String getCommunname() {
        return communname;
    }

    public void setCommunname(String communname) {
        this.communname = communname;
    }

    public String getCommunabb() {
        return communabb;
    }

    public void setCommunabb(String communabb) {
        this.communabb = communabb;
    }

    public String getCommuntype() {
        return communtype;
    }

    public void setCommuntype(String communtype) {
        this.communtype = communtype;
    }

    public String getCommundescribe() {
        return commundescribe;
    }

    public void setCommundescribe(String commundescribe) {
        this.commundescribe = commundescribe;
    }

    public communEntity(String communname, String communabb, String communtype, String commundescribe) {
        this.communname = communname;
        this.communabb = communabb;
        this.communtype = communtype;
        this.commundescribe = commundescribe;
    }

    public communEntity() {
    }
}
