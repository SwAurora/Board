package com.korea.controller.board;

import com.korea.controller.SubController;
import com.korea.dto.BoardDTO;
import com.korea.service.BoardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardDeleteController implements SubController
{
    BoardService service = BoardService.getInstance();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        String pwd = req.getParameter("pwd");
        String nowPage = req.getParameter("nowPage");

        HttpSession session = req.getSession();
        BoardDTO dto = (BoardDTO) session.getAttribute("dto");

        if(dto.getPwd().equals(pwd))
        {
            service.RemoveBoard(dto);
            try
            {
                req.getRequestDispatcher("/Board/list.do?nowPage=" + nowPage).forward(req,resp);
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
    }
}
