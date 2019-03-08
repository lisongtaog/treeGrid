package service;

import pojo.TreeGridItem;

import java.util.List;

public interface TreeGridService {

    /**
     * 查询treeGrid数据
     * @param configid
     * @return
     */
    List<TreeGridItem> selTreeGrid(String configid);

    /**
     * 更新treeGrid数据
     * @param treeGridItem
     * @return
     */
    Integer upTreeGrid(TreeGridItem treeGridItem);

    /**
     * 插入treeGrid数据
     * @param treeGridItem
     * @return
     */
    Integer insTreeGrid(TreeGridItem treeGridItem);

    /**
     * 删除treeGrid数据
     * @param treeGridItem
     * @return
     */
    Integer delTreeGrid(TreeGridItem treeGridItem);

    /**
     * 查询最大的id
     * @return
     */
    TreeGridItem selMaxId();

    /**
     * 查询子节点
     * @param pid
     * @return
     */
    List<Integer> selTreeGridByPid(Integer pid);

}
