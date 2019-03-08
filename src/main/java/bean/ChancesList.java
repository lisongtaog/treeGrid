package bean;

import java.util.List;

public class ChancesList {

    private List<Chances> chancesList;

    @Override
    public String toString() {
        return "ChancesList{" +
                "chancesList=" + chancesList +
                '}';
    }

    public List<Chances> getChancesList() {
        return chancesList;
    }

    public void setChancesList(List<Chances> chancesList) {
        this.chancesList = chancesList;
    }

    public ChancesList() {

    }

    public ChancesList(List<Chances> chancesList) {

        this.chancesList = chancesList;
    }
}
