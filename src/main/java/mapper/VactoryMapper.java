package mapper;

public interface VactoryMapper {

    /**
     * 插入合并后的config文件
     * @param appid
     * @param version
     * @param series
     * @param config
     * @return
     */
    Integer insVactory(String appid, String version, String series, String config);
}
