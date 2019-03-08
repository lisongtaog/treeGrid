package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.AppIdVersion;
import pojo.TreeGridItem;
import service.AppIdService;
import service.TreeGridService;
import service.VersionService;
import util.JsonToJson;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class AppIdCon {
    @Resource
    private AppIdService appIdService;
    @Resource
    private VersionService versionService;
    @Resource
    private TreeGridService treeGridService;

    @RequestMapping("/selAppIdVersion")
    @ResponseBody
    public List<AppIdVersion> selAppIdVersion(AppIdVersion appIdVersion) {
        List<AppIdVersion> appIdVersions = appIdService.selAppIdVersion(appIdVersion);
        return appIdVersions;
    }

    @RequestMapping("/upAppId")
    @ResponseBody
    public Integer upAppId(String appid, String appid2) {
        Integer index = appIdService.selAppIdToUpdate(appid, appid2);
        return index;
    }

    @RequestMapping("/insAppid")
    public void insAppid(String configId) {
        Integer configIdPlus = Integer.parseInt(configId);
        Integer index = appIdService.insAppid(configIdPlus);
    }

    @RequestMapping("/selMaxConfigIdNext")
    @ResponseBody
    public Integer selMaxConfigId() {
        Integer maxConfigId = appIdService.selMaxConfigId();
        if (maxConfigId == null) {
            maxConfigId = 0;
        }
        Integer index = maxConfigId + 1;
        return index;
    }

    @RequestMapping("/delAppid")
    @ResponseBody
    public Integer delAppid(String appid) {
        List<AppIdVersion> appIdVersions = appIdService.delAppid(appid);
        if (appIdVersions == null) {
            return 0;
        } else {
            for (int i = 0; i < appIdVersions.size(); i++) {
                int j = appIdVersions.get(i).getConfigid();
                String configid = Integer.toString(j);
                versionService.delVersion(configid);
            }
            return 1;
        }
    }

    @RequestMapping("/makeJson")
    public void makeJson(String configid) {
        List<TreeGridItem> treeGridItems = treeGridService.selTreeGrid(configid);

        String configJson = JsonToJson.jsonToJson(treeGridItems);
        System.out.println(configJson);
        Integer integer = appIdService.upConfigJson(configJson,configid);
        System.out.println(integer);

    }

}
