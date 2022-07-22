package com.korea.controller.board;

import com.korea.controller.SubController;
import com.korea.dto.BoardDTO;
import com.korea.service.BoardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardUpdateController implements SubController
{
    BoardService service = BoardService.getInstance();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String pwd = req.getParameter("pwd");
        String nowPage = req.getParameter("nowPage");

        HttpSession session = req.getSession();
        BoardDTO dto = (BoardDTO) session.getAttribute("dto");

        if(dto.getPwd().equals(pwd))
        {
            dto.setTitle(title);
            dto.setContent(content);
            service.UpdateBoard(dto);
            session.setAttribute("dto", dto);
            try
            {
                String msg = "업데이트 성공!";
                req.setAttribute("MSG", msg);
                req.getRequestDispatcher("/Board/read.do?no=" + dto.getNo() + "&nowPage=" + nowPage).forward(req, resp);
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
        else
        {
            try
            {
                String msg = "잘못된 비밀번호 입니다.";
                req.setAttribute("MSG", msg);
                req.getRequestDispatcher("/Board/read.do?no=" + dto.getNo() + "&nowPage=" + nowPage).forward(req, resp);
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
    }
}
