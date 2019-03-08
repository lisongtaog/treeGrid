package test;

import org.junit.Before;
import org.junit.Test;
import redis.clients.jedis.Jedis;

import java.util.List;

/**
 * 支持String Hash List   Set  SortedSet数据结构
 * 保存数据类型都是String
 *
 * @author sks
 */
public class JedisTest {

    private Jedis jedis;

    //夹具
    @Before
    public void getJedis() {
        jedis = new Jedis("127.0.0.1", 6379);
    }

    /**
     * 对String操作
     */
    @Test
    public void testString() {
        //Jedis是Redis的连接，通过连接操作redis
        //jedis.select(1);
        jedis.set("english", "96");
        //jedis.del("yuwen");
        System.out.println(jedis.get("english"));
        jedis.close();
    }

    /**
     * 对Hash类型操作
     */
    @Test
    public void testHash() {
        //Jedis是Redis的连接，通过连接操作redis
        jedis.hset("scores", "yuwen", "60");

        System.out.println(jedis.hget("scores", "yuwen"));

        jedis.del("scores");
        jedis.close();
    }

    /**
     * 对List类型操作
     */
    @Test
    public void testList() {
        //Jedis是Redis的连接，通过连接操作redis
        jedis.lpush("dogs", "旺才", "小黑");
        List<String> list = jedis.lrange("dogs", 0, 1);
        for (String s : list) {
            System.out.print(s + " ");
        }
        jedis.close();
    }
}
