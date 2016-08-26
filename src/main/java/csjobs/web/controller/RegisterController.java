package csjobs.web.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import csjobs.model.User;
import csjobs.model.dao.UserDao;
import csjobs.web.validator.UserValidator;

@Controller
@SessionAttributes("user")
public class RegisterController {

	@Autowired
	private UserDao userDao;

	@Autowired
	private UserValidator userValidator;

	@RequestMapping("/register.html")
	public String register(){

		return "register";
	}


	@RequestMapping(value="/register.html", method=RequestMethod.GET)
	public String add( ModelMap models)
	{
		models.put("user", new User());
		return "register";
	}

	@RequestMapping(value="/register.html", method=RequestMethod.POST)
	public String add(@ModelAttribute User user, BindingResult result,ModelMap models)
	{
		boolean error=false;
		List<User> users= userDao.getUsers();
		for(int i=0;i<users.size();i++){
			if(users.get(i).getEmail().equalsIgnoreCase(user.getEmail())){
				error=true;
				models.put("error",error);
			}
		}
		userValidator.validate(user, result);
		if(result.hasErrors() || error==true)
		{
			return "register";
		}
		Set<String> role= new HashSet<String>();
		role.add("ROLE_APPLICANT");
		user.setRoles(role);
		//save user to database
		user = userDao.saveUser(user);

		//redirect to user list view
		return "redirect:home.html";
	}
}
