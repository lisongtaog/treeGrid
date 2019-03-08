package bean;

public class Use_ad_type_mode {
    private String name;
    private String ad_type;
    private String desc;
    private String ids;

    public Use_ad_type_mode(String name, String ad_type, String desc, String ids) {
        this.name = name;
        this.ad_type = ad_type;
        this.desc = desc;
        this.ids = ids;
    }

    public Use_ad_type_mode() {

    }

    @Override
    public String toString() {
        return "Use_ad_type_mode{" +
                "name='" + name + '\'' +
                ", ad_type='" + ad_type + '\'' +
                ", desc='" + desc + '\'' +
                ", ids='" + ids + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAd_type() {
        return ad_type;
    }

    public void setAd_type(String ad_type) {
        this.ad_type = ad_type;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getIds() {
        return ids;
    }

    public void setIds(String ids) {
        this.ids = ids;
    }
}
