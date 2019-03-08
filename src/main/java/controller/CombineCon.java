package controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import jedis.JedisDAO;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Group;
import service.GroupSeriesService;
import service.VactoryService;
import service.VersionService;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class CombineCon {

    @Resource
    private GroupSeriesService groupSeriesService;
    @Resource
    private VersionService versionService;
    @Resource
    private VactoryService vactoryService;

    @RequestMapping("/combine")
    public void combine(String appId, String version, String seriesId) {
        Group group = new Group();
        seriesId = (seriesId == null) ? (seriesId = "2") : seriesId;

        //所有的Group
        List<Group> groups = groupSeriesService.selGroup();

        for (int i = 0; i < groups.size(); i++) {
            String campaignId = groups.get(i).getCampaignId();
            JSONArray jsonArrayCampaignId = JSONObject.parseArray(campaignId);
            for (int j = 0; j < jsonArrayCampaignId.size(); j++) {
                JSONObject jsonObjectCampaignId = jsonArrayCampaignId.getJSONObject(j);
                if (seriesId.equals(jsonObjectCampaignId.getString("id"))) {
                    group = groups.get(i);
                }
            }
        }

        if (group == null) {
            System.out.println("不存在seriesId!!");
            return;
        }

        System.out.println(group);

        String adIdString = group.getAdId();

        JSONObject jsonObjectAdId = JSONObject.parseObject(adIdString);

        JSONArray fInterId = jsonObjectAdId.getJSONArray("fInterId");
        JSONArray fNativeId = jsonObjectAdId.getJSONArray("fNativeId");
        JSONArray fBannerId = jsonObjectAdId.getJSONArray("fBannerId");
        JSONArray gInterId = jsonObjectAdId.getJSONArray("gInterId");
        JSONArray gNativeId = jsonObjectAdId.getJSONArray("gNativeId");
        JSONArray gBannerId = jsonObjectAdId.getJSONArray("gBannerId");

        appId = "com.voip";
        version = "1";

        String config = versionService.selJson(appId, version);

        JSONObject jsonObject = JSONObject.parseObject(config);

        if (jsonObject == null) {
            return;
        }

        JSONObject jsonObjectConfig = jsonObject.getJSONObject("Config");

        JSONArray jsonArrayUse_ad_type_mode = jsonObjectConfig.getJSONArray("use_ad_type_mode[]");

        if (jsonArrayUse_ad_type_mode == null) {
            return;
        }

        for (int i = 0; i < jsonArrayUse_ad_type_mode.size(); i++) {
            JSONObject jsonObjectUse_ad_type_mode = jsonArrayUse_ad_type_mode.getJSONObject(i);
            String name = jsonObjectUse_ad_type_mode.getString("name");

            switch (name) {
                case "facebook_full_screen":
                    jsonObjectUse_ad_type_mode.put("ids[]", fInterId);
                    break;
                case "admob_full_screen":
                    jsonObjectUse_ad_type_mode.put("ids[]", gInterId);
                    break;
                case "facebook_banner":
                    jsonObjectUse_ad_type_mode.put("ids[]", fBannerId);
                    break;
                case "facebook_native2full_screen":
                    jsonObjectUse_ad_type_mode.put("ids[]", fNativeId);
                    break;
                case "facebook_native2banner":
                    jsonObjectUse_ad_type_mode.put("ids[]", fNativeId);
                    break;
                case "facebook_native":
                    jsonObjectUse_ad_type_mode.put("ids[]", fNativeId);
                    break;
                case "admob_native2full_screen":
                    jsonObjectUse_ad_type_mode.put("ids[]", gNativeId);
                    break;
                case "admob_native2banner":
                    jsonObjectUse_ad_type_mode.put("ids[]", gNativeId);
                    break;
                case "admob_native":
                    jsonObjectUse_ad_type_mode.put("ids[]", gNativeId);
                    break;
                case "admob_banner":
                    jsonObjectUse_ad_type_mode.put("ids[]", gBannerId);
                    break;
                case "admob_banner2native":
                    jsonObjectUse_ad_type_mode.put("ids[]", gBannerId);
                    break;
                case "admob_video":
                    jsonObjectUse_ad_type_mode.put("ids[]", "");
                    break;
                case "vungle_video":
                    jsonObjectUse_ad_type_mode.put("ids[]", "");
                    break;
                case "unity_video":
                    jsonObjectUse_ad_type_mode.put("ids[]", "");
                    break;
                case "admob_news":
                    jsonObjectUse_ad_type_mode.put("ids[]", "");
                    break;
                case "facebook_news":
                    jsonObjectUse_ad_type_mode.put("ids[]", "");
                    break;
                case "recommend_full":
                    jsonObjectUse_ad_type_mode.put("ids[]", "");
                    break;
                case "recommend_native":
                    jsonObjectUse_ad_type_mode.put("ids[]", "");
                    break;
                case "upgrade":
                    jsonObjectUse_ad_type_mode.put("ids[]", "");
                    break;
                case "discard":
                    jsonObjectUse_ad_type_mode.put("ids[]", "");
                    break;
            }
        }

        String jsonObjectString = jsonObject.toString();

        Integer index = vactoryService.insVactory(appId, version, seriesId, jsonObjectString);

        if (index > 0) {
            System.out.println("插入成功！！");
        }


        String combineKey = appId + version;
        //数据插入redit中
        ApplicationContext context = new
                ClassPathXmlApplicationContext("applicationContext-jedis.xml");

        JedisDAO jedisDAO = (JedisDAO) context.getBean("jedisDAO");

        jedisDAO.set(combineKey, jsonObjectString);

        String vactory = jedisDAO.get(combineKey);
        System.out.println(vactory);

    }

    @RequestMapping("/deleteRedisData")
    @ResponseBody
    public String deleteRedisData(String appid, String version) {

        String deleteKey = appid + version;
        //数据插入redit中
        ApplicationContext context = new
                ClassPathXmlApplicationContext("applicationContext-jedis.xml");
//
        JedisDAO jedisDAO = (JedisDAO) context.getBean("jedisDAO");
//
        jedisDAO.del(deleteKey);
        return "更新成功！！！";
    }
}
