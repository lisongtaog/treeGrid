package mapper;

import pojo.TreeGridItem;

import java.util.List;

public interface TreeGridMapper {

    /*
     *  查询treeGrid数据
     */
    List<TreeGridItem> selTreeGrid(String configid);

    /*
     *   更新treeGrid数据
     */
    Integer upTreeGrid(TreeGridItem treeGridItem);

    /*
    *   插入treeGrid数据
    */
    Integer insTreeGrid(TreeGridItem treeGridItem);

    /*
    *   删除treeGrid数据
    */
    Integer delTreeGrid(TreeGridItem treeGridItem);

    /*
    *   查询最大的id
    */
    TreeGridItem selMaxId();

    /*
    *   查询子节点
    */
    List<Integer> selTreeGridByPid(Integer pid);

    /*
     *   删除版本byConfigid
     */
    Integer delTreeGridByConfigid(String configid);
}
