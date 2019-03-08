package pojo;

import java.io.Serializable;

public class Group implements Serializable {

    private int id;
    private String gId;
    private String gName;
    private String campaignId;
    private String adId;

    @Override
    public String toString() {
        return "Group{" +
                "id=" + id +
                ", gId='" + gId + '\'' +
                ", gName='" + gName + '\'' +
                ", campaignId='" + campaignId + '\'' +
                ", adId='" + adId + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getgId() {
        return gId;
    }

    public void setgId(String gId) {
        this.gId = gId;
    }

    public String getgName() {
        return gName;
    }

    public void setgName(String gName) {
        this.gName = gName;
    }

    public String getCampaignId() {
        return campaignId;
    }

    public void setCampaignId(String campaignId) {
        this.campaignId = campaignId;
    }

    public String getAdId() {
        return adId;
    }

    public void setAdId(String adId) {
        this.adId = adId;
    }
}
