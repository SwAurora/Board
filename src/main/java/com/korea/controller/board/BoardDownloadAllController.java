package com.korea.controller.board;

import com.korea.controller.SubController;
import com.korea.dto.BoardDTO;
import com.korea.service.BoardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardDownloadAllController implements SubController
{
    BoardService service = BoardService.getInstance();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        // 읽고 있는 게시물 꺼내기
        HttpSession session = req.getSession();
        BoardDTO dto = (BoardDTO) session.getAttribute("dto");

        // 서비스 실행(zip압축 다운메소드)
        boolean result = service.downloadAllZIP(dto, resp);
    }
}
