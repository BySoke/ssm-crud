package org.example.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import org.example.model.User;
import org.example.service.UserService;

import org.example.utils.Msg;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

import java.util.*;

@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Resource
    private UserService userService;

    //正常遍历所有
    @RequestMapping("/findAll")
    public String findAll(Model model) {

        List<User> userList = userService.findAll();
        model.addAttribute("userList", userList);

        return "list";
    }

    //使用PageHelper分页列表遍历
    @RequestMapping("/findPageHelper")
    public ModelAndView findPageHelper(@RequestParam(defaultValue = "1") int page,
                                       @RequestParam(defaultValue = "5") int size) {

        PageHelper.startPage(page, size);
        List<User> userList = userService.findPageHelper();
        PageInfo pageInfo = new PageInfo(userList);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("/pageHelper");

        return modelAndView;
    }

    //PageHelper分页查询
    @RequestMapping(value = "/findPage")
    public ModelAndView findPage(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                                 @RequestParam(value = "size", required = false, defaultValue = "5") Integer size,
                                 User user) {

        Map<String, Object> map = new HashMap<>();

        if (user.getId() != null) {
            map.put("id", user.getId());
        }
        if (StringUtil.isNotEmpty(user.getName())) {
            map.put("name", user.getName());
        }
        if (user.getAge() != null) {
            map.put("age", user.getAge());
        }
        if (StringUtil.isNotEmpty(user.getPassword())) {
            map.put("password", user.getPassword());
        }
        if (StringUtil.isNotEmpty(user.getPhone())) {
            map.put("phone", user.getPhone());
        }
        if (StringUtil.isNotEmpty(user.getCity())) {
            map.put("city", user.getCity());
        }

        PageHelper.startPage(page, size);

        List<User> userList = userService.findPage(map);

        ModelAndView modelAndView = new ModelAndView("page");
        modelAndView.addObject("pageInfo", new PageInfo(userList));
        modelAndView.addObject("queryParam", user);
        return modelAndView;
    }

    //PageHelper分页查询
    @RequestMapping(value = "/jumpPage")
    public ModelAndView jumpPage() {
        ModelAndView modelAndView = new ModelAndView("pageHelperAjax");

        return modelAndView;
    }


    //PageHelper分页遍历 ajax
    @RequestMapping(value = "/findPageHelperAjax", method = RequestMethod.POST)
    @ResponseBody
    public Msg findPageHelperAjax(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                                  @RequestParam(value = "size", required = false, defaultValue = "5") Integer size,
                                  User user) {

        Map<String, Object> map = new HashMap<>();

        if (user.getId() != null) {
            map.put("id", user.getId());
        }
        if (StringUtil.isNotEmpty(user.getName())) {
            map.put("name", user.getName());
        }
        if (user.getAge() != null) {
            map.put("age", user.getAge());
        }
        if (StringUtil.isNotEmpty(user.getPassword())) {
            map.put("password", user.getPassword());
        }
        if (StringUtil.isNotEmpty(user.getPhone())) {
            map.put("phone", user.getPhone());
        }
        if (StringUtil.isNotEmpty(user.getCity())) {
            map.put("city", user.getCity());
        }

        PageHelper.startPage(page, size);

        List<User> userList = userService.findPage(map);

        PageInfo<User> pageInfo = new PageInfo(userList);

        return Msg.success().add("pageInfo", pageInfo);
    }

    @RequestMapping(value = "/deleteUserAjax/{ids}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteUserAjax(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                              @RequestParam(value = "size", required = false, defaultValue = "5") Integer size,
                              @PathVariable("ids") String ids) {

        PageHelper.startPage(page, size);

        if (ids.contains("-")) {
            List<Integer> delIdList = new ArrayList<Integer>();

            String[] idsStr = ids.split("-");
            for (String id : idsStr) {
                delIdList.add(Integer.parseInt(id));
            }
            Boolean flag = userService.deleteUserAjaxCheckedByIds(delIdList);
        } else {
            Boolean flag = userService.deleteUserAjaxById(Integer.parseInt(ids));
        }

        return Msg.success();
    }

    @RequestMapping(value = "/addUserAjax", method = RequestMethod.POST)
    @ResponseBody
    public Msg addUserAjax(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                           @RequestParam(value = "size", required = false, defaultValue = "5") Integer size, User user) {

        PageHelper.startPage(page, size);

        User addUser = new User();

        if (user.getId() != null) {
            addUser.setId(user.getId());
        }

        if (StringUtil.isNotEmpty(user.getName())) {
            addUser.setName(user.getName());
        }
        if (user.getAge() != null) {
            addUser.setAge(user.getAge());
        }
        if (StringUtil.isNotEmpty(user.getPassword())) {
            addUser.setPassword(user.getPassword());
        }
        if (StringUtil.isNotEmpty(user.getPhone())) {
            addUser.setPhone(user.getPhone());
        }
        if (StringUtil.isNotEmpty(user.getCity())) {
            addUser.setCity(user.getCity());
        }

        Boolean flag = userService.addUserinfo(addUser);

        return Msg.success();
    }

    @RequestMapping(value = "/editUserAjax/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Msg editUserAjax(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                              @RequestParam(value = "size", required = false, defaultValue = "5") Integer size,
                              @PathVariable("id") String id) {

        PageHelper.startPage(page, size);

        User user = userService.findUserById(Integer.parseInt(id));

        return Msg.success().add("user", user);
    }

    @RequestMapping(value = "/updateUserAjax", method = RequestMethod.POST)
    @ResponseBody
    public Msg updateUserAjax(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                            @RequestParam(value = "size", required = false, defaultValue = "5") Integer size,
                            User user) {

        PageHelper.startPage(page, size);

        Boolean flag = userService.updateUserById(user);

        return Msg.success();
    }
}
