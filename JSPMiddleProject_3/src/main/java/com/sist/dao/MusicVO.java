package com.sist.dao;

import lombok.Data;

@Data
public class MusicVO {
    private int no;          // NO -> NUMBER(3)
    private int cno;         // CNO -> NUMBER(1)
    private String title;    // TITLE -> VARCHAR2(300)
    private String singer;   // SINGER -> VARCHAR2(200)
    private String album;    // ALBUM -> VARCHAR2(200)
    private String poster;   // POSTER -> VARCHAR2(260)
    private String state;    // STATE -> CHAR(6)
    private int idcrement;   // IDCREMENT -> NUMBER(3)
}