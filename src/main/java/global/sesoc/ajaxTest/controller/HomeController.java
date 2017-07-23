package global.sesoc.ajaxTest.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.ajaxTest.repository.CommentRepository;
import global.sesoc.ajaxTest.vo.Comment;

@Controller
public class HomeController {
	
	@Autowired
	CommentRepository cr;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		return "comment";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public @ResponseBody String insert(Comment c) {
		String result = intResult(cr.insert(c));
		return result;
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public @ResponseBody String delete(int num) {
		String result = intResult(cr.delete(num));
		return result;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Comment> list() {
		ArrayList<Comment> cList = cr.list();
		return cList;
	}
	
	public String intResult(int r){
		String result = "fail";
		if (r==1) {
			result = "success";
		}
		return result;
	}
	
}
