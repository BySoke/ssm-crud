package org.example.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.example.mapper.UserMapper;
import org.example.model.User;
import org.example.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    //正常遍历所有
    @Override
    public List<User> findAll() {
        return userMapper.findAll();
    }

    //使用PageHelper分页遍历所有
    @Override
    public List<User> findPageHelper() {

        return userMapper.findAll();
    }

    //使用PageHelper分页查询
    @Override
    public List<User> findPage(Map<String, Object> map) {
        return userMapper.findPage(map);
    }

    //根据id删除
    @Override
    public Boolean deleteUserAjaxById(Integer id) {
        int num = userMapper.deleteByPrimaryKey(id);

        if (num != 0) {
            return true;
        }

        return false;
    }

    //批量删除
    @Override
    public Boolean deleteUserAjaxCheckedByIds(List<Integer> delIdList) {

        int num = userMapper.deleteUserAjaxCheckedByIds(delIdList);
        if (num != 0) {
            return true;
        }
        return false;
    }

    //保存 对象
    @Override
    public Boolean addUserinfo(User addUser) {
        int num = userMapper.insert(addUser);

        if (num != 0) {
            return true;
        }

        return false;
    }

    //查询id集合
    @Override
    public List findAllIds() {
        return userMapper.findAllIds();
    }

    //按 id 查询对象
    @Override
    public User findUserById(int id) {
        return userMapper.selectByPrimaryKey(id);
    }

    //更新 对象
    @Override
    public Boolean updateUserById(User user) {

        int num = userMapper.updateByPrimaryKey(user);

        if (num != 0) {
            return true;
        }

        return false;
    }


}
