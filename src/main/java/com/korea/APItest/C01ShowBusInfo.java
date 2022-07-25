package com.korea.APItest;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.charset.StandardCharsets;

@WebServlet("/ShowBus.Info")
public class C01ShowBusInfo extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException
    {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=UTF-8");
        String addr = "http://apis.data.go.kr/1613000/SuburbsBusInfoService/getSuberbsBusTrminlList?serviceKey=7sfG3tu4mJKEVNsyhhsSn7nRPuWQSHw7L1lBXG6Cpf%2B6SzN0veH15BObi6JhDTtDOnjLr6j71oo2ZSTWbAefIg%3D%3D&pageNo=1&numOfRows=3000&_type=json";
        URL url = new URL(addr);
        BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), StandardCharsets.UTF_8));
        StringBuilder sb = new StringBuilder();
        String str;
        while(true)
        {
            str = br.readLine();
            if(str==null)
                break;
            sb.append(str);
        }
        br.close();
        resp.getWriter().write(sb.toString());
    }
}
