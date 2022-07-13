package com.korea.updownTest;

import java.io.File;
import java.io.FileFilter;
import java.io.FilenameFilter;

public class C01FileCLass
{
    public static void main(String[] args)
    {
        File tmp = new File("C://upload");

        // 파일&디렉토리 여부 확인
        if(tmp.isFile())
        {
            System.out.println("파일입니다.");
        }
        if(tmp.isDirectory())
        {
            System.out.println("디렉토리입니다.");
        }

        // 경로
        System.out.println("상대경로 : " + tmp.getPath()); // 상대경로
        System.out.println("절대경로 : " + tmp.getAbsolutePath()); // 절대경로

        // 디렉토리 생성
        if(!tmp.exists())
        {
            tmp.mkdirs();
        }

        // 파일 목록 확인
        File[] list = tmp.listFiles();
        if(list != null)
        {
            for(File file : list)
            {
                if(file.isFile())
                {
                    System.out.println("File(전체경로) : " + file);
                    System.out.println("File(이름만) : " + file.getName());
                }
            }
        }
        System.out.println("----------------------------------------");
        // 필터처리(원하는 파일만)
        File[] list2 = tmp.listFiles(new FilenameFilter()
        {
            @Override
            public boolean accept(File dir, String name)
            {
                return name.contains(".txt");
                // name.endsWith("t"); - 끝 문자가 t인 파일 필터
                // name.startsWith("s"); - 첫 문자가 s인 파일 필터
            }
        });
        if(list2 != null)
        {
            for(File file : list2)
            {
                if(file.isFile())
                {
                    System.out.println(file);
                }
            }
        }
    }
}
