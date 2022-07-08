package com.korea.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;

public class authfilter implements Filter
{
    HashMap<String, Integer> pageGradeMap = new HashMap<>();

    @Override
    public void init(FilterConfig filterConfig)
    {
        pageGradeMap.put("/Board/list.do", 0); // 모두 가능
        pageGradeMap.put("/Board/post.do", 1); // 일반 계정권한 이상

        pageGradeMap.put("/Notice/list.do", 0); // 모두 가능
        pageGradeMap.put("/Notice/post.do", 2); // 관리자만 가능
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException
    {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession();
        int usergrade = 0;
        if(session.getAttribute("grade") != null)
            usergrade = (Integer) session.getAttribute("grade");
        System.out.println("UserGrade : " + usergrade);

        String URL = request.getRequestURI();
        System.out.println("Filter's URL : " + URL);
        int pagegrade = 0;
        if(pageGradeMap.get(URL) != null)
            pagegrade = pageGradeMap.get(URL);
        System.out.println("PageGrade : " + pagegrade);
        if(usergrade == 0 && pagegrade >= 1)
            throw new ServletException("로그인이 필요한 페이지입니다.");
        if(usergrade < 2 && pagegrade == 2)
            throw new ServletException("페이지에 접근할 권한이 없습니다.");

        // ↑ Request 전처리
        chain.doFilter(req, resp);
        // ↓ Response 후 처리
    }
}
