package bean;

import java.util.List;

public class PositionsList {
    private List<Positions> positionsList;

    @Override
    public String toString() {
        return "PositionsList{" +
                "positionsList=" + positionsList +
                '}';
    }

    public List<Positions> getPositionsList() {
        return positionsList;
    }

    public void setPositionsList(List<Positions> positionsList) {
        this.positionsList = positionsList;
    }
}
