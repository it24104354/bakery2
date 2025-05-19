package Com.Bakery2.utils;

import Com.Bakery2.models.Order;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class OrderFileManager {

    public static void saveOrder(String filePath, Order order) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(order.toFileString());
            writer.newLine();
        }
    }

    public static List<Order> readOrders(String filePath) throws IOException {
        List<Order> orders = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;

            while ((line = reader.readLine()) != null) {
                Order order = Order.fromFileString(line);
                if (order != null) {
                    orders.add(order);
                }
            }
        }

        return orders;
    }

    public static void overwriteOrders(String filePath, List<Order> orders) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (Order order : orders) {
                writer.write(order.toFileString());
                writer.newLine();
            }
        }
    }
}
