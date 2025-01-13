//package vn.edu.hcmuaf.filter;
//
//import javax.servlet.*;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//import java.io.IOException;
//
//@WebFilter("/*")
//public class LanguageFilter implements Filter {
//    @Override
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//            throws IOException, ServletException {
//        HttpServletRequest rq = (HttpServletRequest) request;
//        rq.setCharacterEncoding("utf-8");
//
//        // Lấy tham số lang từ form POST
//        String lang = request.getParameter("lang");
//
//        // Lấy ngôn ngữ hiện tại từ session
//        String getLang = (String) rq.getSession().getAttribute("langName");
//
//        // Nếu có tham số lang trong request, lưu vào session
//        if (lang != null) {
//            // Lưu lang dưới dạng String
//            rq.getSession().setAttribute("langName", lang);
//        } else if (getLang == null) {
//            // Nếu không có tham số lang và session chưa có ngôn ngữ, đặt mặc định là "vi_VN"
//            rq.getSession().setAttribute("langName", "vi");
//        }
//
//        // Tiến hành tiếp tục chuỗi xử lý (chain)
//        chain.doFilter(request, response);
//
//    }
//
//}
