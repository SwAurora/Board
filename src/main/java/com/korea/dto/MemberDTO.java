package com.korea.dto;

import lombok.Data;

@Data
public class MemberDTO
{
    private String email;
    private String pwd;
    private String addr1;
    private String addr2;
    private int grade; // 일반:1 | 관리자:2 | 익명:0

    public MemberDTO()
    {
        grade = 1;
    }

    public MemberDTO(String email, String pwd, String addr1, String addr2, int grade)
    {
        this.email = email;
        this.pwd = pwd;
        this.addr1 = addr1;
        this.addr2 = addr2;
        this.grade = grade;
    }
}
