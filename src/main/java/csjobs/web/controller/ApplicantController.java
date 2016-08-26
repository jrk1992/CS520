package csjobs.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import csjobs.model.Application;
import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.ApplicationDao;
import csjobs.model.dao.JobDao;

@Controller
@SessionAttributes("jobsleft")
public class ApplicantController {

	@Autowired
	ApplicationDao applicationDao;

	@Autowired
	JobDao jobDao;

	@RequestMapping(value = "/applicant.html")
	public String gotoApplicant(ModelMap models, HttpSession session) {
		
		User applicant = (User) session.getAttribute("currentUser");
		long id=0L;
		try{
			id = applicant.getId();
		}catch(Exception e){
			return "redirect:login.html";
		}
		List<Application> applicationsmade = applicationDao
				.getSubmittedApplications(id);
		models.put("applicationsmade", applicationsmade);

		List<Job> jobsremaining = jobDao.getRemainingJobs(id);
		List<Job> jobsleft=new ArrayList<Job>();
		for(Job job:jobsremaining){
			if((job.isClosed()==false)&&(job.isPublished())){
				jobsleft.add(job);
			}
		}
		models.put("jobsleft", jobsleft);

		return "applicant";
	}

	@RequestMapping("/viewapplication/{id}.html")
	public String view1(@PathVariable long id, ModelMap models,HttpSession session) {
		
		models.put("viewapplication", applicationDao.getApplication(id));
		 session.setAttribute("app", applicationDao.getApplication( id ));
		return "viewapplication";
	}

	@RequestMapping("/viewjobdetails/{id}.html")
	public String view2(@PathVariable long id, ModelMap models) {
		models.put("viewjobdetails", jobDao.getJob(id));
		return "viewjobdetails";
	}
	
	
}
