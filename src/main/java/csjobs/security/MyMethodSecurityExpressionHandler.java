package csjobs.security;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.JobDao;
import csjobs.model.dao.UserDao;

@Component("myMethodSecurityExpressionHandler")
public class MyMethodSecurityExpressionHandler {
	@Autowired
	JobDao jobDao;
	
	@Autowired
	UserDao userDao;
	public boolean hasPermission(String reviewer,Job j) {
    	boolean x=false;
    	List<User> reviewers=j.getCommitteeMembers();
    	for(int i=0;i<reviewers.size();i++){
    		if(reviewer.equals(reviewers.get(i).getEmail())){
    			x=true;
    		}else{
    			x=false;
    		}
    	}
    	
    	
        return x;
    }
	

}
