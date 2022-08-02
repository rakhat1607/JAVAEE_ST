package DB;

public class Brands {
    private Long id;
    private String name;
    private String countryName;

    public Brands() {
    }

    public Brands(Long id, String name, String countryName) {
        this.id = id;
        this.name = name;
        this.countryName = countryName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }
}
