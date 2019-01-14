package entity;

public class dataEntity {
    private String datatype;
    private String dataempty;
    private String dataconstraint;
    private String dataexplain;
    private String dataname;


    public String getDataname() {
        return dataname;
    }

    public void setDataname(String dataname) {
        this.dataname = dataname;
    }

    public String getDatatype() {
        return datatype;
    }

    public void setDatatype(String datatype) {
        this.datatype = datatype;
    }

    public String getDataempty() {
        return dataempty;
    }

    public void setDataempty(String dataempty) {
        this.dataempty = dataempty;
    }

    public String getDataconstraint() {
        return dataconstraint;
    }

    public void setDataconstraint(String dataconstraint) {
        this.dataconstraint = dataconstraint;
    }

    public String getDataexplain() {
        return dataexplain;
    }

    public void setDataexplain(String dataexplain) {
        this.dataexplain = dataexplain;
    }

    public dataEntity(String dataname, String datatype, String dataempty, String dataconstraint, String dataexplain) {
        this.dataname = dataname;
        this.datatype = datatype;
        this.dataempty = dataempty;
        this.dataconstraint = dataconstraint;
        this.dataexplain = dataexplain;
    }

    public dataEntity() {
    }
}
