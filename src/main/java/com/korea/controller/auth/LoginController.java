package com.korea.controller.auth;

import com.korea.controller.SubController;
import com.korea.dto.MemberDTO;
import com.korea.service.MemberService;
import org.mindrot.bcrypt.BCrypt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginController implements SubController
{
    MemberService service = MemberService.getInstance();
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        System.out.println("LoginController로 진입!");
        // 파라미터 받기
        String email = req.getParameter("email");
        String pwd = req.getParameter("pwd");
        // 입력값 검증
        try
        {
            if(email == null || pwd == null)
            {
                resp.sendRedirect("/");
            }
            // 서비스 실행
            MemberDTO dto = service.MemberSearch(email);
            if(dto != null)
            {
                if(BCrypt.checkpw(pwd, dto.getPwd()))
                {
                    HttpSession session = req.getSession();
                    session.setAttribute("email", dto.getEmail());
                    session.setAttribute("grade", dto.getGrade());
                    session.setMaxInactiveInterval(60*5);
                    // View로 이동
                    resp.sendRedirect("/main.jsp");
                }
                else
                {
                    req.setAttribute("MSG", "패스워드가 일치하지 않습니다.");
                    req.getRequestDispatcher("/").forward(req, resp);
                }
            }
            else
            {
                req.setAttribute("MSG", "일치하는 아이디가 없습니다.");
                req.getRequestDispatcher("/").forward(req, resp);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
