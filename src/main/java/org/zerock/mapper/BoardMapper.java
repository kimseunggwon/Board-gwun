package org.zerock.mapper;

import java.util.List;



import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;


public interface BoardMapper {
	
  //@Select("select * from tbl_board where bno > 0") xml에 쿼리문 작성함
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO board);

	public int getTotalCount(Criteria cri);

	public void removeByUserid(MemberVO vo); 
	 

}
