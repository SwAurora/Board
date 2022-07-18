package com.korea.controller.board;

import com.korea.controller.SubController;
import com.korea.service.BoardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardDownloadController implements SubController
{
    BoardService service = BoardService.getInstance();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        String filename = req.getParameter("filename");

        boolean result = service.download(filename, req, resp);

    }
}
