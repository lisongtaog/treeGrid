package bean;

public class Positions {
    private String name;
    private String type;
    private String ad_delay;
    private String home_delay;
    private String t_silent;
    private String auto_seq;
    private String switchs;
    private String play_chance_control;
    private String include_use_ad_type_mode;

    @Override
    public String toString() {
        return "Positions{" +
                "name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", ad_delay='" + ad_delay + '\'' +
                ", home_delay='" + home_delay + '\'' +
                ", t_silent='" + t_silent + '\'' +
                ", auto_seq='" + auto_seq + '\'' +
                ", switchs='" + switchs + '\'' +
                ", Play_chance_control='" + play_chance_control + '\'' +
                ", include_use_ad_type_mode='" + include_use_ad_type_mode + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAd_delay() {
        return ad_delay;
    }

    public void setAd_delay(String ad_delay) {
        this.ad_delay = ad_delay;
    }

    public String getHome_delay() {
        return home_delay;
    }

    public void setHome_delay(String home_delay) {
        this.home_delay = home_delay;
    }

    public String getT_silent() {
        return t_silent;
    }

    public void setT_silent(String t_silent) {
        this.t_silent = t_silent;
    }

    public String getAuto_seq() {
        return auto_seq;
    }

    public void setAuto_seq(String auto_seq) {
        this.auto_seq = auto_seq;
    }

    public String getSwitchs() {
        return switchs;
    }

    public void setSwitchs(String switchs) {
        this.switchs = switchs;
    }

    public String getPlay_chance_control() {
        return play_chance_control;
    }

    public void setPlay_chance_control(String play_chance_control) {
        this.play_chance_control = play_chance_control;
    }

    public String getInclude_use_ad_type_mode() {
        return include_use_ad_type_mode;
    }

    public void setInclude_use_ad_type_mode(String include_use_ad_type_mode) {
        this.include_use_ad_type_mode = include_use_ad_type_mode;
    }
}
