package Com.Bakery2.models;

public abstract class Person {
    protected String name;
    protected String address;
    protected String city;
    protected int phone;
    protected String email;

    public Person(String name, String address, String city, int phone, String email) {
        this.name = name;
        this.address = address;
        this.city = city;
        this.phone = phone;
        this.email = email;
    }

    // Abstract method to be implemented by subclasses
    public abstract String toCSV();

    // Getters
    public String getName() { return name; }
    public String getAddress() { return address; }
    public String getCity() { return city; }
    public int getPhone() { return phone; }
    public String getEmail() { return email; }

    // Common toString method
    @Override
    public String toString() {
        return name + " | " + address + " | " + city + " | " + phone + " | " + email;
    }
}
