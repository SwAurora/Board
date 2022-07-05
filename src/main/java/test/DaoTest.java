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
}