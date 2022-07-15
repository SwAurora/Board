package com.korea.controller.board;

import com.korea.controller.SubController;
import com.korea.dto.BoardDTO;
import com.korea.service.BoardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.util.ArrayList;

public class BoardPostController implements SubController
{
    BoardService service = BoardService.getInstance();
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        String flag = req.getParameter("flag");
        try
        {
            if(flag == null) // list.jsp에서 글쓰기 버튼을 누른 경우
            {
                req.getRequestDispatcher("/WEB-INF/board/post.jsp").forward(req, resp);
            }
            else // post.jsp에서 등록할 내용을 기입하고 글쓰기 버튼을 누른 경우
            {
                String title = req.getParameter("title");
                String content = req.getParameter("content");
                String password = req.getParameter("pwd");
                String ip = req.getRemoteAddr();
                HttpSession session = req.getSession();
                String writer = (String) session.getAttribute("email");

                if(title.equals("") || content.equals("") || password.equals("") || ip.equals(""))
                {
                    req.setAttribute("MSG", "비어있는 내용이 있습니다.");
                    req.getRequestDispatcher("/WEB-INF/board/post.jsp").forward(req, resp);
                    return;
                }

                BoardDTO dto = new BoardDTO();
                dto.setTitle(title);
                dto.setContent(content);
                dto.setPwd(password);
                dto.setWriter(writer);
                dto.setIp(ip);

                //첨부파일 part 전달
                ArrayList<Part> parts = (ArrayList<Part>) req.getParts();
                boolean result;
                long size = parts.get(3).getSize();
                if(size == 0) // 첨부파일이 없는 경우
                {
                    result = service.PostBoard(dto);
                }
                else // 첨부파일이 있는 경우
                {
                    result = service.PostBoard(dto, parts);
                }

                if(result)
                {
                    int tcnt = service.getTotalCnt();
                    ArrayList<BoardDTO> list =  (ArrayList<BoardDTO>) service.getBoardList(0, 10);
                    req.setAttribute("tcnt", tcnt);
                    req.setAttribute("list", list);
                    req.setAttribute("MSG", "작성을 완료하였습니다.");
                    req.getRequestDispatcher("/WEB-INF/board/list.jsp?nowPage=1").forward(req, resp);
                }
                else
                {
                    req.setAttribute("MSG", "작성에 실패했습니다.");
                    req.getRequestDispatcher("/WEB-INF/board/post.jsp").forward(req, resp);
                }
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
