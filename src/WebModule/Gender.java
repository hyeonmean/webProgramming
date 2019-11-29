package WebModule;

public enum Gender {

    /*
        남자와 여자는 각각 String과 boolean으로 표현할 수 있다.
     */
    Male("Male", 0),
    Female("Female",1),
    Unknown("unknown", -1);

    private String table1Value;
    private int table2value;

    //생성자인데 이건 직접 안씀
    Gender(String table1Value, int table2Value)
    {
        this.table1Value = table1Value;
        this.table2value = table2Value;
    }

    //여기부터 직접 씀
    //1Value -> String
    //2Value -> boolean
    public String getTable1Value() {
        return table1Value;
    }
    public int getTable2value() { return table2value; }
}