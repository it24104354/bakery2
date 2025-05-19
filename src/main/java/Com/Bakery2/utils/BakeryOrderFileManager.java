package Com.Bakery2.utils;

import Com.Bakery2.models.BakeryOrder;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class BakeryOrderFileManager {

    public static void saveOrder(String filePath, BakeryOrder order) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(toFileString(order));
            writer.newLine();
        }
    }

    public static List<BakeryOrder> readOrders(String filePath) throws IOException {
        List<BakeryOrder> orders = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;

            while ((line = reader.readLine()) != null) {
                BakeryOrder order = fromFileString(line);
                if (order != null) {
                    orders.add(order);
                }
            }
        }

        return orders;
    }

    private static String toFileString(BakeryOrder order) {
        return order.getCustomerName() + ";" +
                order.getItemType() + ";" +
                order.getSauceFlavour() + ";" +
                order.getItemCount() + ";" +
                order.getPayment();
    }

    private static BakeryOrder fromFileString(String line) {
        String[] parts = line.split(";");
        if (parts.length != 5) return null;

        try {
            String customerName = parts[0];
            String itemType = parts[1];
            String sauceFlavour = parts[2];
            int itemCount = Integer.parseInt(parts[3]);
            String payment = parts[4];

            return new BakeryOrder(customerName, itemType, sauceFlavour, itemCount, payment);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void overwriteOrders(String filePath, List<BakeryOrder> orders) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (BakeryOrder order : orders) {
                writer.write(toFileString(order));
                writer.newLine();
            }
        }
    }
}