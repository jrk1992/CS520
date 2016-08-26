package csjobs.web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.JobDao;
import csjobs.model.dao.UserDao;

@Controller
public class JobController {

	@Autowired
	UserDao userDao;

	@Autowired
	JobDao jobDao;

	@RequestMapping(value = { "/addJob.html" }, method = RequestMethod.GET)
	public String addJob1(ModelMap models) {
		List<User> users = userDao.getUsers();
		List<User> reviewers = new ArrayList<User>();
		for (User user : users) {
			if (user.isReviewer()) {
				reviewers.add(user);
			}
		}

		models.put("reviewers", reviewers);
		return "addJob";
	}

	@RequestMapping(value = { "addJob.html" }, method = RequestMethod.POST)
	public String addJob2(@RequestParam String jtitle,
			@RequestParam String jdescription, @RequestParam String pdate,
			@RequestParam String cdate, @RequestParam long chairid,
			@RequestParam long[] members) throws ParseException {
		List<User> users = userDao.getUsers();
		Job job = new Job();
		if (jtitle == null) {
			return "redirect:addJob.html";
		} else {
			job.setTitle(jtitle);
		}
		if (jdescription == null) {
			job.setDescription(null);
		} else {
			job.setDescription(jdescription);
		}

		for (User user : users) {
			if (chairid == user.getId()) {
				job.setCommitteeChair(user);
			}
		}

		List<User> committee = new ArrayList<User>();

		for (User user : users) {
			if (user.getId() == chairid) {
				committee.add(user);
			}
			for (int i = 0; i < members.length; i++) {

				if (user.getId() == members[i]) {
					if (user.getId() != chairid)
						committee.add(user);
				}
			}
		}
		job.setCommitteeMembers(committee);

		SimpleDateFormat sdf = new SimpleDateFormat("M/d/yyyy");

		if (pdate.equals("")) {
			job.setPublishDate(null);
		} else {
			try {
				Date d = sdf.parse(pdate);
				job.setPublishDate(d);
			} catch (Exception e) {
				return "redirect:addJob.html";
			}

			// System.out.println("---"+sdf.format(pdate));
		}
		if (cdate.equals("")) {
			job.setCloseDate(null);
		} else {
			try {
				Date d = sdf.parse(cdate);
				job.setCloseDate(d);
			} catch (Exception e) {
				return "redirect:addJob.html";
			}

		}
		jobDao.saveJob(job);

		return "redirect:admin.html";
	}
	
	
	@RequestMapping(value = { "editJob.html" }, method = RequestMethod.GET)
	public String edit1(ModelMap models,@RequestParam long id) {
		List<User> users = userDao.getUsers();
		List<User> reviewers = new ArrayList<User>();
		for (User user : users) {
			if (user.isReviewer()) {
				reviewers.add(user);
			}
		}

		models.put("reviewers", reviewers);
		models.put("editJob", jobDao.getJob(id));
			
		return "editJob";
	}
	
	
	@RequestMapping(value = { "editJob.html" }, method = RequestMethod.POST)
	public String edit2(@RequestParam String jtitle,@RequestParam long id,
			@RequestParam String jdescription, @RequestParam String pdate,
			@RequestParam String cdate, @RequestParam long chairid,
			@RequestParam long[] members) throws ParseException {
		List<User> users = userDao.getUsers();
		Job job=jobDao.getJob(id);
		
			job.setTitle(jtitle);
		
		if (jdescription == null) {
			job.setDescription(null);
		} else {
			job.setDescription(jdescription);
		}

		for (User user : users) {
			if (chairid == user.getId()) {
				job.setCommitteeChair(user);
			}
		}

		List<User> committee = new ArrayList<User>();

		for (User user : users) {
			if (user.getId() == chairid) {
				committee.add(user);
			}
			for (int i = 0; i < members.length; i++) {

				if (user.getId() == members[i]) {
					if (user.getId() != chairid)
						committee.add(user);
				}
			}
		}
		job.setCommitteeMembers(committee);

		SimpleDateFormat sdf = new SimpleDateFormat("M/d/yyyy");

		if (pdate.equals("")) {
			job.setPublishDate(null);
		} else {
			try {
				Date d = sdf.parse(pdate);
				job.setPublishDate(d);
			} catch (Exception e) {
				return "redirect:editJob.html";
			}

			// System.out.println("---"+sdf.format(pdate));
		}
		if (cdate.equals("")) {
			job.setCloseDate(null);
		} else {
			try {
				Date d = sdf.parse(cdate);
				job.setCloseDate(d);
			} catch (Exception e) {
				return "redirect:editJob.html";
			}

		}
		jobDao.saveJob(job);

		return "redirect:admin.html";
	}

}
