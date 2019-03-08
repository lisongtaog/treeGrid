package jedis;

/**
 * 对redis操作接口
 * @author sks
 *
 */
public interface JedisDAO {
	public String set(String key, String value);
	public String get(String key);
	public Long del(String key);

	public Long hset(String hkey, String key, String value);
	public String hget(String hkey, String key);
	public Long hdel(String hkey, String key);

	//设置失效时间,不支持hashmap中保存数据
	public Long expire(String key, int second);
	//获取剩余失效时间
	public Long ttl(String key);
	
	
}
