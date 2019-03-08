package serviceImpl;

import mapper.VactoryMapper;
import org.springframework.stereotype.Service;
import service.VactoryService;

import javax.annotation.Resource;

@Service
public class VactoryServiceImpl implements VactoryService {

    @Resource
    private VactoryMapper vactoryMapper;

    @Override
    public Integer insVactory(String appid, String version, String series, String config) {

        Integer index = vactoryMapper.insVactory(appid, version, series, config);
        return index;
    }
}
