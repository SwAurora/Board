package test;

import com.korea.dao.BoardDAO;
import com.korea.dao.MemberDAO;
import com.korea.dto.BoardDTO;
import com.korea.dto.MemberDTO;
import com.korea.service.MemberService;
import org.junit.Test;

import java.util.List;

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

    @Test
    public void test4()
    {
        MemberDTO dto = new MemberDTO();
        dto.setEmail("admin@admin.com");
        dto.setPwd("1234");
        dto.setAddr1("");
        dto.setAddr2("");
        dto.setGrade(2);

        MemberService service = MemberService.getInstance();
        service.MemberInsert(dto);

        dto.setEmail("guest@guest.com");
        dto.setPwd("1234");
        dto.setAddr1("");
        dto.setAddr2("");
        dto.setGrade(0);

        service.MemberInsert(dto);
    }

    @Test
    public void test5()
    {
        BoardDAO dao = BoardDAO.getInstance();
        List<BoardDTO> list = dao.Select(11, 20);
        list.forEach(dto -> System.out.println(dto));
    }

    @Test
    public void test6()
    {
        BoardDAO dao = BoardDAO.getInstance();
        int result = dao.getTotalCount();
        System.out.println(result);
    }

    @Test
    public void test7()
    {
        BoardDAO dao = BoardDAO.getInstance();
        BoardDTO dto = new BoardDTO();
        dto.setTitle("NEW TITLE");
        dto.setContent("NEW CONTENT");
        dto.setWriter("NEW WRITER");
        dto.setPwd("1234");
        dto.setIp("127.0.0.1");
        boolean check = dao.insult(dto);
        System.out.println("결과: " + check);
    }
}