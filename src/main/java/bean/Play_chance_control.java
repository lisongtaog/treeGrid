package bean;

public class Play_chance_control {
    private String play_chance;
    private String chances;

    @Override
    public String toString() {
        return "Play_chance_control{" +
                "play_chance='" + play_chance + '\'' +
                ", chances='" + chances + '\'' +
                '}';
    }

    public String getPlay_chance() {
        return play_chance;
    }

    public void setPlay_chance(String play_chance) {
        this.play_chance = play_chance;
    }

    public String getChances() {
        return chances;
    }

    public void setChances(String chances) {
        this.chances = chances;
    }
}
