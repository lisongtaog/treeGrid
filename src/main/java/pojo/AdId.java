package pojo;

public class AdId {
    private String id;

    public AdId(String id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "AdId{" +
                "id='" + id + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
