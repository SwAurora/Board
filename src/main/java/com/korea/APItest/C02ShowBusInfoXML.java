package com.korea.APItest;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ShowBusXML.Info")
public class C02ShowBusInfoXML extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/xml; charset=utf-8");

        String addr = "http://apis.data.go.kr/1613000/ExpBusInfoService/getExpBusTrminlList?serviceKey=1w828es7tjmBRwseETkFg4yxq%2BOIBObFHWzx01a4kMKh7sQFDNXqaLpNfyJflswbz5BNCIf0gvzy4cUjBetNyw%3D%3D&pageNo=1&numOfRows=230&_type=xml";

        URL url = new URL(addr);

        BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), StandardCharsets.UTF_8));
        StringBuffer sb = new StringBuffer();
        String str = null;

        while(true)
        {
            str = br.readLine();
            if(str == null)
                break;
            sb.append(str);
        }
        br.close();
        resp.getWriter().write(sb.toString());
    }
}