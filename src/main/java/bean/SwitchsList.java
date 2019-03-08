package bean;

import java.util.List;

public class SwitchsList {

    private List<Switchs> switchsList;

    @Override
    public String toString() {
        return "SwitchsList{" +
                "switchsList=" + switchsList +
                '}';
    }

    public List<Switchs> getSwitchsList() {
        return switchsList;
    }

    public void setSwitchsList(List<Switchs> switchsList) {
        this.switchsList = switchsList;
    }
}
