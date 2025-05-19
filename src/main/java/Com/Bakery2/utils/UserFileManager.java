package Com.Bakery2.utils;

import Com.Bakery2.models.Users;
import java.io.*;
import java.util.*;

public class UserFileManager {

    public static List<Users> readUsers(String filePath) throws IOException {
        List<Users> userList = new ArrayList<>();
        File file = new File(filePath);
        System.out.println("Reading from file: " + file.getAbsolutePath());
        if (!file.exists()) {
            System.out.println("File does not exist.");
            return userList;
        }
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println("Reading line: " + line); // DEBUG
                Users user = Users.fromDataString(line);
                if (user != null) {
                    userList.add(user);
                } else {
                    System.out.println("Skipping invalid user line: " + line);
                }
            }
        }
        System.out.println("Total users loaded: " + userList.size());
        return userList;
    }


    public static void writeUsers(String filePath, List<Users> users) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (Users user : users) {
                writer.write(user.toDataString());
                writer.newLine();
            }
        }
    }

    public static void addUser(String filePath, Users newUser) throws IOException {
        List<Users> users = readUsers(filePath);
        users.add(newUser);
        writeUsers(filePath, users);
    }

    public static void updateUser(String filePath, String email, Users updatedUser) throws IOException {
        List<Users> users = readUsers(filePath);
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getEmail().equals(email)) {
                users.set(i, updatedUser);
                break;
            }
        }
        writeUsers(filePath, users);
    }

    public static void deleteUser(String filePath, String email) throws IOException {
        List<Users> users = readUsers(filePath);
        users.removeIf(u -> u.getEmail().equals(email));
        writeUsers(filePath, users);
    }
}
