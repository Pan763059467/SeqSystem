package entity;

public class databaseEntity {
    private String maindatabase;
    private String databasetype;
    private String databaseedition;
    private String databasesummary;

    public String getMaindatabase() {
        return maindatabase;
    }

    public void setMaindatabase(String maindatabase) {
        this.maindatabase = maindatabase;
    }

    public String getDatabasetype() {
        return databasetype;
    }

    public void setDatabasetype(String databasetype) {
        this.databasetype = databasetype;
    }

    public String getDatabaseedition() {
        return databaseedition;
    }

    public void setDatabaseedition(String databaseedition) {
        this.databaseedition = databaseedition;
    }

    public String getDatabasesummary() {
        return databasesummary;
    }

    public void setDatabasesummary(String databasesummary) {
        this.databasesummary = databasesummary;
    }

    public databaseEntity(String maindatabase, String databasetype, String databaseedition, String databasesummary) {
        this.maindatabase = maindatabase;
        this.databasetype = databasetype;
        this.databaseedition = databaseedition;
        this.databasesummary = databasesummary;
    }

    public databaseEntity() {
    }
}
