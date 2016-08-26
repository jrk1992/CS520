package csjobs.model.dao;

import java.util.List;

import csjobs.model.Application;
import csjobs.model.Job;

public interface ApplicationDao {

	List<Application> getApplications();
	
	Application getApplication(long id);
	
	List<Application> getSubmittedApplications(long userid);
	
	Application saveApplication(Application application);
}
