package com.korea.dao;

import com.korea.dto.MemberDTO;

import java.sql.*;

public class MemberDAO
{
    private String url = "jdbc:mysql://localhost:3306/board";
    private String id = "root";
    private String pw = "1234";

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    private static MemberDAO instance;

    public static MemberDAO getInstance()
    {
        if(instance == null)
        {
            instance = new MemberDAO();
        }
        return instance;
    }

    private MemberDAO()
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, id, pw);
            System.out.println("DB Connected.");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    // INSERT 함수
    public boolean insert(MemberDTO dto)
    {
        try
        {
            pstmt = conn.prepareStatement("insert into tbl_member values(?,?,?,?,?)");
            pstmt.setString(1, dto.getEmail());
            pstmt.setString(2, dto.getPwd());
            pstmt.setString(3, dto.getAddr1());
            pstmt.setString(4, dto.getAddr2());
            pstmt.setInt(5, dto.getGrade());

            int result = pstmt.executeUpdate();

            if(result > 0)
            {
                return true;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            try
            {
                pstmt.close();
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
        return false;
    }

    public MemberDTO Select(String email)
    {
        MemberDTO dto = new MemberDTO();
        try
        {
            pstmt = conn.prepareStatement("select * from tbl_member where email = ?");
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            if(rs.next())
            {
                dto.setEmail(email);
                dto.setPwd(rs.getString("pwd"));
                dto.setAddr1(rs.getString("addr1"));
                dto.setAddr2(rs.getString("addr2"));
                dto.setGrade(rs.getInt("grade"));
                return dto;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            try
            {
                if(rs != null)
                {
                    rs.close();
                }
                pstmt.close();
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
        return null;
    }

    public boolean Update(MemberDTO dto)
    {
        try
        {
            pstmt = conn.prepareStatement("update tbl_member set addr1 = ?, addr2 = ?, grade = ?, pwd = ? where email = ?");
            pstmt.setString(1, dto.getAddr1());
            pstmt.setString(2, dto.getAddr2());
            pstmt.setInt(3, dto.getGrade());
            pstmt.setString(4, dto.getPwd());
            pstmt.setString(5, dto.getEmail());
            int result = pstmt.executeUpdate();
            if(result > 0)
                return true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }
}