package Com.Bakery2.models;

public class Users extends Person {
    private final String password;

    public Users(String name, String address, String city, int phone, String email, String password) {
        super(name, address, city, phone, email);
        this.password = password;
    }

    // Getter
    public String getPassword() {
        return password;
    }

    // Implement abstract method from Person
    @Override
    public String toCSV() {
        return name + "," + address + "," + city + "," + phone + "," + email + "," + password;
    }

    // For consistency if needed
    public String toDataString() {
        return toCSV();
    }

    // Parse from string (e.g., read from file)
    public static Users fromDataString(String data) {
        String[] parts = data.split(",");
        if (parts.length == 6) {
            try {
                int phone = Integer.parseInt(parts[3]);
                return new Users(parts[0], parts[1], parts[2], phone, parts[4], parts[5]);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }
}