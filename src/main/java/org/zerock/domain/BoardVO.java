package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data 
public class BoardVO {
   
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private String writerName; //답글 
	
	private Date regdate;
	private Date updateDate;
	
    private int replyCnt; // 답글
	
	private String fileName; //파일 
	 
}
