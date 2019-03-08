package controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.AdId;
import pojo.Group;
import service.GroupSeriesService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
public class GroupCon {
    @Resource
    private GroupSeriesService groupSeriesService;

    /**
     * 插入涛哥传来的数据
     * @param groupString
     */
    @RequestMapping("/insGroup")
    public void insGroup(String groupString) {
        groupString = "{\n" +
                "  \"gId\": \"广告系组ID\",\n" +
                "  \"gName\": \"广告系组名称test1\",\n" +
                "  \"campaignId\": [\n" +
                "    {\n" +
                "\t\t\"id\": 1,\n" +
                "\t\t\"name\": \"系列1名称\"\n" +
                "\t},\n" +
                "\t{\n" +
                "\t\t\"id\": 2,\n" +
                "\t\t\"name\": \"系列2名称\"\n" +
                "\t}\n" +
                "  ],\n" +
                "  \"adId\": {\n" +
                "\t\t\"fInterId\": [\n" +
                "            \"facebook插屏广告单元ID_1\",\n" +
                "            \"facebook插屏广告单元ID_2\"\n" +
                "        ],\n" +
                "        \"fNativeId\": [\n" +
                "            \"facebook原生广告单元ID_1\",\n" +
                "            \"facebook原生广告单元ID_1\"\n" +
                "        ],\n" +
                "        \"fBannerId\": [\n" +
                "            \"facebook横幅广告单元ID_1\",\n" +
                "            \"facebook横幅广告单元ID_2\"\n" +
                "        ],\n" +
                "        \"gInterId\": [\n" +
                "            \"google插屏广告单元ID_1\",\n" +
                "            \"google插屏广告单元ID_2\"\n" +
                "        ],\n" +
                "        \"gNativeId\": [\n" +
                "            \"google原生广告单元ID_1\",\n" +
                "            \"google原生广告单元ID_2\"\n" +
                "        ],\n" +
                "        \"gBannerId\": [\n" +
                "            \"google原生广告单元ID_1\",\n" +
                "            \"google原生广告单元ID_2\"\n" +
                "        ]\n" +
                "\t}\n" +
                "}";

        System.out.println(groupString);
        JSONObject jsonObject = JSONObject.parseObject(groupString);
        Group group = new Group();
        group.setgId(jsonObject.getString("gId"));
        group.setgName(jsonObject.getString("gName"));
        group.setCampaignId(jsonObject.getString("campaignId"));
        group.setAdId(jsonObject.getString("adId"));

        System.out.println(group);
        Integer index = groupSeriesService.insGroup(group);
        if (index > 0) {
            System.out.println("插入成功!");
        }
    }


    /**
     * 查询涛哥传来的groupSeries数据
     * @return
     */
    @RequestMapping("/selgIdgName")
    @ResponseBody
    public List<Group> selgIdgName() {
        //所有的Group
        List<Group> groups = groupSeriesService.selGroup();

        groups = changeGroups(groups, "fInterId");
        groups = changeGroups(groups, "fNativeId");
        groups = changeGroups(groups, "fBannerId");
        groups = changeGroups(groups, "gInterId");
        groups = changeGroups(groups, "gNativeId");
        groups = changeGroups(groups, "gBannerId");

        return groups;

    }

    /**
     * 工具方法
     * 改变adId的json格式，使其满足easyui dataGrid的要求。
     * @param groups
     * @param qqq
     * @return
     */
    public List<Group> changeGroups(List<Group> groups, String qqq) {
        for (int i = 0; i < groups.size(); i++) {
            List<AdId> listAdId = new ArrayList<AdId>();
            String adId = groups.get(i).getAdId();
            JSONObject jsonObjectadId = JSONObject.parseObject(adId);
            JSONArray jsonArrayfInterId = jsonObjectadId.getJSONArray(qqq);
            for (int j = 0; j < jsonArrayfInterId.size(); j++) {
                AdId adId1 = new AdId(jsonArrayfInterId.getString(j));
                listAdId.add(adId1);
            }
            String stringListAdId = JSONArray.toJSONString(listAdId);
            JSONArray jsonObjectListAdId = JSONObject.parseArray(stringListAdId);
            jsonObjectadId.put(qqq, jsonObjectListAdId);
            String adId2 = JSONObject.toJSONString(jsonObjectadId);
            groups.get(i).setAdId(adId2);
        }
        return groups;
    }

}
