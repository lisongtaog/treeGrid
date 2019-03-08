package bean;

import java.util.List;

public class Include_use_ad_type_modeList {

    private List<Include_use_ad_type_mode> include_use_ad_type_modeList;

    @Override
    public String toString() {
        return "Include_use_ad_type_modeList{" +
                "include_use_ad_type_modeList=" + include_use_ad_type_modeList +
                '}';
    }

    public Include_use_ad_type_modeList(List<Include_use_ad_type_mode> include_use_ad_type_modeList) {
        this.include_use_ad_type_modeList = include_use_ad_type_modeList;
    }

    public Include_use_ad_type_modeList() {

    }

    public List<Include_use_ad_type_mode> getInclude_use_ad_type_modeList() {

        return include_use_ad_type_modeList;
    }

    public void setInclude_use_ad_type_modeList(List<Include_use_ad_type_mode> include_use_ad_type_modeList) {
        this.include_use_ad_type_modeList = include_use_ad_type_modeList;
    }
}
