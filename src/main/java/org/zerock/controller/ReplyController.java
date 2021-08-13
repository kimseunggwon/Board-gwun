package org.zerock.controller;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replise")
@RestController
@Log4j 
@AllArgsConstructor
public class ReplyController {

	private ReplyService service;
	
	/*
	 * @Autowired public ReplyController(ReplyService service) { this.service =
	 * service; }
	 */
     
	/*
	 list 글에 새로운 댓글 작성 controller 
	 */
	@PostMapping("/new")
	
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {

		int cnt = service.register(vo);

		if (cnt == 1) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
   }
	
	/*
	 특정 게시물의 댓글 목록을 확인할때(번호 확인)
	 // bno : 게시물 번호
	 */
	@GetMapping("/pages/{bno}")
	public List<ReplyVO> getList(@PathVariable("bno") Long bno) {

		return service.getList(bno);
	}
	
	/*
	 게시물 댓글 삭제 ,조회   rno : 게시물 댓글
	 */
	@GetMapping("/{rno}")
	public ReplyVO get(@PathVariable Long rno) {

		return service.get(rno);
	}
	
	
//	@RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
	@DeleteMapping("/{rno}")

	public ResponseEntity<String> remove(@PathVariable Long rno, @RequestBody ReplyVO vo) {

		int cnt = service.remove(rno);

		if (cnt == 1) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	/*
	 댓글 수정
	 */
	@RequestMapping(value = "/{rno}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable Long rno) {
		
		int cnt = service.modify(vo);

		if (cnt == 1) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
