package inter;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyInter implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String path = request.getServletPath();



        if ("/".equals(path) || "/Login".equals(path) || "/css/bootstrap.min.css".equals(path) || "/images/bird.ico".equals(path) || "/insGroup".equals(path)||"/combine".equals(path)||"/GroupSeries".equals(path)) {
            return true;
        }
        String user = (String) request.getSession().getAttribute("user");
        if ("hello".equals(user)) {
            return true;
        }
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
