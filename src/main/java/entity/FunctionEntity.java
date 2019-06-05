package entity;

public class FunctionEntity {
    private int ID_FUNCTION;
    private int ID_ITER2;
    private String FILED;
    private String PERSON;
    private String CONTENT;

    public int getID_FUNCTION() {
        return ID_FUNCTION;
    }

    public void setID_FUNCTION(int ID_FUNCTION) {
        this.ID_FUNCTION = ID_FUNCTION;
    }

    public int getID_ITER2() {
        return ID_ITER2;
    }

    public void setID_ITER2(int ID_ITER2) {
        this.ID_ITER2 = ID_ITER2;
    }

    public String getFILED() {
        return FILED;
    }

    public void setFILED(String FILED) {
        this.FILED = FILED;
    }

    public String getPERSON() {
        return PERSON;
    }

    public void setPERSON(String PERSON) {
        this.PERSON = PERSON;
    }

    public String getCONTENT() {
        return CONTENT;
    }

    public void setCONTENT(String CONTENT) {
        this.CONTENT = CONTENT;
    }

    public FunctionEntity(int ID_FUNCTION, int ID_ITER2, String FILED, String PERSON, String CONTENT) {
        this.ID_FUNCTION = ID_FUNCTION;
        this.ID_ITER2 = ID_ITER2;
        this.FILED = FILED;
        this.PERSON = PERSON;
        this.CONTENT = CONTENT;
    }

    public FunctionEntity() {
    }
}
