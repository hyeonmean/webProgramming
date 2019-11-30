package WebModule;

import java.util.Calendar;

public class User {

    //�ʼ� ����
    private String id;
    private String pswd;
    private String name;
    private String phoneNumber;

    //���� ����
    private int age;
    private Gender gender;
    private String letter;
    private boolean isManager;
    private String profilePictureAddress;
    private Calendar date;

    //�ڵ� �ԷµǴ� �κ� (true �� �ڵ�����)
    private boolean locked; //�����ڿ� ���� ��� ���� ����

    /*
    ���� �״�� ����
    �Ķ���͸� Ȱ���� ������ �ڵ尡 ������ �ǹǷ�
    �������� ����
    �ƴϸ� �ڹٺ��� setProperty ����ص� �Ǳ���..
     */

    //�ڹٺ���� ���� Ŭ����
    public User() {

    }

    //get Functions
    public String getId() { return id; }
    public String getPswd() { return pswd; }
    public String getName() { return name; }
    public String getPhoneNumber() { return phoneNumber; }
    public int getAge() { return age; }
    public Gender getGender() { return gender; }
    public String getLetter() { return letter; }
    public boolean getIsManager() {  return isManager; }
    public String getProfilePictureAddress() { return profilePictureAddress; }
    public Calendar getDate() { return date; }
    public boolean getLocked() { return locked; }

    //set Functions
    public void setId(String id) { this.id = id; }
    public void setPswd(String pswd) { this.pswd = pswd; }
    public void setName(String name) { this.name = name; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }
    public void setAge(int age) { this.age = age; }
    public void setGender(Gender gender) { this.gender = gender; }
    public void setLetter(String letter) { this.letter = letter; }
    public void setIsManager(boolean isManager) { this.isManager = isManager; }
    public void setProfilePictureAddress(String profilePictureAddress) {
        this.profilePictureAddress = profilePictureAddress;
    }
    public void setDate(Calendar date) { this.date = date; }
    public void setLocked(boolean locked) { this.locked = locked; }


    // �ڹ� ��� ������� �ʰ�
    // ������ ������ ��� ���� Ŭ���� ���
    public static class Builder {

        //�ʼ� ����
        private String id;
        private String pswd;
        private String name;
        private String phoneNumber;

        //���� ����
        private int age;
        private Gender gender;
        private String letter;
        private boolean isManager;
        private String profilePictureAddress;
        private Calendar date;

        //�ڵ� �ԷµǴ� �κ� (true �� �ڵ�����)
        private boolean locked; //�����ڿ� ���� ��� ���� ����

        // �ʼ� �Է� ���׵�
        // ���̵�, �н�����, �̸�, ����
        public Builder(String _id, String _pswd, String _name, String _phoneNumber,
                       boolean _isManager, boolean _locked) {

            if (_id == null)
                throw new NullPointerException("ID must be exist!");
            if (_id.length() == 0)
                throw new NullPointerException("ID length must not be zero");
            this.id = _id;

            if (_pswd == null)
                throw new NullPointerException("pswd must be exist!");
            if (_pswd.length() == 0)
                throw new NullPointerException("pswd length must not be zero");
            this.pswd = _pswd;

            if (_name == null)
                throw new NullPointerException("name must be exist!");
            if (_name.length() == 0)
                throw new NullPointerException("Name length must not be zero");
            this.name = _name;

            if (_phoneNumber == null)
                throw new NullPointerException("name must be exist!");
            if (_phoneNumber.length() == 0)
                throw new NullPointerException("Name length must not be zero");
            this.phoneNumber = _phoneNumber;

            //��� ���ο�, ����� ��� ���η�
            //ȸ�� ���� �� �ʼ��Է��� �ƴ�����
            //�� �� false�� �������� ���󰣴�.
            this.isManager = _isManager;
            this.locked = _locked;

        }

        //�������ֵ��� ���û���
        /*
        private int age;
        private Gender gender;
        private String letter;
        private String profilePictureAddress;
        private Calendar date;
        */
        public Builder age(int _age) {
            this.age = _age;;
            return this;
        }
        public Builder gender(Gender _gender) {
            this.gender = _gender;
            return this;
        }
        public Builder letter(String _letter) {
            this.letter = _letter;
            return this;
        }
        public Builder profilePictureAddress(String _address) {
            this.profilePictureAddress = _address;
            return this;
        }
        public Builder date(Calendar _date) {
            this.date = _date;
            return this;
        }

        //����
        public User build() {
            return new User(this);
        }
    }
    //������ Ȱ���� ������
    private User(Builder _builder) {
        this.id = _builder.id;
        this.pswd = _builder.pswd;
        this.name = _builder.name;
        this.phoneNumber = _builder.phoneNumber;
        this.isManager = _builder.isManager;
        this.locked = _builder.locked;

        this.age = _builder.age;
        this.gender = _builder.gender;
        this.letter = _builder.letter;
        this.profilePictureAddress = _builder.profilePictureAddress;
        this.date = _builder.date;
    }
}