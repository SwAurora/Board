package com.korea.dto;

import lombok.Data;

@Data
public class BoardDTO
{
    private int no;
    private String title;
    private String content;
    private String writer;
    private String regdate;
    private String pwd;
    private int count;
    private String ip;
    private String filename;
    private String filesize;
}
