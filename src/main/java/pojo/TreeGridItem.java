package pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class TreeGridItem implements Serializable {

    private String id;
    private String name;
    private String value;
    private String _parentId;
    private String state;
    private String configid;

    private List<TreeGridItem> children = new ArrayList<TreeGridItem>();

    @Override
    public String toString() {
        return "TreeGridItem{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", value='" + value + '\'' +
                ", _parentId='" + _parentId + '\'' +
                ", state='" + state + '\'' +
                ", configid='" + configid + '\'' +
                ", children=" + children +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String get_parentId() {
        return _parentId;
    }

    public void set_parentId(String _parentId) {
        this._parentId = _parentId;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getConfigid() {
        return configid;
    }

    public void setConfigid(String configid) {
        this.configid = configid;
    }

    public List<TreeGridItem> getChildren() {
        return children;
    }

    public void setChildren(List<TreeGridItem> children) {
        this.children = children;
    }

    public TreeGridItem(String id, String name, String value, String _parentId, String state, String configid, List<TreeGridItem> children) {

        this.id = id;
        this.name = name;
        this.value = value;
        this._parentId = _parentId;
        this.state = state;
        this.configid = configid;
        this.children = children;
    }

    public TreeGridItem() {

    }
}
