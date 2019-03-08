package serviceImpl;

import mapper.AppIdVersionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.AppIdVersion;
import service.AppIdService;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AppIdServiceImpl implements AppIdService {

    @Resource
    private AppIdVersionMapper appIdVersionMapper;

    @Override
    public List<AppIdVersion> selAppIdVersion(AppIdVersion appIdVersion) {

        if (appIdVersion.getAppid() == null || appIdVersion.getAppid() == "") {
            return appIdVersionMapper.selAppIdVersion();
        }
        List<AppIdVersion> appIdVersions = appIdVersionMapper.selAppIdVersion2(appIdVersion);
        return appIdVersions;
    }

    @Override
    public Integer selAppIdToUpdate(String appid, String appid2) {

        AppIdVersion a = new AppIdVersion();

        Integer index = null;

        List<AppIdVersion> appIdVersions = appIdVersionMapper.selAppIdToUpdate(appid);

        for (int i = 0; i < appIdVersions.size(); i++) {
            a.setId(appIdVersions.get(i).getId());
            a.setAppid(appid2);
            index = appIdVersionMapper.upAppid(a);
            if (index < 0) {
                System.out.println("更新失败！！");
            }
        }
        return index;
    }

    @Override
    public Integer insAppid(Integer configIdPlus) {

        Integer index = appIdVersionMapper.insAppid(configIdPlus);
        return index;
    }

    @Override
    public Integer selMaxConfigId() {

        Integer maxConfigId = appIdVersionMapper.selMaxConfigId();
        return maxConfigId;
    }

    @Override
    public List<AppIdVersion> delAppid(String appid) {

        AppIdVersion appIdVersion = new AppIdVersion();
        appIdVersion.setAppid(appid);
        List<AppIdVersion> appIdVersions = appIdVersionMapper.selVersion(appIdVersion);

        Integer index = appIdVersionMapper.delAppid(appid);
        if (index > 0) {
            return appIdVersions;
        } else {
            return null;
        }
    }

    @Override
    public Integer upConfigJson(String configJson, String configid) {

        Integer integer = appIdVersionMapper.upConfigJson(configJson,configid);

        return integer;
    }
}
