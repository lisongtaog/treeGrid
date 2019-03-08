package bean;

import java.io.Serializable;

public class Config implements Serializable {

    private String user_class;
    private String switchs;
    private String auto_load;
    private String user_ad_type_mode;
    private String positions;

    @Override
    public String toString() {
        return "Config{" +
                "user_class='" + user_class + '\'' +
                ", switchs='" + switchs + '\'' +
                ", auto_load='" + auto_load + '\'' +
                ", user_ad_type_mode='" + user_ad_type_mode + '\'' +
                ", positions='" + positions + '\'' +
                '}';
    }

    public String getUser_class() {
        return user_class;
    }

    public void setUser_class(String user_class) {
        this.user_class = user_class;
    }

    public String getSwitchs() {
        return switchs;
    }

    public void setSwitchs(String switchs) {
        this.switchs = switchs;
    }

    public String getAuto_load() {
        return auto_load;
    }

    public void setAuto_load(String auto_load) {
        this.auto_load = auto_load;
    }

    public String getUser_ad_type_mode() {
        return user_ad_type_mode;
    }

    public void setUser_ad_type_mode(String user_ad_type_mode) {
        this.user_ad_type_mode = user_ad_type_mode;
    }

    public String getPositions() {
        return positions;
    }

    public void setPositions(String positions) {
        this.positions = positions;
    }
}
