package test;

import com.korea.dto.MemberDTO;
import com.korea.service.MemberService;
import org.junit.Test;

public class ServiceTest
{
    @Test
    public void test()
    {
        MemberDTO dto = new MemberDTO();
        dto.setEmail("example2@example.com");
        dto.setPwd("1234");
        dto.setAddr1("대구광역시 달서구");
        dto.setAddr2("00아파트 000동 0000호");

        MemberService service = MemberService.getInstance();
        service.MemberInsert(dto);
    }
}
