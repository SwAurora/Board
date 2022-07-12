package com.korea.service;

import com.korea.dao.BoardDAO;
import com.korea.dto.BoardDTO;

import java.util.List;

public class BoardService
{
    BoardDAO dao = BoardDAO.getInstance();
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
}
