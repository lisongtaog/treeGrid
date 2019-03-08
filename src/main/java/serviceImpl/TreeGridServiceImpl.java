package serviceImpl;

import mapper.TreeGridMapper;
import org.springframework.stereotype.Service;
import pojo.TreeGridItem;
import service.TreeGridService;

import javax.annotation.Resource;
import java.util.List;
@Service
public class TreeGridServiceImpl implements TreeGridService {

    @Resource
    private TreeGridMapper treeGridMapper;

    /*
    *   获取所有节点数据
    */
    @Override
    public List<TreeGridItem> selTreeGrid(String configid) {
        return treeGridMapper.selTreeGrid(configid);
    }

    /*
     *   更新treeGrid数据
     */
    @Override
    public Integer upTreeGrid(TreeGridItem treeGridItem) {
        return treeGridMapper.upTreeGrid(treeGridItem);
    }

    /*
    *   插入treeGrid数据
    */
    @Override
    public Integer insTreeGrid(TreeGridItem treeGridItem) {
        return treeGridMapper.insTreeGrid(treeGridItem);
    }

    /*
    *   删除treeGrid数据
    */
    @Override
    public Integer delTreeGrid(TreeGridItem treeGridItem) {
        return treeGridMapper.delTreeGrid(treeGridItem);
    }

    /*
    *   查询最大的configid
    */
    @Override
    public TreeGridItem selMaxId() {
        TreeGridItem treeGridItem = treeGridMapper.selMaxId();
        return treeGridItem;
    }

    /*
    *   查询树表格数据byPid
    */
    @Override
    public List<Integer> selTreeGridByPid(Integer pid) {
        return treeGridMapper.selTreeGridByPid(pid);
    }


}
