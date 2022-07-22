package com.korea.controller.board;

import com.korea.controller.SubController;
import com.korea.dto.BoardDTO;
import com.korea.dto.ReplyDTO;
import com.korea.service.BoardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;

public class BoardReplyListController implements SubController
{
    BoardService service = BoardService.getInstance();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        // 읽고 있는 게시물의 모든 댓글 출력
        HttpSession session = req.getSession();
        BoardDTO dto = (BoardDTO) session.getAttribute("dto");

        ArrayList<ReplyDTO> list = service.getReplylist(dto.getNo());

        try
        {
            PrintWriter out = resp.getWriter();
            for(ReplyDTO rdto : list)
            {
                out.println("<div class='form-control'>");
                out.println("<span style=\"font-size: 0.7rem\">" + rdto.getWriter() + "</span>&nbsp;&nbsp;");
                out.println("<span style=\"font-size: 0.7rem\">" + rdto.getRegdate() + "</span><br>");
                out.println("<span>" + rdto.getContent() + "</span>");
                out.println("</div>");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
