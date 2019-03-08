package service;

import pojo.AppIdVersion;

import java.util.List;

public interface VersionService {

    /**
     * 根据appid version查询Version数据
     * @param appIdVersion
     * @return
     */
    List<AppIdVersion> selVersion(AppIdVersion appIdVersion);

    /**
     * 根据id更新Version数据
     * @param appIdVersion
     * @return
     */
    Integer upVersion(AppIdVersion appIdVersion);

    /**
     * 插入版本信息
     * @param appIdVersion
     * @return
     */
    Integer insVersion(AppIdVersion appIdVersion);

    /**
     * 删除版本信息
     * @param configid
     * @return
     */
    Integer delVersion(String configid);


    /**
     * 根据appid和version查询json
     * @param appId
     * @param version
     * @return
     */
    String selJson(String appId, String version);

}
