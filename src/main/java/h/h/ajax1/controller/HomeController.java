package h.h.ajax1.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import h.h.ajax1.repository.customerRepository;
import h.h.ajax1.vo.Customer;

@Controller
public class HomeController {
	
	@Autowired
	customerRepository cr;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		return "home";
	}
	
	@RequestMapping(value = "/ajaxtest", method = RequestMethod.GET)
	public @ResponseBody String test1(Customer myData) {
		logger.info("server 도착! "+myData);
		String result = intResult(cr.insert(myData));
		return result;
	}
	
	@RequestMapping(value = "/ajaxtest2", method = RequestMethod.GET)
	public @ResponseBody Customer test2() {
		Customer customer = new Customer("JS","1234","abc");
		return customer;
	}
	
	@RequestMapping(value = "/ajaxtest3", method = RequestMethod.GET)
	public @ResponseBody List<Customer> test3() {
		List<Customer> list = new ArrayList<>();
		list.add(new Customer("이1","정1","식1"));
		list.add(new Customer("이2","정2","식2"));
		list.add(new Customer("이3","정3","식3"));
		list.add(new Customer("이4","정4","식4"));
		list.add(new Customer("이5","정5","식5"));
		return list;
	}
	
	public String intResult(int r){
		String result = "fail";
		if (r==1) {
			result = "success";
		}
		return result;
	}
	
}
