package org.zerock.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;


public interface BoardService { 

	public void register(BoardVO board);
	
	public BoardVO get(Long bno);
	
	public boolean modfiy(BoardVO board);
	
	public boolean remove(Long bno);
	
	//public List<BoardVO> getList();
	
	public List<BoardVO> getList(Criteria cri);

	public int getTotal(Criteria cri);
	
	public void register(BoardVO board, MultipartFile file);

	public boolean modify(BoardVO board, MultipartFile file);

	boolean modify(BoardVO board);

	
}