package service;

import pojo.AppIdVersion;

import java.util.List;

public interface AppIdService {

    /*
     *  查询AppIdVersion数据
     */
    List<AppIdVersion> selAppIdVersion(AppIdVersion appIdVersion);

    /*
     *   根据更新的条件，查询出要更新的appid,并进行更新。
     */
    Integer selAppIdToUpdate(String appid, String appid2);

    /*
     *   插入appid
     */
    Integer insAppid(Integer configIdPlus);

    /*
     *   查询最大的configId
     */
    Integer selMaxConfigId();

    /*
     *   删除appid
     */
    List<AppIdVersion> delAppid(String appid);

    /**
     * 更新configJson内容
     * @param configJson
     * @param configid
     * @return
     */
    Integer upConfigJson(String configJson, String configid);




}
