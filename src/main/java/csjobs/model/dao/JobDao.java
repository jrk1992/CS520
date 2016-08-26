package csjobs.model.dao;

import java.util.List;

import csjobs.model.Job;
import csjobs.model.User;

public interface JobDao {

	List<Job> getJobs();
	
	List<Job> openJobs();
	
	List<Job> getlatestJobs();
	
	Job getJob(long id);
	
	Job saveJob(Job job);
	
	List<Job> getRemainingJobs(long userid);
	
	
}
