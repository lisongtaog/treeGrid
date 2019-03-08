package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class LoginCon {

//    @RequestMapping("/")
//    public String hello() {
//        return "redirect:/admin.jsp";
//    }


    @RequestMapping("/Login")
    public String Login(String userName, String passWard, HttpServletRequest request, HttpServletResponse response) throws IOException {
        if ("666".equals(userName) && "666".equals(passWard)) {
            request.getSession().setAttribute("user", "hello");
            return "/app";
        } else {
            request.getSession().setAttribute("user","帐号或密码错误！请重新输入！");
            return "redirect:/admin.jsp";
        }
    }

    /*
    *  使用restful进行页面请求通配
    *  WEB-INF 下的page页面间的相互访问走这里。
    */
    @RequestMapping("{uri}")
    public String getJsp(@PathVariable String uri){
        return uri;
    }
}
