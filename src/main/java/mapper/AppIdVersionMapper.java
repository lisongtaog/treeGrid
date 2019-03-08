package mapper;

import pojo.AppIdVersion;

import java.util.List;

public interface AppIdVersionMapper {

    /**
     * 查询AppIdVersion数据(无参数)
     * @return
     */
    List<AppIdVersion> selAppIdVersion();

    /**
     * 查询AppIdVersion数据(有参数)模糊查询
     * @param appIdVersion
     * @return
     */
    List<AppIdVersion> selAppIdVersion2(AppIdVersion appIdVersion);

    /**
     * 根据更新的条件，查询出要更新的appid
     * @param appid
     * @return
     */
    List<AppIdVersion> selAppIdToUpdate(String appid);

    /**
     * 根据id进行appid的更新
     * @param appIdVersion
     * @return
     */
    Integer upAppid(AppIdVersion appIdVersion);

    /**
     * 插入appid
     * @param configIdPlus
     * @return
     */
    Integer insAppid(Integer configIdPlus);

    /**
     * 查询最大的configId
     * @return
     */
    Integer selMaxConfigId();

    /**
     * 删除appid
     * @param appid
     * @return
     */
    Integer delAppid(String appid);


    /******************************************************************************/

    /**
     * 根据appid查询Version数据
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
     * 根据appid和version查询AppIdVersion数据(有参数)
     * @param appIdVersion
     * @return
     */
    List<AppIdVersion> selVersion2(AppIdVersion appIdVersion);

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

    /********************************************************************/

    /**
     * 更新configJson内容
     * @param configJson
     * @param configid
     * @return
     */
    Integer upConfigJson(String configJson, String configid);

    /**
     * 根据appid和version查询json
     * @param appId
     * @param version
     * @return
     */
    String selJson(String appId, String version);

}
