package serviceImpl;

import mapper.GroupSeriesMapper;
import org.springframework.stereotype.Service;
import pojo.Group;
import service.GroupSeriesService;

import javax.annotation.Resource;
import java.util.List;

@Service
public class GroupSeriesServiceImpl implements GroupSeriesService {

    @Resource
    private GroupSeriesMapper groupSeriesMapper;


    @Override
    public Integer insGroup(Group group) {
        Integer index = groupSeriesMapper.insGroup(group);
        return index;
    }

    @Override
    public List<Group> selGroup() {
        List<Group> groups = groupSeriesMapper.selGroup();
        return groups;
    }

}
