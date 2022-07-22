package com.korea.controller.board;

import com.korea.controller.SubController;
import com.korea.dto.BoardDTO;
import com.korea.service.BoardService;

import javax.servlet.http.Cookie;
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
            String tmpstart = req.getParameter("start");
            String tmpend = req.getParameter("end");
            String nowPage = req.getParameter("nowPage");
            int start = 0;
            int end = 10;
            if(!(tmpstart == null || tmpend == null))
            {
                start = Integer.parseInt(tmpstart);
            }

            List<BoardDTO> list = service.getBoardList(start, end);
            int tcnt = service.getTotalCnt();

            req.setAttribute("tcnt", tcnt);
            req.setAttribute("list", list);

            // 쿠키생성(게시글읽기 새로고침시 중복Count방지)
            Cookie init = new Cookie("init", "true");
            resp.addCookie(init);

            req.getRequestDispatcher("/WEB-INF/board/list.jsp?nowPage" + nowPage).forward(req, resp);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
