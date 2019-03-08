package test;

import jedis.JedisDAO;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class JedisDAOSingleImplTest {

	@Test
	public void testString() {
		ApplicationContext context = new 
				ClassPathXmlApplicationContext("applicationContext-jedis.xml");

		JedisDAO jedisDAO = (JedisDAO) context.getBean("jedisDAO");
		
		jedisDAO.set("history", "88");
		
		String expected = "88";
		String actual = jedisDAO.get("history");
		System.out.println(actual);
		
		Assert.assertEquals(expected, actual);
	}
}
