package org.example;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @RunWith: 参数化运行器，用于指定junit运行环境，Spring提供SpringJUnit4ClassRunner作为JUnit测试环境
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = ("classpath:applicationContext.xml"))
public class BaseJunit4Test {
}
