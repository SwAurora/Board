package com.korea.controller.member;

import com.korea.controller.SubController;
import com.korea.dto.MemberDTO;
import com.korea.service.MemberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberInfoController implements SubController
{
    MemberService service = MemberService.getInstance();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        HttpSession session = req.getSession();
        try
        {
            String email = (String) session.getAttribute("email");
            MemberDTO dto = service.MemberSearch(email);
            req.setAttribute("email", dto.getEmail());
            req.setAttribute("addr1", dto.getAddr1());
            req.setAttribute("addr2", dto.getAddr2());
            req.getRequestDispatcher("/WEB-INF/member/myinfo.jsp").forward(req, resp);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
