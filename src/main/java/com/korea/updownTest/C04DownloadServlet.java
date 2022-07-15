package com.korea.updownTest;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet("/download.do")
public class C04DownloadServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        // 경로설정
        String downdir = "c://upload";
        String filename = req.getParameter("filename");
        String filepath = downdir + File.separator + filename;

        // 헤더설정
        resp.setContentType("application/octet-stream");

        // 문자셋 설정
        filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
        resp.setHeader("Content-Disposition", "attachment; fileName=" + filename);

        // 스트림 설정(다운로드 코드)
        byte[] buffer = new byte[4096]; // 버퍼공간
        FileInputStream fin = new FileInputStream(filepath); // 입력스트림(파일 -> 서블릿)
        ServletOutputStream sout = resp.getOutputStream(); // 출력스트림(서블릿(서버) -> 브라우저)

        int read;
        while(true)
        {
            read = fin.read(buffer, 0, buffer.length); // 파일 -> 서블릿으로 buffer 공간의 0부터 buffer길이만큼 담음
                                                            // read에는 읽어들인 byte수가 저장됨 읽을게 없으면 -1
            if(read == -1)
                break;
            sout.write(buffer,0,read); // buffer안의 데이터를 읽어들인 바이트 수만큼 브라우저로 전송
        }
        sout.flush();
        sout.close();
        fin.close();
        // 뷰로 이동
    }
}
