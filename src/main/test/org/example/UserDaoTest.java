package org.example;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.example.mapper.UserMapper;
import org.example.model.User;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.List;

/**
 * UserDao测试类
 */
public class UserDaoTest extends BaseJunit4Test {

    @Resource
    private UserMapper userMapper;

    @Test
    public void testFindAll() {

        List<User> userList = userMapper.findAll();

        System.out.println("用户表数据共有：" + userList.size());
    }

    @Test
    public void testPageHelper() {

        //第几页，多少条数据
        PageHelper.startPage(0,1);

        List<User> userList = userMapper.findAll();
        //对查询结果进行封装
        PageInfo pageInfo = new PageInfo(userList);

        System.out.println(pageInfo);
    }

}
