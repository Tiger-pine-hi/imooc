package com.imooc.controller;


import com.imooc.bean.Role;
import com.imooc.service.RoleService;
import com.imooc.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class RoleController {

    @Autowired
    RoleService roleService;

    /**
     * 检验手机号是否存在，存在就不能注册
     *
     * @param phone
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/checkRoleByPhone", method = RequestMethod.POST)
    public JsonMsg checkUserByPhone(@RequestParam("phone") String phone) {
        String phone_format = "(^[1][3,5,7,8][0-9]{9}$)";
        if (!phone.matches(phone_format)) {
            System.out.println(phone);
            System.out.println("格式错误");
            return JsonMsg.fail().addInfo("phone_va_msg", "请输入正确的手机账号");
        }
        //数据库账号重复校验
        Role role = roleService.selectRoleByPhone(phone);
        if (role == null) {
            //System.out.println("不存在，可注册不可登录");
            return JsonMsg.success().addInfo("phone_va_msg", "该账号不存在");
        }else {
            //System.out.println("存在,可登录不可注册");
            return JsonMsg.fail().addInfo("phone_va_msg", "该账号已被注册");
        }
    }


}
