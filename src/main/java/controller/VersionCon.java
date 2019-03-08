package controller;

import jedis.JedisDAO;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.AppIdVersion;
import service.VersionService;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class VersionCon {

    @Resource
    private VersionService versionService;


    @RequestMapping("/selVersion")
    @ResponseBody
    public List<AppIdVersion> selVersion(AppIdVersion appIdVersion) {

        List<AppIdVersion> appIdVersions = versionService.selVersion(appIdVersion);
        return appIdVersions;
    }

    @RequestMapping("/upVersion")
    @ResponseBody
    public Integer upVersion(AppIdVersion appIdVersion) {
        Integer index = versionService.upVersion(appIdVersion);
        return index;
    }

    @RequestMapping("/insVersion")
    @ResponseBody
    public Integer insVersion(AppIdVersion appIdVersion) {
        Integer index = versionService.insVersion(appIdVersion);
        return index;
    }

    @RequestMapping("/delVersion")
    @ResponseBody
    public Integer delVersion(String configid) {
        Integer index = versionService.delVersion(configid);
        return index;
    }

    @RequestMapping("/updataAppidDelRedis")
    public void updataAppidDelRedis(AppIdVersion appIdVersion) {

        String appid = "";
        String version = "";

        List<AppIdVersion> appIdVersions = versionService.selVersion(appIdVersion);

        for (int i = 0; i < appIdVersions.size(); i++) {
            appid = appIdVersions.get(i).getAppid();
            version = appIdVersions.get(i).getVersion();

            String deleteKey = appid + version;
            //数据插入redit中
            ApplicationContext context = new
                    ClassPathXmlApplicationContext("applicationContext-jedis.xml");
//
            JedisDAO jedisDAO = (JedisDAO) context.getBean("jedisDAO");
//
            jedisDAO.del(deleteKey);
        }
    }

}
