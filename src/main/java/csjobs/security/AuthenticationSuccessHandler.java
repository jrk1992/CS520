package csjobs.security;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import csjobs.model.User;
import csjobs.model.dao.UserDao;

@Component
public class AuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	
	@Autowired
	UserDao userDao;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,HttpServletResponse response,
			Authentication authentication) throws ServletException,IOException{
		System.out.println("---------------inside");
		 System.out.println(authentication.getName());
		
		 User user=userDao.getUser(authentication.getName());
		 HttpSession session = request.getSession(true);
		// session.setAttribute("authenticUser", user);
		 session.setAttribute("currentUser", user);
		if(user.isAdmin()){
			
			response.sendRedirect("/csjobs/admin.html");
		}else if(user.isReviewer()){
			response.sendRedirect("/csjobs/reviewer.html");
		}else{
			response.sendRedirect("/csjobs/applicant.html");
		}
		
		
		
	}

}
