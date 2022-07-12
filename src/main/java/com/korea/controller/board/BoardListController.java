package com.korea.controller.board;

import com.korea.controller.SubController;
import com.korea.dto.BoardDTO;
import com.korea.service.BoardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class BoardListController implements SubController
{
    BoardService service = BoardService.getInstance();
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        try
        {
            int start = 0;
            int end = 10;

            List<BoardDTO> list = service.getBoardList(start, end);
            int tcnt = service.getTotalCnt();

            req.setAttribute("tcnt", tcnt);
            req.setAttribute("list", list);
            req.getRequestDispatcher("/WEB-INF/board/list.jsp").forward(req, resp);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
