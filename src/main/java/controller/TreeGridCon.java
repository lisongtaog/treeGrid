package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.TreeGridItem;
import pojo.TreeJsonUtil;
import service.TreeGridService;
import util.JsonToJson;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
public class TreeGridCon {

    //声明业务层对象,并用注解注入
    @Resource
    private TreeGridService treeGridService;

    @RequestMapping("/selTreeGrid")
    @ResponseBody
    public List<TreeGridItem> selTreeGrid(String configid) {
        List<TreeGridItem> treeGridItems = treeGridService.selTreeGrid(configid);
        if (treeGridItems.size() == 0) {
            return treeGridItems;
        } else {
            List<TreeGridItem> treeList = TreeJsonUtil.formatTree(treeGridItems);
            return treeList;
        }
    }

    @RequestMapping("/upTreeGrid")
    @ResponseBody
    public Integer upTreeGrid(@RequestBody TreeGridItem treeGridItem) {
        Integer index = treeGridService.upTreeGrid(treeGridItem);
        return index;
    }

    @RequestMapping("/insTreeGrid")
    @ResponseBody
    public Integer insTreeGrid(@RequestBody TreeGridItem treeGridItem) {
        Integer index = treeGridService.insTreeGrid(treeGridItem);
        return index;
    }

    @RequestMapping("/delTreeGrid")
    @ResponseBody
    public Integer delTreeGrid(TreeGridItem treeGridItem) {
        Integer index = treeGridService.delTreeGrid(treeGridItem);
        return index;
    }

    @RequestMapping("/selMaxId")
    @ResponseBody
    public TreeGridItem selMaxId() {
        TreeGridItem treeGridItem = treeGridService.selMaxId();
        return treeGridItem;
    }

    @RequestMapping("/selTreeGridByPid")
    @ResponseBody
    public List<Integer> selTreeGridByPid(int pid) {
        List<Integer> listId = treeGridService.selTreeGridByPid(pid);
        return listId;
    }

    @RequestMapping("/buildConfig")
    public String configBuild(String configid, HttpServletRequest req) {
        //这里初始化Config
        TreeGridItem treeGridItem0 = new TreeGridItem();
        treeGridItem0.setConfigid(configid);
        treeGridItem0.setName("Config");
        treeGridService.insTreeGrid(treeGridItem0);
        String maxId0 = treeGridService.selMaxId().getId();

        TreeGridItem treeGridItem1 = new TreeGridItem();
        treeGridItem1.setConfigid(configid);
        treeGridItem1.set_parentId(maxId0);
        treeGridItem1.setName("user_class");
        treeGridService.insTreeGrid(treeGridItem1);

        TreeGridItem treeGridItem2 = new TreeGridItem();
        treeGridItem2.setConfigid(configid);
        treeGridItem2.set_parentId(maxId0);
        treeGridItem2.setName("switch[]");
        treeGridService.insTreeGrid(treeGridItem2);

        TreeGridItem treeGridItem3 = new TreeGridItem();
        treeGridItem3.setConfigid(configid);
        treeGridItem3.set_parentId(maxId0);
        treeGridItem3.setName("auto_load");
        treeGridService.insTreeGrid(treeGridItem3);

        TreeGridItem treeGridItem4 = new TreeGridItem();
        treeGridItem4.setConfigid(configid);
        treeGridItem4.set_parentId(maxId0);
        treeGridItem4.setName("use_ad_type_mode[]");
        treeGridService.insTreeGrid(treeGridItem4);

        TreeGridItem treeGridItem5 = new TreeGridItem();
        treeGridItem5.setConfigid(configid);
        treeGridItem5.set_parentId(maxId0);
        treeGridItem5.setName("position[]");
        treeGridService.insTreeGrid(treeGridItem5);

        req.setAttribute("configid", configid);
        return "/makeConfig";
    }




}