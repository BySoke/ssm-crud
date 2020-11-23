package org.example;

import javafx.application.Application;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

/**
 * Spring测试类
 * @Service: Spring会自动扫描该注解的类，并把这些纳入进Spring容器中，可以使用@Component注解代替
 */

@Service
public class SpringTest {

    @Test
    public void testSpring() {
        //获取运行上下文
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        //获取SpringTest测试类
        SpringTest springTest = (SpringTest) applicationContext.getBean("springTest");
        //调用sayHello方法
        springTest.sayHello();
    }

    public void sayHello() {
        System.out.println("hello spring");
    }
}
