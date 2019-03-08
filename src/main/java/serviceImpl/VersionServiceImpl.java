package serviceImpl;

import mapper.AppIdVersionMapper;
import mapper.TreeGridMapper;
import org.springframework.stereotype.Service;
import pojo.AppIdVersion;
import service.VersionService;

import javax.annotation.Resource;
import java.util.List;
@Service
public class VersionServiceImpl implements VersionService {

    @Resource
    private AppIdVersionMapper appIdVersionMapper;

    @Resource
    private TreeGridMapper treeGridMapper;

    @Override
    public List<AppIdVersion> selVersion(AppIdVersion appIdVersion) {

        if (appIdVersion.getVersion() == null || appIdVersion.getVersion() == "") {
            List<AppIdVersion> appIdVersions = appIdVersionMapper.selVersion(appIdVersion);
            return appIdVersions;
        }
        return appIdVersionMapper.selVersion2(appIdVersion);
    }

    @Override
    public Integer upVersion(AppIdVersion appIdVersion) {
        return appIdVersionMapper.upVersion(appIdVersion);
    }

    @Override
    public Integer insVersion(AppIdVersion appIdVersion) {
        Integer index = appIdVersionMapper.insVersion(appIdVersion);
        return index;
    }

    @Override
    public Integer delVersion(String configid) {
        Integer index = appIdVersionMapper.delVersion(configid);
        index += treeGridMapper.delTreeGridByConfigid(configid);
        return index;
    }

    @Override
    public String selJson(String appId, String version) {
        String json = appIdVersionMapper.selJson(appId, version);
        return json;
    }




}
