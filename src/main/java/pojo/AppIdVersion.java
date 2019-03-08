package pojo;

import java.io.Serializable;

public class AppIdVersion implements Serializable {
    private int id;
    private String appid;
    private String version;
    private int state;
    private int configid;

    @Override
    public String toString() {
        return "AppIdVersion{" +
                "id=" + id +
                ", appid='" + appid + '\'' +
                ", version='" + version + '\'' +
                ", state=" + state +
                ", configid=" + configid +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public int getConfigid() {
        return configid;
    }

    public void setConfigid(int configid) {
        this.configid = configid;
    }
}
