package test;

import com.korea.dao.MemberDAO;
import com.korea.dto.MemberDTO;
import org.junit.Test;

public class DaoTest
{
    @Test
    public void test()
    {
        MemberDTO dto = new MemberDTO();
        dto.setEmail("example@example.com");
        dto.setPwd("1234");
        dto.setAddr1("대구광역시 달서구");
        dto.setAddr2("00아파트 000동 0000호");

        MemberDAO dao = MemberDAO.getInstance();
        boolean result = dao.insert(dto);
        if(result)
        {
            System.out.println("Insert 성공");
        }
        else
        {
            System.out.println("Insert 실패");
        }
    }

    @Test
    public void test2()
    {
        // MemberDAO's Select(email)
        MemberDAO dao = MemberDAO.getInstance();
        MemberDTO dto = dao.Select("aaaaa@naver.com");
        System.out.println("결과 : " + dto.toString());
    }
    @Test
    public void test3()
    {
        MemberDTO dto = new MemberDTO();
        dto.setEmail("ttt@naver.com");
        dto.setPwd("1234");
        dto.setAddr1("서울");
        dto.setAddr2("00구 00동");
        MemberDAO dao = MemberDAO.getInstance();
        dao.Update(dto);
    }
}