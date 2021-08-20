
package org.zerock.controller;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	 
	private BoardService service;
	
	
	/*
	 * @GetMapping("/list") public void list(Model model) {
	 * 
	 * log.info("list");
	 * 
	 * model.addAttribute("list", service.getList()); }
	 */
	
	@GetMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri, Model model) {
		  log.info("list: " + cri);
		  int total = service.getTotal(cri);
		  
		  List<BoardVO> list = service.getList(cri);
		  
		 model.addAttribute("list", list); 
		model.addAttribute("pageMaker", new PageDTO(cri, total)); 
		 
		 }
	
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")  
	public String register(BoardVO board, 
			@RequestParam("file") MultipartFile file, RedirectAttributes rttr) {
		log.info("register:" + board);
		
		board.setFileName(file.getOriginalFilename());
		
		service.register(board, file);
		
		rttr.addFlashAttribute("result", board.getBno());
		
		return "redirect:/board/list";
		
	}
	
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bno") Long bno, Model model) {
		
	  log.info("/get or modify");
      model.addAttribute("board", service.get(bno));
 } 
	
	@PostMapping("/modify")
	@PreAuthorize("principal.username == #board.writer")
	public String modify(BoardVO board, Criteria cri,
			 @RequestParam("file") MultipartFile file, RedirectAttributes rttr) {
		log.info("modify"+board);
		
		boolean success = service.modify(board,file);
		
		if(service.modfiy(board)) {
			rttr.addFlashAttribute("result","success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		
		return "redirect:/board/list";
	}
	 
	@PostMapping("/remove")
	@PreAuthorize("principal.username == #writer")
	public String remove(@RequestParam("bno") Long bno, 
		Criteria cri,RedirectAttributes rttr,String writer) {
		log.info("remove..." + bno);
		
		boolean success = service.remove(bno);
		
		if(success) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()") 
	public void register() {
		 
	}

}











