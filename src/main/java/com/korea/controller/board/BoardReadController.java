package com.korea.controller.board;

import com.korea.controller.SubController;
import com.korea.dto.BoardDTO;
import com.korea.service.BoardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardReadController implements SubController
{
    BoardService service = BoardService.getInstance();
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        // 파라미터
        String no = req.getParameter("no");
        String nowPage = req.getParameter("nowPage");

        // 서비스 실행
        int num = Integer.parseInt(no);
        BoardDTO dto = service.getBoardDTO(num);
        // 뷰로 이동
        try
        {
            req.setAttribute("dto", dto);
            req.setAttribute("nowPage", nowPage);
            req.getRequestDispatcher("/WEB-INF/board/read.jsp").forward(req,resp);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
