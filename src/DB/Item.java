package DB;

public class Item {
    private long id;
    private String name;
    private double price;
    private int amount;
    private Brands brand;

    public Item() {
    }

    public Item(long id, String name, double price, int amount, Brands brand) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.amount = amount;
        this.brand = brand;
    }

    public Long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Brands getBrand() {
        return brand;
    }

    public void setBrand(Brands brand) {
        this.brand = brand;
    }
}
