package csjobs.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import csjobs.model.Application;
import csjobs.model.Degree;
import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.ApplicationDao;
import csjobs.web.validator.ApplicationValidator;

@Controller
@SessionAttributes("application")
public class ApplyController {

	@Autowired
	ApplicationDao applicationDao;
	
	@Autowired
    private ServletContext context;

	@Autowired
	ApplicationValidator applicationValidator;
	@RequestMapping(value="/applyjob.html", method=RequestMethod.GET)
	public String apply1( ModelMap models,@RequestParam long jobid,HttpSession session)
	{
		session.removeAttribute("showdegrees");
		Application application=new  Application();
		session.setAttribute("jobid", jobid);
		User applicant = (User) session.getAttribute("currentUser");
		application.setApplicant(applicant);
		List<Degree> degrees=new ArrayList<Degree>();
		List<Job> jobs=(List<Job>) session.getAttribute("jobsleft");
		for(Job j:jobs){
			if(j.getId()==jobid){
				application.setJob(j);
				break;
			}
		}
		application.setDegrees(degrees);
		models.put("application",application);
		return "applyjob";
	}

	@RequestMapping(value="/applyjob.html", method=RequestMethod.POST)
	public String apply2(@ModelAttribute Application application, BindingResult result,ModelMap models,HttpSession session,@RequestParam long jobid)
	{
		
		applicationValidator.validate(application, result);
		if(!result.hasErrors() )
		{
			models.put("application", application);
			application.setSubmitDate(new Date());
			return "redirect:degreeadd.html";
		}
		return "applyjob";
	}

	//------------------------------------------------------------------------------------------------------
	
	
	
	
	
	
	@RequestMapping(value="/degreeadd.html", method=RequestMethod.GET)
	public String degree1(ModelMap models,HttpSession session){
		/*Degree adddegree=new Degree();
		models.put("adddegree", adddegree);*/
		/*Application application=(Application) session.getAttribute("application");
		List<Degree> degrees=application.getDegrees();
		models.put("application", application)*/;
		return "degreeadd";
	}

	@RequestMapping(value="/degreeadd.html", method=RequestMethod.POST)
	public String degree2(@ModelAttribute Application application,ModelMap models,@RequestParam String degree,@RequestParam String school,@RequestParam int year,HttpSession session){
		
		//long jobid=(long) session.getAttribute("jobid");
		//Application application=(Application) session.getAttribute("application");
		List<Degree> degrees=application.getDegrees();
		Degree adddegree=new Degree();
		
		//if(degree!=null && school!=null && year>1){
			adddegree.setName(degree);
			adddegree.setSchool(school);
			adddegree.setYear(year);
			
			degrees.add(adddegree);
			application.setDegrees(degrees);
			models.put("application",application);
			session.setAttribute("showdegrees", degrees);
			
			//degreeDao.saveDegree(adddegree);
			
		//}
		String path="redirect:applicant.html";
		//return path;
		
		
		return "degreeadd";
	}
	
	
	
	
	
	
	
	
	//-------------------------------------------------------------------------------------------------------
	
	
	
	
	@RequestMapping("save.html")
	public String finish(HttpSession session,ModelMap models,@ModelAttribute Application application){
		//Application application=(Application) session.getAttribute("application");
		application=applicationDao.saveApplication(application);
		models.put("application",application);
		session.setAttribute("showdegrees",null);
		return "redirect:upload.html";
	}

	 @RequestMapping(value = "upload.html", method = RequestMethod.GET)
	    public String upload1(){
	    	return "upload";
	    }
	    
	    private File getFileDirectory(){
	    	String path=context.getRealPath("/WEB-INF/files");
	    	return new File(path);
	    	
	    }
	    
	    
	  
	    @RequestMapping(value = "upload.html",
	            method = RequestMethod.POST)
	    public String upload2(@ModelAttribute Application application,@RequestParam MultipartFile resume,@RequestParam MultipartFile research,@RequestParam MultipartFile teaching) throws IllegalStateException, IOException{
	    	
	    	resume.transferTo(new File(getFileDirectory(),"resume"+application.getId()+resume.getOriginalFilename()));
	    	research.transferTo(new File(getFileDirectory(),"research"+application.getId()+research.getOriginalFilename()));
	    	teaching.transferTo(new File(getFileDirectory(),"teaching"+application.getId()+teaching.getOriginalFilename()));
	    	
	    	
	    	csjobs.model.File cv=new csjobs.model.File();
	    	cv.setDate(new Date());
	    	cv.setName("resume"+application.getId()+resume.getOriginalFilename());
	    	cv.setOwner(application.getApplicant());
	    	cv.setSize(resume.getSize());
	    	cv.setType(resume.getContentType());
	    	
	    	application.setCv(cv);
	    	
	    	
	    	csjobs.model.File Rstatement=new csjobs.model.File();
	    	Rstatement.setDate(new Date());
	    	Rstatement.setName("research"+application.getId()+research.getOriginalFilename());
	    	Rstatement.setOwner(application.getApplicant());
	    	Rstatement.setSize(research.getSize());
	    	Rstatement.setType(research.getContentType());
	    	
	    	application.setResearchStatement(Rstatement);
	    	
	    	
	    	csjobs.model.File Tstatement=new csjobs.model.File();
	    	Tstatement.setDate(new Date());
	    	Tstatement.setName("teaching"+application.getId()+teaching.getOriginalFilename());
	    	Tstatement.setOwner(application.getApplicant());
	    	Tstatement.setSize(teaching.getSize());
	    	Tstatement.setType(teaching.getContentType());
	    	
	    	application.setTeachingStatement(Tstatement);
	    	applicationDao.saveApplication( application );
	    	
	    	
	    	return "redirect:applicant.html";
	    }
	    
	    @RequestMapping(value="download.html")
	    public String download(HttpSession session,HttpServletResponse response,@RequestParam String filetype) throws IOException{
	    	Application application=(Application) session.getAttribute("app");

	    	csjobs.model.File file;
	    	if(filetype.equals("cv")){
	    		file=application.getCv();
	    	}else if(filetype.equals("research")){
	    		file=application.getResearchStatement();
	    	}else{
	    		file=application.getTeachingStatement();
	    	}
	    	
	    	response.setContentType( file.getType() );
	        response.setHeader( "Content-Disposition",
	            "attachment; filename="+file.getName() );
	    	FileInputStream in=new FileInputStream(new File(getFileDirectory(),file.getName()));
	    	OutputStream out=response.getOutputStream();
	    	
	    	 byte buffer[] = new byte[2048];
	         int bytesRead;
	         while( (bytesRead = in.read( buffer )) > 0 )
	             out.write( buffer, 0, bytesRead );

	         in.close();
	    	
	    	
	    	return null;
	    }
	
	

}







