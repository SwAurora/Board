package com.korea.dto;

import lombok.Data;

@Data
public class ReplyDTO
{
    private int rno;
    private int bno;
    private String writer;
    private String content;
    private String regdate;
}
