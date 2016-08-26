package csjobs.web.validator;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import csjobs.model.Application;

@Component
public class ApplicationValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Application.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) 
	{
		Application application = (Application) target;
		
		
		
			
		if( !StringUtils.hasText(application.getCurrentJobTitle() ))
		{
			errors.rejectValue("currentJobTitle", "error.field.empty");
		}
		
		if( !StringUtils.hasText(application.getCurrentJobInstitution() ))
		{
			errors.rejectValue("currentJobInstitution", "error.field.empty");
		}
		
		if( application.getCurrentJobYear()==null)
		{
			errors.rejectValue("currentJobYear", "error.field.empty");
		}
		
		
		
		
	}

}
