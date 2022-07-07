package com.korea.service;

import com.korea.dao.MemberDAO;
import com.korea.dto.MemberDTO;
import org.mindrot.bcrypt.BCrypt;

public class MemberService
{
    MemberDAO dao = MemberDAO.getInstance();
    private static MemberService instance = null;
    public static MemberService getInstance()
    {
        if(instance == null)
        {
            instance = new MemberService();
        }
        return instance;
    }

    private MemberService()
    {

    }

    public boolean MemberInsert(MemberDTO dto)
    {
        String pwd = BCrypt.hashpw(dto.getPwd(), BCrypt.gensalt());
        System.out.println("PWD(EN) : " + pwd);
        dto.setPwd(pwd);
        return dao.insert(dto);
    }

    public MemberDTO MemberSearch(String email)
    {
        return dao.Select(email);
    }

    public boolean MemberUpdate(MemberDTO dto)
    {
        return dao.Update(dto);
    }

}
