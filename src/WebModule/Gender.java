package WebModule;

public enum Gender {

    /*
        ���ڿ� ���ڴ� ���� String�� boolean���� ǥ���� �� �ִ�.
     */
    Male("Male", 0),
    Female("Female",1),
    Unknown("unknown", -1);

    private String table1Value;
    private int table2value;

    //�������ε� �̰� ���� �Ⱦ�
    Gender(String table1Value, int table2Value)
    {
        this.table1Value = table1Value;
        this.table2value = table2Value;
    }

    //������� ���� ��
    //1Value -> String
    //2Value -> boolean
    public String getTable1Value() {
        return table1Value;
    }
    public int getTable2value() { return table2value; }
}