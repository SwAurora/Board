package com.korea.controller.board;

import com.korea.controller.SubController;
import com.korea.dto.BoardDTO;
import com.korea.dto.ReplyDTO;
import com.korea.service.BoardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardReplyPostController implements SubController
{
    BoardService service = BoardService.getInstance();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        String comment = req.getParameter("comment");
        String nowPage = req.getParameter("nowPage");
        System.out.println(comment + " " + nowPage);

        HttpSession session = req.getSession();
        BoardDTO dto = (BoardDTO) session.getAttribute("dto");
        String email = (String)session.getAttribute("email");

        ReplyDTO rdto = new ReplyDTO();
        rdto.setBno(dto.getNo());
        rdto.setWriter(email);
        rdto.setContent(comment);

        service.replypost(rdto);
    }
}
