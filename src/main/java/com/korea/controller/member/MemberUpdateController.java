package com.korea.controller.member;

import com.korea.controller.SubController;
import com.korea.dto.MemberDTO;
import com.korea.service.MemberService;
import org.mindrot.bcrypt.BCrypt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberUpdateController implements SubController
{
    private MemberService service = MemberService.getInstance();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        String flag = req.getParameter("flag");
        try
        {
            if(flag == null)
            {
                req.getRequestDispatcher("/WEB-INF/member/password.jsp").forward(req, resp);
            }
            else // password.jsp에서 요청받음
            {
                // 패스워드 검증 후 일치하다면 정보수정
                String pwd = req.getParameter("pwd");
                HttpSession session = req.getSession();
                String email = (String) session.getAttribute("email");
                MemberDTO dto = service.MemberSearch(email);
                if(BCrypt.checkpw(pwd, dto.getPwd()))
                {
                    // 패스워드 일치
                    String addr1 = req.getParameter("addr1");
                    String addr2 = req.getParameter("addr2");

                    dto.setAddr1(addr1);
                    dto.setAddr2(addr2);

                    String newpwd = req.getParameter("newpwd");
                    newpwd = BCrypt.hashpw(newpwd, BCrypt.gensalt());
                    dto.setPwd(newpwd);

                    service.MemberUpdate(dto);
                    req.setAttribute("dto", dto);
                    // View로 이동
                    req.getRequestDispatcher("/WEB-INF/member/myinfo.jsp").forward(req, resp);
                }
                else
                {
                    // 패스워드 불일치
                    req.setAttribute("MSG", "패스워드가 맞지않습니다.");
                    req.getRequestDispatcher("/WEB-INF/member/password.jsp").forward(req, resp);
                }
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
