package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.concurrent.ExecutionException;

public class DBUtil {
    private static Connection connection;

    static {
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/java_pro_2_db", "postgres", "Bota1901");


        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<Item> getAllItems() {
        ArrayList<Item> items = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT it.id , it.name , it.price , it.amount , it.brands_id , b.name as brandName , b.country " +
                    "FROM items it" +
                    " Inner Join brands b on b.id = it.brands_id ORDER BY id");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Item item = new Item();
                item.setId(resultSet.getLong("id"));
                item.setName(resultSet.getString("name"));
                item.setPrice(resultSet.getInt("price"));
                item.setAmount(resultSet.getInt("amount"));
                Brands brand = new Brands(
                        resultSet.getLong("brands_id"),
                        resultSet.getString("brandName"),
                        resultSet.getString("country")
                );
                item.setBrand(brand);
                items.add(item);

            }

            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return items;
    }

    public static void addItem(Item item) {
        try {

            PreparedStatement statement = connection.prepareStatement("" +
                    "INSERT INTO  items (name , price , amount , brands_id) "
                    + "VALUES (? , ? , ? , ?)");
            statement.setString(1, item.getName());
            statement.setDouble(2, item.getPrice());
            statement.setInt(3, item.getAmount());
            statement.setLong(4, item.getBrand().getId());

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Item getItem(Long id) {
        Item item = null;
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT it.id , it.name , it.price , it.amount , it.brands_id , b.name as brandName , b.country " +
                            "FROM items it " +
                            "Inner Join brands b on b.id = it.brands_id " +
                            "WHERE it.id = ?");
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                item = new Item();
                item.setId(resultSet.getLong("id"));
                item.setName(resultSet.getString("name"));
                item.setPrice(resultSet.getDouble("price"));
                item.setAmount(resultSet.getInt("amount"));
                Brands brands = new Brands(
                        resultSet.getLong("brands_id"),
                        resultSet.getString("brandName"),
                        resultSet.getString("country")
                );
                item.setBrand(brands);
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return item;
    }

    public static void updateUtil(Item item) {
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "UPDATE items SET name = ?, price = ?, amount = ? , brands_id = ? " +
                    "WHERE id = ?");
            statement.setString(1, item.getName());
            statement.setDouble(2, item.getPrice());
            statement.setInt(3, item.getAmount());
            statement.setLong(4, item.getBrand().getId());
            statement.setLong(5, item.getId());

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteItem(Long id) {
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "DELETE FROM items WHERE id = ?");
            statement.setLong(1, id);
            statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    public static ArrayList<Brands> getAllBrands() {
        ArrayList<Brands> brands = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT * from brands Order By name");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Brands brand = new Brands();
                brand.setId(resultSet.getLong("id"));
                brand.setName(resultSet.getString("name"));
                brand.setCountryName(resultSet.getString("country"));
                brands.add(brand);
            }
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return brands;
    }

    public static Brands getBrand(Long id) {
        Brands brand = null;
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT * from brands " +
                    "Where id = ?");
            statement.setLong(1,id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                brand = new Brands();
                brand.setId(resultSet.getLong("id"));
                brand.setName(resultSet.getString("name"));
                brand.setCountryName(   resultSet.getString("country"));

            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return brand;
    }

}


