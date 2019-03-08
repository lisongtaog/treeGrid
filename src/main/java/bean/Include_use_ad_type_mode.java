package bean;

public class Include_use_ad_type_mode {
    private String name;
    private String weight;
    private String random_delay;

    @Override
    public String toString() {
        return "Include_use_ad_type_mode{" +
                "name='" + name + '\'' +
                ", weight='" + weight + '\'' +
                ", random_delay='" + random_delay + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getRandom_delay() {
        return random_delay;
    }

    public void setRandom_delay(String random_delay) {
        this.random_delay = random_delay;
    }
}
