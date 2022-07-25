package com.korea.controller;

import com.korea.controller.auth.LoginController;
import com.korea.controller.auth.LogoutController;
import com.korea.controller.board.*;
import com.korea.controller.member.MemberInfoController;
import com.korea.controller.member.MemberJoinController;
import com.korea.controller.member.MemberUpdateController;
import com.korea.controller.notice.NoticeListController;
import com.korea.controller.notice.NoticePostController;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@MultipartConfig(
        fileSizeThreshold = 1024*1024*10, // 10mb
        maxFileSize = 1024*1024*50, // 50mb
        maxRequestSize = 1024*1024*100 // 100mb
)
public class FrontController extends HttpServlet
{
    HashMap<String, SubController> list = null;

    @Override
    public void init()
    {
        list = new HashMap<>();
        // 기본
        list.put("/index.do", new IndexController());
        list.put("/main.do", new MainController());
        // 회원관련
        list.put("/MemberJoin.do", new MemberJoinController());
        list.put("/MemberInfo.do", new MemberInfoController());
        list.put("/MemberUpdate.do", new MemberUpdateController());
        // 인증관련
        list.put("/Login.do", new LoginController());
        list.put("/Logout.do", new LogoutController());
        // 게시판관련
        list.put("/Board/list.do", new BoardListController());
        list.put("/Board/post.do", new BoardPostController());
        list.put("/Board/read.do", new BoardReadController());
        list.put("/Board/download.do", new BoardDownloadController());
        list.put("/Board/downloadAll.do", new BoardDownloadAllController());
        list.put("/Board/update.do", new BoardUpdateController());
        list.put("/Board/delete.do", new BoardDeleteController());
        list.put("/Board/replypost.do", new BoardReplyPostController());
        list.put("/Board/replylist.do", new BoardReplyListController());
        list.put("/Board/replycnt.do", new BoardReplyCntController());
        // 공지관련
        list.put("/Notice/list.do", new NoticeListController());
        list.put("/Notice/post.do", new NoticePostController());
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws IOException
    {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        String url = req.getRequestURI();
        System.out.println("URL: " + url);
        SubController sub = list.get(url);

        if(sub != null)
            list.get(url).execute(req, resp);
    }
}
