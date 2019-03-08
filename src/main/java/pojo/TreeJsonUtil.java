package pojo;

import java.util.ArrayList;
import java.util.List;

public class TreeJsonUtil {

    public static List<TreeGridItem> formatTree(List<TreeGridItem> list) {

        TreeGridItem root = new TreeGridItem();

        //拼揍好的json格式的数据
        List<TreeGridItem> treelist = new ArrayList<TreeGridItem>();

        if (list != null && list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
                //如果该节点没有父节点那么它就是根（root）节点
                if ("".equals(list.get(i).get_parentId() == null ? "" : 1)||"".equals(list.get(i).get_parentId())) {
                    root = list.get(i);
                    //获取该根节点的子节点
                    getChildrenNodes(list, root);
                    treelist.add(root);
                }
            }
        }
        return treelist;
    }

    public static void getChildrenNodes(List<TreeGridItem> nodes, TreeGridItem root) {

        for (TreeGridItem treeGridItem : nodes) {
            //在根节点中下寻找它的子节点
            if (root.getId().equals(treeGridItem.get_parentId())) {//如果找到root的子节点
                //在父节点下添加子节点
                root.getChildren().add(treeGridItem);
                //添加关闭属性
                root.setState("closed");
                //寻找子节点的子节点
                getChildrenNodes(nodes, treeGridItem);
            }
        }
    }
}
