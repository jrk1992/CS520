package csjobs.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.JobDao;
import csjobs.model.dao.UserDao;

@Controller
@SessionAttributes("currentUser")
public class LoginController {

	@Autowired
	UserDao userDao;
	
	@Autowired
	JobDao jobDao;



	@RequestMapping(value="/login.html",method=RequestMethod.GET)
	public String login()
	{
		return "login";
	}

	/*@RequestMapping(value="/login.html",method=RequestMethod.POST)
	public String login(@RequestParam String username,@RequestParam String password,ModelMap models)
	{
		List<User> users=userDao.getUsers();
		String invalid="invalid credentials";
		for(int i=0;i<users.size();i++){
			if(username!=null && password!=null){
				if(users.get(i).getEmail().matches(username) && users.get(i).getPassword().matches(password) ){
					models.put("currentUser", users.get(i));
					if(users.get(i).isAdmin()){
						return "redirect:admin.html";
					}else if(users.get(i).isReviewer()){
						return "redirect:reviewer.html";
					}else{
						return "redirect:applicant.html";
					}
				}
			}else{
				models.put("isempty", true);
				return "login";
			}
		}
		models.put("invalid", invalid);
		return "login";
	}
*/

	@RequestMapping(value="/admin.html")
	public String gotoAdmin(ModelMap models,HttpSession session)
	{
		User user=(User) session.getAttribute("currentUser");
		System.out.println(user.getFirstName());
		List<Job> alljobs=jobDao.getlatestJobs();
		models.put("alljobs", alljobs);
	
		return "admin";
	}

	@RequestMapping(value="/reviewer.html")
	public String gotoReviewer()
	{
		return "reviewer";
	}

	

	/*@RequestMapping("/logout.html")
	public String logout(SessionStatus status,ModelMap models)
	{
		models.remove("currentUser");
		//request.removeAttribute("currentUser", WebRequest.SCOPE_SESSION);
		status.setComplete();
		return "redirect:home.html";
	}*/

}







