package com.korea.dto;

import lombok.Data;

@Data
public class MemberDTO
{
    private String email;
    private String pwd;
    private String addr1;
    private String addr2;
    private String zipcode;
    private int grade; // 일반:1 | 관리자:2 | 익명:0
}
