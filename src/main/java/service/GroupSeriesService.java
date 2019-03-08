package service;

import pojo.Group;

import java.util.List;

public interface GroupSeriesService {

    /**
     * 插入Group信息
     * @param group
     * @return
     */
    Integer insGroup(Group group);


    /**
     * 查询所有的组信息
     * @return
     */
    List<Group> selGroup();


}
