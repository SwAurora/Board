package com.korea.controller.member;

import com.korea.controller.SubController;
import com.korea.dto.MemberDTO;
import com.korea.service.MemberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberJoinController implements SubController
{
    private MemberService service = MemberService.getInstance();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        System.out.println("=========MemberJoinController=========");

        String flag = req.getParameter("flag");

        try
        {
            if(flag == null)
            {
                req.getRequestDispatcher("/WEB-INF/member/join.jsp").forward(req, resp);
            }
            else
            {
                //1 파라미터 받기
                String email = req.getParameter("email");
                String pwd = req.getParameter("pwd");
                String addr1 = req.getParameter("addr1");
                String addr2 = req.getParameter("addr2");
                //2 입력값 검증1
                //3 서비스 실행
                MemberDTO dto = new MemberDTO();
                dto.setEmail(email);
                dto.setPwd(pwd);
                dto.setAddr1(addr1);
                dto.setAddr2(addr2);
                boolean result = service.MemberInsert(dto);
                //4 View 이동
                resp.sendRedirect("/");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

    }
}
