package com.imooc.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.imooc.bean.Course;
import com.imooc.service.CourseService;
import com.imooc.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CourseController {

    @Autowired
    CourseService courseService;


    /**
     * 返回课程分页信息
     * @param pn
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getCourse",method = RequestMethod.GET)
    public JsonMsg getCourse(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        //引入PageHelper分页插件,在查询之前只需要调用，传入页码以及每页数据的数量
        PageHelper.startPage(pn,5);
        //startPage后面紧跟的查询就是一个分页查询
        List<Course> courseList = courseService.selectAllCourse();
        //用PageInfo对结果进行包装（封装了详细的分页信息，包括查询出来的结果）,传入连续显示的页数，之后交由页面处理
        PageInfo page = new PageInfo(courseList,5);
        return JsonMsg.success().addInfo("pageinfo",page);
    }
}
