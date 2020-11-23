package org.example.service;

import com.github.pagehelper.PageInfo;
import org.example.model.User;


import java.util.List;
import java.util.Map;

public interface UserService {

    List<User> findAll();

    List<User> findPageHelper();

    List<User> findPage(Map<String,Object> map);

    Boolean deleteUserAjaxById(Integer id);

    Boolean deleteUserAjaxCheckedByIds(List<Integer> delIdList);

    Boolean addUserinfo(User addUser);

    List findAllIds();

    User findUserById(int parseInt);

    Boolean updateUserById(User user);
}
