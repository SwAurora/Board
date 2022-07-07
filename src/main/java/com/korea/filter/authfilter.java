package com.korea.filter;

import javax.servlet.*;
import java.io.IOException;

public class authfilter implements Filter
{
    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException
    {
        // Request 전 처리
        System.out.println("Filter 처리(Request 전)");
        chain.doFilter(req, resp);
        // Response 후 처리
        System.out.println("Filter 처리(Response 전)");
    }
}
