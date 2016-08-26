package csjobs.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import csjobs.model.Job;
import csjobs.model.dao.JobDao;

@Controller
@SessionAttributes("jobs")
public class HomeController {

	@Autowired
	private JobDao jobDao;

	@RequestMapping(value={ "/index.html", "/home.html" })
	public String home(ModelMap models) {

		List<Job> jobs =jobDao.openJobs();
		models.put("jobs", jobs);
		return "home";
	}

	@RequestMapping("/viewjob/{id}.html")
	public String view1(@PathVariable long id, ModelMap models) {
		models.put("viewjob", jobDao.getJob(id));
		return "viewjob";
	}

}
