package com.imooc.controller;

import com.imooc.bean.Role;
import com.imooc.service.RoleService;
import com.imooc.util.JsonMsg;
import com.imooc.util.Md5;
import com.imooc.util.VerifyCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

@Controller
public class LoginRegisterController {

    @Autowired
    RoleService roleService;

    /**
     * 跳转到注册页面
     * @return
     */
    @RequestMapping(value = "/Reg", method = RequestMethod.GET)
    public String ToReg(){
        return "registered";
    }

    /**
     * 跳转到登录页面
     * @return
     */
    @RequestMapping(value = "/Log", method = RequestMethod.GET)
    public String ToLogin(){
        return "login";
    }

    /**
     * 跳转到主页页面
     * @return
     */
    @RequestMapping(value = "/Main", method = RequestMethod.GET)
    public String ToMain(){
        return "main";
    }

    /**
     * 头部页面
     * @return
     */
    @RequestMapping(value = "/Head", method = RequestMethod.GET)
    public String Head(){
        return "head";
    }

    /**
     * 教师/学生注册
     * @param request
     * @param session
     * @return
     * @throws UnsupportedEncodingException
     * @throws NoSuchAlgorithmException
     */
    @RequestMapping(value = "/doReg", method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg doReg(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        String t_rtype = request.getParameter("t_power");
        String s_rtype = request.getParameter("s_power");
        System.out.println(t_rtype + " " + s_rtype);
        Role role = new Role();
        String rname = "";
        String rphone = "";
        String rpassword = "";
        if (s_rtype == null) {
            rname = request.getParameter("tname");
            rphone = request.getParameter("tphone");
            rpassword = request.getParameter("tpassword");
            role.setRtype(Integer.parseInt(t_rtype));
        } else {
            rname = request.getParameter("sname");
            rphone = request.getParameter("sphone");
            rpassword = request.getParameter("spassword");
            role.setRtype(Integer.parseInt(s_rtype));
        }
        System.out.println(rname + " " + rphone + " " + rpassword + " " + t_rtype + " " + s_rtype);
        String Md5_pwd = Md5.EncoderByMd5(rpassword);
        System.out.println(Md5_pwd);
        role.setRname(rname);
        role.setRphone(rphone);
        role.setRpassword(Md5_pwd);
        //roleService.addRole(role);
        System.out.println("添加成功");
        return JsonMsg.success();
    }

    /**
     * 教师/学生登录
     * @param request
     * @param session
     * @return
     * @throws UnsupportedEncodingException
     * @throws NoSuchAlgorithmException
     */
    @RequestMapping(value = "/doLog", method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg doLogin(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        String s_rtype = request.getParameter("s_power");
        System.out.println( s_rtype);
        String rphone = "";
        String rpassword = "";
        if (s_rtype == null) {
            rphone = request.getParameter("tphone");
            rpassword = request.getParameter("tpassword");
        } else {
            rphone = request.getParameter("sphone");
            rpassword = request.getParameter("spassword");
        }
        String Md5_pwd = Md5.EncoderByMd5(rpassword);
        Role role = roleService.selectRoleByPhone(rphone);
        String pwd = role.getRpassword();
        if (Md5_pwd.equals(pwd)) {
            session.setAttribute("role", role);
            System.out.println("-----登录成功-----");
            return JsonMsg.success();
        } else
            System.out.println("-----密码错误-----");
        return JsonMsg.fail().addInfo("pwd_va_msg","密码错误");
    }

    /**
     * 退出登录
     * @param session
     * @return
     */
    @RequestMapping(value = "/Logout", method = RequestMethod.GET)
    public String Logout(HttpSession session){
        session.invalidate();
        return "main";
    }

    /**
     * 获取验证码
     * @param response
     * @param session
     */
    @RequestMapping(value = "/getVerifyCode", method = RequestMethod.GET)
    public void generate(HttpServletResponse response, HttpSession session) {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        String verifyCodeValue = VerifyCode.drawImg(output);
        System.out.println("获取验证码 " + verifyCodeValue);
        session.setAttribute("verifyCodeValue", verifyCodeValue);
        try {
            ServletOutputStream out = response.getOutputStream();
            output.writeTo(out);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 校验验证码
     *
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value = "/checkVerifyCode", method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg checkVerifyCode(HttpServletRequest request, HttpSession session) {
        String verifycode = request.getParameter("verifycode");
        String verifyCodeValue = (String) session.getAttribute("verifyCodeValue");
        //System.out.println("传值：" + verifycode + " 源值：" + verifyCodeValue);
        if (verifyCodeValue.equals(verifycode.toUpperCase())) {
            //System.out.println("---------- success ----------");
            return JsonMsg.success();
        } else {
            //System.out.println("---------- fail ----------");
            return JsonMsg.fail();
        }
    }

}
