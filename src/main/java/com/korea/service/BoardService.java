package com.korea.service;

import com.korea.dao.BoardDAO;
import com.korea.dto.BoardDTO;

import javax.servlet.http.Part;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public class BoardService
{
    private BoardDAO dao = BoardDAO.getInstance();
    private String UploadPath = "C://upload/";
    private static BoardService instance = null;

    public static BoardService getInstance()
    {
        if(instance == null)
        {
            instance = new BoardService();
        }
        return instance;
    }

    private BoardService()
    {

    }

    public List<BoardDTO> getBoardList(int start, int end)
    {
        return dao.Select(start, end);
    }

    public int getTotalCnt()
    {
        return dao.getTotalCount();
    }

    public boolean PostBoard(BoardDTO dto)
    {
        return dao.insert(dto);
    }

    //파일포함 글쓰기 서비스
    public boolean PostBoard(BoardDTO dto, ArrayList<Part> parts)
    {
        // 업로드 처리
        // 1) 하위폴더명(Email/2022-07-14/파일쌓기)
        // 2) 기본업로드 Path + 하위폴더명
        String email = dto.getWriter();
        Date now = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String date = simpleDateFormat.format(now);
        String subPath = email + "/" + date;

        // 3) File클래스 경로 잡기
        File RealPath = new File(UploadPath + subPath);

        // 4) 하위폴더 생성
        if(!RealPath.exists())
            RealPath.mkdirs();

        // 파일명 저장위한 StringBuffer 추가
        StringBuilder totalFilename = new StringBuilder();
        // 파일사이즈 저장위한 StringBuffer 추가
        StringBuilder totalFilesize = new StringBuilder();


        // 5) Parts의 각 Part를 write()
        for(Part part : parts)
        {
            if(part.getName().equals("files"))
            {
                String FileName = getFileName(part);

                totalFilename.append(FileName).append(";");
                totalFilesize.append(part.getSize()).append(";");

                String ext = FileName.substring(FileName.lastIndexOf(".") + 1);
                FileName = FileName.replaceAll("." + ext, "");
                FileName = FileName + "_" + UUID.randomUUID() + "." + ext;
                try
                {
                    part.write(RealPath + "/" + FileName);
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
        }

        // DTO에 총파일명과 총파일사이즈를 저장
        dto.setFilename(totalFilename.toString());
        dto.setFilesize(totalFilesize.toString());

        // DAO 파일명 전달
        return dao.insert(dto);
    }

    // 파일명추출(PostBoard(dto, parts)에서 사용)
    private String getFileName(Part part)
    {
        String contentDisp = part.getHeader("content-disposition");
        String[] arr = contentDisp.split(";");
        return arr[2].substring(11, arr[2].length() - 1);
    }
}
